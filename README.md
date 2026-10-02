\# Hospital Data Analytics Dashboard



\## Project Overview



This project demonstrates an end-to-end data analytics workflow for hospital data using \*\*Python, Flask, Microsoft SQL Server, SQL, and Power BI\*\*.



The solution allows Excel-based hospital data to be uploaded through a Flask application, stored and processed in SQL Server, transformed through SQL views, and analyzed through an interactive Power BI dashboard.



The project demonstrates skills in:



\- Python and Flask

\- Excel data ingestion

\- SQL Server

\- SQL data transformation

\- Data validation and cleaning

\- Relational data modeling

\- DAX

\- Power BI

\- Data visualization

\- Git and GitHub



\---



\## Architecture



```text

Hospital Excel Data

&#x20;       |

&#x20;       v

Python / Flask Excel Uploader

&#x20;       |

&#x20;       v

Microsoft SQL Server

&#x20;  hospital\_data

&#x20;       |

&#x20;       v

SQL Transformation Views

&#x20;       |

&#x20;       v

Power BI Data Model

&#x20;       |

&#x20;       v

Interactive Hospital Dashboard

```



\---



\## Technology Stack



| Technology | Purpose |

|---|---|

| Python | Data processing and application logic |

| Flask | Web-based Excel uploader |

| Pandas | Excel data processing |

| OpenPyXL | Excel file handling |

| PyODBC | Python-to-SQL Server connectivity |

| SQL Server | Hospital data storage |

| SQL | Data transformation and validation |

| Power BI | Data modeling and visualization |

| DAX | KPI and analytical calculations |

| Git | Version control |

| GitHub | Project repository and documentation |



\---



\## Dataset Structure



The hospital analytics solution uses six primary datasets:



\### Patient



Contains patient demographics, admission information, billing information, doctor details, patient ratings, and feedback.



\### Appointment



Contains patient appointments, assigned doctors, appointment dates, status, fees, diagnosis, and related information.



\### Patient Tests



Contains medical test information including test dates, results, status, costs, and medical test categories.



\### Medical Patient



Acts as the transaction table connecting patients with medicines and medicine quantities.



\### Medical Stock



Contains medicine information including category, supplier, pricing, inventory quantity, expiry dates, and reorder levels.



\### Staff



Contains hospital staff information including department, role, salary, joining date, and shift.



\---



\## SQL Transformation Layer



SQL views were created to prepare clean datasets for reporting:



```text

vw\_patient\_info

vw\_appointment

vw\_patient\_tests

vw\_medical\_patient

vw\_medical\_stock\_info

vw\_staff

```



These views provide the transformation layer between the raw SQL Server tables and Power BI.



The SQL layer handles tasks such as:



\- Data type conversion

\- Null handling

\- Data standardization

\- Preparing patient information

\- Preparing medicine transactions

\- Preparing medical stock information

\- Preparing appointment and medical-test data

\- Creating reporting-ready datasets



The SQL scripts are available in the `sql/` directory.



\---



\## Power BI Data Model



The Power BI model connects the datasets using patient and medicine identifiers.



Major relationships include:



```text

Patient

&#x20;  |

&#x20;  +---- Appointment

&#x20;  |

&#x20;  +---- Patient Tests

&#x20;  |

&#x20;  +---- Medical Patient ---- Medical Stock

```



A dedicated Calendar table was also created using DAX to support time-based analysis.



\---



\## DAX Measures



Several DAX measures were created for dashboard analytics.



\### Total Medicine Quantity



```DAX

Total Sales Quantity =

SUM(vw\_medical\_patient\[quantity])

```



\### Net Total Bill Amount



```DAX

Net Total Bill Amount =

SUM(vw\_patient\_info\[total\_amount])

&#x20;   - SUM(vw\_patient\_info\[discount])

```



\### Average Patient Rating



```DAX

Average Patient Rating =

AVERAGE(vw\_patient\_info\[patient\_rating])

```



\### Patient Satisfaction



```DAX

Patient Satisfaction =

REPT(

&#x20;   "★",

&#x20;   ROUND(\[Average Patient Rating], 0)

)

```



\---



\## Power BI Dashboard



!\[Hospital Data Analytics Dashboard](screenshots/hospital\_dashboard.png)



The interactive hospital dashboard provides a consolidated view of patient, financial, medicine, and clinical information.



\### KPI Indicators



The dashboard includes:



\- Total Medicine Quantity

\- Net Total Bill Amount

\- Paid Amount

\- Patient Satisfaction Rating



\### Medicine Analysis



The dashboard analyzes:



\- Medicine quantity by medicine

\- Medicine activity by day and month

\- Medicine usage for selected patients



\### Financial Analysis



Patient expenses are analyzed across:



\- Room charges

\- Surgery charges

\- Medicine charges

\- Test charges

\- Doctor fees

\- Other hospital charges



\### Patient Analysis



An interactive Patient ID slicer allows users to dynamically view:



\- Patient name

\- Age

\- Gender

\- Blood group

\- Weight

\- Address

\- Admission date

\- Discharge date

\- Assigned doctor

\- Doctor specialization

\- Paid amount

\- Patient satisfaction

\- Patient feedback



Selecting a patient dynamically filters the related dashboard visuals.



\---



\## Project Structure



```text

hospital-data-analytics/

│

├── app.py

├── requirements.txt

├── .gitignore

│

├── templates/

│   └── ...

│

├── sql/

│   ├── vw\_appointment.sql

│   ├── vw\_medical\_patient.sql

│   ├── vw\_medical\_stock\_info.sql

│   ├── vw\_patient\_info.sql

│   ├── vw\_patient\_tests.sql

│   └── vw\_staff.sql

│

└── powerbi/

&#x20;   └── Hospital\_Data\_Analytics\_Dashboard.pbix

```



\---



\## Running the Excel Uploader



\### 1. Clone the repository



```bash

git clone https://github.com/manasapatil0608/hospital-data-analytics.git

```



\### 2. Navigate to the project



```bash

cd hospital-data-analytics

```



\### 3. Create a virtual environment



```bash

python -m venv venv

```



\### 4. Activate the environment on Windows



```bash

venv\\Scripts\\activate

```



\### 5. Install dependencies



```bash

pip install -r requirements.txt

```



\### 6. Configure SQL Server



Update the SQL Server connection configuration in the application for your local environment.



\### 7. Start the Flask application



```bash

python app.py

```



The application runs locally and provides an interface for uploading Excel data.



\---



\## Key Learning Outcomes



This project demonstrates an end-to-end analytics workflow rather than only dashboard creation.



The workflow covers:



```text

Data Ingestion

&#x20;     ↓

Data Storage

&#x20;     ↓

Data Cleaning

&#x20;     ↓

SQL Transformation

&#x20;     ↓

Data Modeling

&#x20;     ↓

DAX Calculations

&#x20;     ↓

Visualization

&#x20;     ↓

Business Insights

```



It demonstrates how Python, SQL Server, SQL, and Power BI can work together as part of a complete analytics solution.



\---



\## Data Privacy



The original hospital data files are intentionally excluded from this repository.



The `.gitignore` prevents Excel/CSV datasets, uploaded files, virtual environments, and environment configuration files from being committed.



No real patient credentials or confidential connection information should be stored in this repository.



\---



\## Author



\*\*Manasa Patil\*\*



Data Engineering | Data Analytics | Business Intelligence | Cloud Technologies

