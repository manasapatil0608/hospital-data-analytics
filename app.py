from flask import Flask, request, render_template
import pandas as pd
import pyodbc
from werkzeug.utils import secure_filename
import os

app = Flask(__name__)

# SQL Server connection settings
SERVER = r'manasa\SQLEXPRESS'
DATABASE = 'hospital_data'
DRIVER = '{ODBC Driver 18 for SQL Server}'

UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)


def get_connection():
    connection_string = (
        f'DRIVER={DRIVER};'
        f'SERVER={SERVER};'
        f'DATABASE={DATABASE};'
        f'Trusted_Connection=yes;'
	f'TrustServerCertificate=yes;'
    )

    return pyodbc.connect(connection_string)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/upload', methods=['POST'])
def upload_file():

    file = request.files.get('file')
    table_name = request.form.get('table_name')

    if not file:
        return "Please select a file."

    if not table_name:
        return "Please enter a table name."

    filename = secure_filename(file.filename)
    filepath = os.path.join(UPLOAD_FOLDER, filename)

    file.save(filepath)

    try:

        # Read Excel or CSV
        if filename.lower().endswith('.csv'):
            df = pd.read_csv(filepath)

        elif filename.lower().endswith(('.xlsx', '.xls')):
            df = pd.read_excel(filepath)

        else:
            return "Only CSV, XLSX, and XLS files are supported."

        # Connect to SQL Server
        conn = get_connection()
        cursor = conn.cursor()

        # Create table automatically
        columns = []

        for column in df.columns:
            columns.append(f'[{column}] NVARCHAR(MAX)')

        create_table_sql = f"""
        IF OBJECT_ID(N'dbo.{table_name}', N'U') IS NULL
        BEGIN
            CREATE TABLE dbo.[{table_name}] (
                {', '.join(columns)}
            )
        END
        """

        cursor.execute(create_table_sql)
        conn.commit()

        # Insert data
        column_names = ', '.join([f'[{col}]' for col in df.columns])
        placeholders = ', '.join(['?' for _ in df.columns])

        insert_sql = f"""
        INSERT INTO dbo.[{table_name}]
        ({column_names})
        VALUES ({placeholders})
        """

        for _, row in df.iterrows():

            values = [
                None if pd.isna(value) else str(value)
                for value in row
            ]

            cursor.execute(insert_sql, values)

        conn.commit()

        cursor.close()
        conn.close()

        return f"Successfully uploaded {len(df)} rows into dbo.{table_name}"

    except Exception as e:
        return f"Error: {str(e)}"


if __name__ == '__main__':
    app.run(debug=True)