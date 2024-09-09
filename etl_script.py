from datetime import datetime
import os
import pandas as pd
import pymysql

def extract_mysql():
    mysql_config = {
        'host': 'localhost',
        'user': 'root',
        'password': 'Vikky#446',
        'database': 'etl_DB'
    }
    
    connection = pymysql.connect(**mysql_config)
    query = 'SELECT * FROM empData'
    df = pd.read_sql(query, connection)
    connection.close()
    return df

def transform(df):
    df_transformed = df[df['hourly_pay'] > 25.00]
    return df_transformed
    
def load(df):
    output_dir = '/home/vignesh-nadar/Desktop/sixtyDays/sprint2/Project2/extracted_data'
    os.makedirs(output_dir, exist_ok=True)
    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
    file_name = f'etl_output_{timestamp}.csv'
    file_path = os.path.join(output_dir, file_name)
    df.to_csv(file_path, index=False)
    print(f'Data written to {file_path}')

def etl_process():
    df = extract_mysql()
    df_transformed = transform(df)
    load(df_transformed)

if __name__ == "__main__":
    etl_process()