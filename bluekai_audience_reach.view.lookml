- view: bluekai_audience_reach
  sql_table_name: publications.bluekai_reach
  fields:

  - dimension: category_id
    type: string
    sql: ${TABLE}.category_id

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: node_name
    type: string
    sql: ${TABLE}.node_name

  - dimension: parent_category_id
    type: string
    sql: ${TABLE}.parent_category_id

  - dimension: path
    type: string
    sql: ${TABLE}.path

  - measure: count
    type: count
    drill_fields: [node_name]

