
---

# ETL Process with Apache Airflow

## Overview

This project sets up an ETL (Extract, Transform, Load) process using Apache Airflow. The workflow extracts data from a MySQL database, transforms it, and loads it into a CSV file. It runs every 5 minutes.

## Prerequisites

1. **Apache Airflow**: Ensure Apache Airflow is installed and set up.
2. **Python**: Python 3.6 or later.
3. **MySQL**: A MySQL database with the required schema and data.
4. **Required Python Libraries**:

   ```bash
   pip install pandas pymysql apache-airflow
   ```

## Project Structure

- `dags/mysql_etl_dag.py`: Defines the Airflow DAG.
- `etl_script.py`: Contains ETL logic.
- `wrapper_script.sh`: Calls the ETL script.

## File Descriptions

### 1. DAG File: `dags/mysql_etl_dag.py`

This file schedules the ETL process using Apache Airflow.

- **`default_args`**: Defines DAG configuration (lines 7-13).
- **`dag`**: Sets up the DAG with a 5-minute schedule interval (lines 15-21).
- **`run_etl`**: Defines a `BashOperator` to execute the `wrapper_script.sh` (lines 23-26).

### 2. ETL Script: `etl_script.py`

This script performs ETL operations.

- **`extract_mysql()`**: Extracts data from MySQL (lines 5-12).
- **`transform(df)`**: Transforms data by filtering rows (lines 14-16).
- **`load(df)`**: Saves transformed data to CSV (lines 18-25).
- **`etl_process()`**: Runs the full ETL process (lines 27-29).

### 3. Wrapper Script: `wrapper_script.sh`

Executes the ETL script.

```bash
#!/bin/bash
python3 /home/vignesh-nadar/Desktop/sixtyDays/sprint2/Project2/etl_script.py
```

## Installation and Setup

1. **Install Apache Airflow**:
   Follow the [Airflow installation guide](https://airflow.apache.org/docs/apache-airflow/stable/installation.html).

2. **Add DAG File to Airflow**:
   Place `mysql_etl_dag.py` in the Airflow `dags` directory.

3. **Make Wrapper Script Executable**:

   ```bash
   chmod +x /home/vignesh-nadar/Desktop/sixtyDays/sprint2/Project2/wrapper_script.sh
   ```

4. **Start Airflow**:

   ```bash
   airflow webserver --daemon
   airflow scheduler --daemon
   ```

5. **Trigger the DAG**:
   Use the Airflow web interface to trigger and monitor the `mysql_etl_dag` DAG.

## Conclusion

In this project, we successfully implemented an ETL (Extract, Transform, Load) process using Apache Airflow to automate data processing workflows. The key components of the project included:

1. **Data Extraction**: We extracted data from a MySQL database using a Python script. The extraction process fetched data from the `empData` table, ensuring that the data was up-to-date and relevant.

2. **Data Transformation**: The extracted data was transformed by filtering out records with `hourly_pay` greater than 25.00. This step ensured that only relevant data was processed further.

3. **Data Loading**: Transformed data was saved into CSV files with timestamps, facilitating easy tracking and archiving of the ETL outputs.

4. **Scheduling with Apache Airflow**: We utilized Apache Airflow to schedule and automate the ETL process. The DAG was configured to run every 5 minutes, ensuring timely and regular execution of the ETL tasks.

5. **Monitoring and Maintenance**: The Airflow web interface provided visibility into the execution of the DAG, allowing us to monitor and troubleshoot the ETL process effectively.

Overall, the project demonstrated the effectiveness of using Apache Airflow for scheduling and orchestrating ETL processes, making data management more efficient and reliable. The integration of Python for data extraction, transformation, and loading ensured that the ETL process was both robust and flexible. This setup can be extended to handle more complex data workflows and integrated with other data sources and destinations as needed.

---