- view: social_reddit
  sql_table_name: publications.social_reddit
  fields:

  - dimension: title
    type: string
    sql: ${TABLE}.title
    
  - dimension: thread
    type: string
    sql: ${TABLE}.thread
    
  - dimension: link1
    label: 'Link'
    hidden: FALSE
    sql: ${TABLE}.reddit_url
    html: |
      <a href="{{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>    

  - dimension: link
    links:
      - label: 'Link link'
        url: test{{value}}
        icon_url: http://i.imgur.com/aJnF2oW.jpg
    sql: ${TABLE}.reddit_url

#       links:
#         - label: Google
#           url: http://www.google.com/search?q={{ value }}
#           icon_url: http://google.com/favicon.ico
#     sql: ${TABLE}.reddit_url
#     html: |
#       <a href="{{ value }}" target="_new">
#       <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>    
    
  - dimension: url
    type: string
    sql: ${TABLE}.url
    
  - measure: score
    type: sum
    sql: ${TABLE}.source_score
    
  - measure: comments_count
    type: sum
    sql: ${TABLE}.source_comments
    
  - dimension: date
    type: date
    sql: ${TABLE}.date
    