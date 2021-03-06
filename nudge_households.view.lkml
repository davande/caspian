view: nudge_households {
  sql_table_name: publications.nudge_households ;;

  dimension: abc_audit_town {
    type: string
    sql: ${TABLE}.abc_audit_town ;;
  }

  dimension: abc_country_name {
    type: string
    sql: ${TABLE}.abc_country_name ;;
  }

  dimension: abc_international_region {
    type: string
    sql: ${TABLE}.abc_international_region ;;
  }

  dimension: abc_uk_county {
    type: string
    sql: ${TABLE}.abc_uk_county ;;
  }

  dimension: abc_uk_regions {
    type: string
    sql: ${TABLE}.abc_uk_regions ;;
  }

  dimension: acorn_category {
    type: string
    sql: ${TABLE}.acorn_category ;;
  }

  dimension: acorn_group {
    type: string
    sql: ${TABLE}.acorn_group ;;
  }

  dimension: acorn_group_desc {
    type: string
    sql: ${TABLE}.acorn_group_desc ;;
  }

  dimension: acorn_type {
    type: string
    sql: ${TABLE}.acorn_type ;;
  }

  dimension: acron_category_desc {
    type: string
    sql: ${TABLE}.acron_category_desc ;;
  }

  dimension: acron_type_desc {
    type: string
    sql: ${TABLE}.acron_type_desc ;;
  }

  dimension: address_line_1 {
    type: string
    sql: ${TABLE}.address_line_1 ;;
  }

  dimension: address_line_2 {
    type: string
    sql: ${TABLE}.address_line_2 ;;
  }

  dimension: address_line_3 {
    type: string
    sql: ${TABLE}.address_line_3 ;;
  }

  dimension: bpa_country_name {
    type: string
    sql: ${TABLE}.bpa_country_name ;;
  }

  dimension: bpa_international_region {
    type: string
    sql: ${TABLE}.bpa_international_region ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: country_phone_prefix {
    type: string
    sql: ${TABLE}.country_phone_prefix ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: cr_address_urn {
    type: string
    sql: ${TABLE}.cr_address_urn ;;
  }

  dimension: household_id {
    type: number
    sql: ${TABLE}.household_id ;;
  }

  dimension: international_mail_zone {
    type: string
    sql: ${TABLE}.international_mail_zone ;;
  }

  dimension: mailsort_phone_prefix {
    type: string
    sql: ${TABLE}.mailsort_phone_prefix ;;
  }

  dimension: mailsort_residue_code {
    type: string
    sql: ${TABLE}.mailsort_residue_code ;;
  }

  dimension: ms_postcode {
    type: string
    sql: ${TABLE}.ms_postcode ;;
  }

  dimension: ms_postcode_area {
    type: string
    sql: ${TABLE}.ms_postcode_area ;;
  }

  dimension: ms_postcode_area_desc {
    type: string
    sql: ${TABLE}.ms_postcode_area_desc ;;
  }

  dimension: ms_wide_address_urn {
    type: string
    sql: ${TABLE}.ms_wide_address_urn ;;
  }

  dimension: orig_postcode {
    type: string
    sql: ${TABLE}.orig_postcode ;;
  }

  dimension: paf_dps {
    type: string
    sql: ${TABLE}.paf_dps ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.postcode ;;
  }

  dimension: royal_mail_region {
    type: string
    sql: ${TABLE}.royal_mail_region ;;
  }

  dimension: salacious_address_flag {
    type: string
    sql: ${TABLE}.salacious_address_flag ;;
  }

  dimension: synchronised_postcode {
    type: string
    sql: ${TABLE}.synchronised_postcode ;;
  }

  dimension: town {
    type: string
    sql: ${TABLE}.town ;;
  }

  dimension: uk_verified_address {
    type: string
    sql: ${TABLE}.uk_verified_address ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name, abc_country_name, bpa_country_name]
  }
}
