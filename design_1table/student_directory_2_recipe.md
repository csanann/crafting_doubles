# file: student_directory_2_recipe.md

1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyze only the relevant part - here the final line).

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

=> students, names, cohorts

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties: 
student name, cohort

Name of the table (always plural): students

Column names: name, cohort

3. Decide the column types.
id: SERIAL
name: TEXT
cohort_id: Integer

4. Write the SQL.

-- file: students_table.sql

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id) references cohorts(id) on delete cascade
);


5. Create the table.
psql -h 127.0.0.1 student_directory_2 < students_table.sql