{
  "students": [
    "student_id (PK)",
    "name (NOT NULL)",
    "phone (UNIQUE, INDEX)",
    "email (UNIQUE, INDEX)",
    "batch_id (FK -> batches.batch_id, INDEX)",
    "join_date (NOT NULL)",
    "status (ENUM: active/inactive, DEFAULT active)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ],

  "batches": [
    "batch_id (PK)",
    "batch_name (NOT NULL)",
    "course_id (FK -> courses.course_id, INDEX)",
    "start_date (NOT NULL)",
    "end_date",
    "schedule_type (ENUM: MWF/SS/custom)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ],

  "courses": [
    "course_id (PK)",
    "course_name (NOT NULL, UNIQUE)",
    "duration_in_days (NOT NULL)",
    "fees (NOT NULL)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ],

  "teachers": [
    "teacher_id (PK)",
    "name (NOT NULL)",
    "phone (UNIQUE, INDEX)",
    "email (UNIQUE, INDEX)",
    "specialization",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ],

  "batch_teachers": [
    "id (PK)",
    "batch_id (FK -> batches.batch_id, INDEX)",
    "teacher_id (FK -> teachers.teacher_id, INDEX)",
    "UNIQUE(batch_id, teacher_id)"
  ],

  "classes": [
    "class_id (PK)",
    "batch_id (FK -> batches.batch_id, INDEX)",
    "teacher_id (FK -> teachers.teacher_id, INDEX)",
    "class_date (INDEX)",
    "start_time",
    "end_time",
    "topic",
    "status (ENUM: scheduled/completed/cancelled, DEFAULT scheduled)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ],

  "attendance": [
    "attendance_id (PK)",
    "class_id (FK -> classes.class_id, INDEX)",
    "student_id (FK -> students.student_id, INDEX)",
    "status (ENUM: present/absent/late)",
    "remarks",
    "marked_by (FK -> teachers.teacher_id)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)",
    "UNIQUE(class_id, student_id)"
  ],

  "fees_payments": [
    "payment_id (PK)",
    "student_id (FK -> students.student_id, INDEX)",
    "amount (NOT NULL)",
    "payment_date (INDEX)",
    "payment_mode (ENUM: cash/upi/card)",
    "status (ENUM: paid/pending/failed)",
    "transaction_id (UNIQUE)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ],

  "assignments": [
    "assignment_id (PK)",
    "batch_id (FK -> batches.batch_id, INDEX)",
    "title (NOT NULL)",
    "description",
    "due_date (INDEX)",
    "created_by (FK -> teachers.teacher_id)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ],

  "assignment_submissions": [
    "submission_id (PK)",
    "assignment_id (FK -> assignments.assignment_id, INDEX)",
    "student_id (FK -> students.student_id, INDEX)",
    "submitted_at",
    "file_url",
    "marks",
    "remarks",
    "UNIQUE(assignment_id, student_id)"
  ],

  "notifications": [
    "notification_id (PK)",
    "title (NOT NULL)",
    "message (NOT NULL)",
    "target_type (ENUM: student/batch/all)",
    "target_id (INDEX)",
    "sent_at"
  ],

  "student_activity_logs": [
    "log_id (PK)",
    "student_id (FK -> students.student_id, INDEX)",
    "activity_type (ENUM: login/attendance/payment)",
    "reference_id (INDEX)",
    "created_at (DEFAULT CURRENT_TIMESTAMP)"
  ]
}