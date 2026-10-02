USE hospital_data;
GO

CREATE OR ALTER VIEW dbo.vw_medical_patient AS
SELECT
    patient_id,
    medicine_id,
    TRY_CONVERT(INT, qty) AS quantity,
    TRY_CONVERT(DATE, [date]) AS medicine_date
FROM dbo.Medical_Patient;
GO


SELECT TOP 20 *
FROM dbo.vw_medical_patient;