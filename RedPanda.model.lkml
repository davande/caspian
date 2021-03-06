connection: "caspian-live"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

label: "RedPanda Ad Platform"

explore: admarvel_site {
  hidden: no
  sql_table_name: ad_platform.admarvel_site ;;
  persist_for: "6 hour"
}

explore: adsense {
  hidden: no
  sql_table_name: ad_platform.adsense ;;
  persist_for: "6 hour"
}

explore: adx {
  hidden: no
  sql_table_name: ad_platform.adx ;;
  persist_for: "6 hour"
}

explore: appnexus {
  hidden: no
  sql_table_name: ad_platform.appnexus ;;
  persist_for: "6 hour"
}

explore: dfp_devices {
  hidden: no
  sql_table_name: ad_platform.dfp_devices ;;
  persist_for: "6 hour"
}

explore: dfp_key_values {
  hidden: no
  sql_table_name: ad_platform.dfp_key_values ;;
  persist_for: "6 hour"
}

explore: media_net {
  hidden: no
  sql_table_name: ad_platform.media_net ;;
  persist_for: "6 hour"
}

explore: nativo {
  hidden: no
  sql_table_name: ad_platform.nativo ;;
  persist_for: "6 hour"
}

explore: nativo_marketplace {
  hidden: no
  sql_table_name: ad_platform.nativo_marketplace ;;
  persist_for: "6 hour"
}

explore: plista {
  hidden: no
  sql_table_name: ad_platform.plista ;;
  persist_for: "6 hour"
}

explore: rubicon {
  hidden: no
  sql_table_name: ad_platform.rubicon ;;
  persist_for: "6 hour"
}

explore: teads {
  hidden: no
  sql_table_name: ad_platform.teads ;;
  persist_for: "6 hour"
}

explore: vibrant_media {
  hidden: no
  sql_table_name: ad_platform.vibrant_media ;;
  persist_for: "6 hour"
}

explore: rezonence {
  hidden: no
  sql_table_name: ad_platform.rezonence ;;
  persist_for: "6 hour"
}
