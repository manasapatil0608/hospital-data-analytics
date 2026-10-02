USE hospital_data;
GO

CREATE OR ALTER VIEW dbo.vw_patient_tests AS
SELECT
    patient_test_id,
    patient_id,
    test_id,
    doctor_id,

    TRY_CONVERT(DATE, test_date) AS test_date,
    TRY_CONVERT(DATE, result_date) AS result_date,

    status,
    result,
    notes,

    TRY_CONVERT(DECIMAL(12,2), amount) AS amount,

    payment_method,

    TRY_CONVERT(DECIMAL(12,2), discount) AS discount,

    Medical_test_name AS medical_test_name,
    Medical_category AS medical_category

FROM dbo.Patient_tests;
GO


SELECT TOP 20 *
FROM dbo.vw_patient_tests;