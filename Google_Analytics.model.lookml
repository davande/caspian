- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: google_analytics_top_line
  label: 'Google Analytics - Top Line'
  sql_table_name: publications.google_analytics_top_line
  persist_for: 20 hour
  
- explore: google_analytics_pages
  label: 'Google Analytics - Pages'
  sql_table_name: publications.google_analytics_pages
  persist_for: 20 hour
  
- explore: google_analytics_channels
  label: 'Google Analytics - Channels'
  sql_table_name: publications.google_analytics_channels
  persist_for: 20 hour