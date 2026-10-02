USE hospital_data;
GO

CREATE OR ALTER VIEW dbo.vw_appointment AS
SELECT
    appointment_id,
    patient_id,
    doctor_id,

    TRY_CONVERT(DATE, appointment_date) AS appointment_date,
    appointment_time,

    status,
    reason,
    notes,
    suggest,

    TRY_CONVERT(DECIMAL(12,2), fees) AS fees,

    payment_method,

    TRY_CONVERT(DECIMAL(12,2), discount) AS discount,

    diagnosis

FROM dbo.Appointment;
GO


SELECT TOP 20 *
FROM dbo.vw_appointment;