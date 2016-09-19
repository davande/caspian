- view: audiometrix_realtime
  sql_table_name: publications.audiometrix_realtime
  fields:

  - measure: active_sessions
    type: sum
    sql: ${TABLE}.active_sessions
    
  - measure: total_sessions_today
    type: sum
    sql: ${TABLE}.total_sessions_today

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: tracktitle
    type: string
    sql: ${TABLE}.tracktitle
    
  - dimension: artist
    type: string
    sql: ${TABLE}.artist
    
  - dimension: song_and_artist
    type: string
    sql: ${tracktitle} || ' - ' || ${artist}

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [time, date, week, month]
    convert_tz: true
    sql: CONVERT_TIMEZONE('UTC','BST',${TABLE}.date::timestamp) # BST/GMT depending on date

  - dimension: image_file
    hidden: TRUE
    sql: ${TABLE}.image
    
  - dimension: Artist_Image
    hidden: FALSE
    sql: ${image_file}
    html: <img src="{{ value }}" width="300" height="300"/>
    
  - dimension: image_file2
    hidden: TRUE
    sql: ('http://i.imgur.com/ufq8vsh.png')
    
  - dimension: Artist_Image2
    hidden: FALSE
    sql: ${image_file2}
    html: <img src="{{ value }}" width="380" height="200"/>    


