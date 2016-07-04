- view: responsy_active
  sql_table_name: responsys.responsy_active
  fields:

#### EMAIL EVENTS

  - dimension: open_count
    type: string
    sql: ${TABLE}.open_count 

  - dimension: click_count
    type: string
    sql: ${TABLE}.click_count

  - dimension: bounce_type
    type: string
    sql: ${TABLE}.bounce_type

  - dimension: unsub_type
    type: string
    sql: ${TABLE}.unsub_type
    
  - dimension: unsubscribe_count
    type: string
    sql: ${TABLE}.unsub_count  
    
###### DATE FIELDS

  - dimension_group: launch_date
    label: 'Sent Date'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.launch_date

  - dimension: click_date
    type: string
    sql: ${TABLE}.click_date

##### BRAND LOOKUP

  - dimension: launch_name
    type: string
    sql: ${TABLE}.launch_name

#### EMAIL DIMENSIONS

  - dimension: concatid
    alias: Uni
    type: string
    sql: ${TABLE}.concatid

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address


    


  - dimension: launch_id
    type: string
    sql: ${TABLE}.launch_id


    
  - dimension: Launch_Brand
    label: 'Brand'
    type: string
    sql: substring(${launch_name},1,3)

  - dimension: riid
    type: string
    sql: ${TABLE}.riid

#######################

  - measure: count
    type: count
    drill_fields: [launch_name]
    
  - measure: Unique_Riid_Count
    type: count_distinct
    sql: ${TABLE}.concatid
    
  - measure: Send_Count
    type: count_distinct
    sql: ${TABLE}.concatid
    
  - measure: Click_count
    type: sum
    sql: ${TABLE}.click_count     

  - measure: Unsubscribe_count1
    type: sum
    sql: ${TABLE}.unsub_count
    
  - measure: Open_Count
    type: sum
    sql: ${TABLE}.open_count
    
  - measure: Bounce_Count
    type: sum
    sql: ${TABLE}.bounce_count
    