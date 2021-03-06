connection: "bigquery-connection"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

label: "BigQuery - Projects"

explore: ga_sessions_header_bidding {
  label: "BigQuery - Header Bidding Platform"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_quarterly_reports {
  hidden: yes
  label: "BigQuery - Quarterly Reports"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}
