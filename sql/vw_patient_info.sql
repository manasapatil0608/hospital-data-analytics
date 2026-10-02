USE hospital_data;
GO

CREATE OR ALTER VIEW dbo.vw_patient_info AS
SELECT
    patient_id,
    name,
    TRY_CONVERT(INT, age) AS age,
    gender,
    TRY_CONVERT(DECIMAL(10,2), weight) AS weight,
    blood_group,
    address,
    state,
    phone,
    email,

    TRY_CONVERT(DATE, admission_date) AS admission_date,
    TRY_CONVERT(DATE, discharge_date) AS discharge_date,

    Img,

    TRY_CONVERT(DECIMAL(5,2), [Patient Score.rating]) AS patient_rating,
    [Patient Score.feedback] AS patient_feedback,

    TRY_CONVERT(DATE, [Surgery.appointment_date]) AS surgery_appointment_date,
    [Surgery.appointment_time] AS surgery_appointment_time,
    [Surgery.status] AS surgery_status,
    [Surgery.reason] AS surgery_reason,
    Surgery_notes,

    TRY_CONVERT(DECIMAL(12,2), room_charges) AS room_charges,
    TRY_CONVERT(DECIMAL(12,2), surgery_charges) AS surgery_charges,
    TRY_CONVERT(DECIMAL(12,2), medicine_charges) AS medicine_charges,
    TRY_CONVERT(DECIMAL(12,2), test_charges) AS test_charges,
    TRY_CONVERT(DECIMAL(12,2), doctor_fees) AS doctor_fees,
    TRY_CONVERT(DECIMAL(12,2), Hospital_other_charges) AS hospital_other_charges,
    TRY_CONVERT(DECIMAL(12,2), total_amount) AS total_amount,
    TRY_CONVERT(DECIMAL(12,2), discount) AS discount,
    TRY_CONVERT(DECIMAL(12,2), paid_amount) AS paid_amount,

    payment_status,
    payment_method,

    bed_id,
    room_id,
    Beds_status AS bed_status,
    department_id,
    room_type,
    TRY_CONVERT(INT, floor) AS floor,

    TRY_CONVERT(
        DECIMAL(12,2),
        [avg montly maintenance cost]
    ) AS avg_monthly_maintenance_cost,

    departtment_name AS department_name,
    Admit_status AS admit_status,

    doctor_id,
    doctor_name,
    specialization,
    department AS doctor_department,

    TRY_CONVERT(DECIMAL(12,2), doc_salary) AS doctor_salary,

    doc_status AS doctor_status,
    Doc_availability AS doctor_availability,

    TRY_CONVERT(DATE, joining_date) AS doctor_joining_date,

    qualification,
    TRY_CONVERT(INT, experience_years) AS experience_years,

    doc_phone,
    doc_email,
    Staff

FROM dbo.Patient;
GO



SELECT TOP 20 *
FROM dbo.vw_patient_info;