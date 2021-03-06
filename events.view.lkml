# # Copyright (c) 2013-2015 Snowplow Analytics Ltd. All rights reserved.
# #
# # This program is licensed to you under the Apache License Version 2.0,
# # and you may not use this file except in compliance with the Apache License Version 2.0.
# # You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
# #
# # Unless required by applicable law or agreed to in writing,
# # software distributed under the Apache License Version 2.0 is distributed on an
# # "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# # See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
# #
# # Version: 3-0-0
# #
# # Authors: Yali Sassoon, Christophe Bogaert
# # Copyright: Copyright (c) 2013-2015 Snowplow Analytics Ltd
# # License: Apache License Version 2.0

# - connection: caspian-live

# - view: events
#   derived_table:
#     sql: |
#       SELECT
#         domain_userid,
#         domain_sessionidx,
#         user_id,
#         event_id,
#         app_id,
#         event,
#         geo_country,
#         geo_latitude,
#         geo_longitude,
#         collector_tstamp,
#         dvce_created_tstamp,
#         dvce_type,
#         page_title,
#         page_urlscheme,
#         page_urlhost,
#         page_urlpath,
#         page_urlport,
#         page_urlquery,
#         page_urlfragment,
#         refr_medium,
#         refr_source,
#         refr_term,
#         refr_urlhost,
#         refr_urlpath,
#         event_name,
#         mkt_medium,
#         mkt_source,
#         mkt_term,
#         mkt_content,
#         mkt_campaign,
#         mkt_network,
#         mkt_clickid,
#         pp_xoffset_max,
#         pp_xoffset_min,
#         pp_yoffset_max,
#         pp_yoffset_min,
#         se_category,
#         se_action,
#         se_label,
#         se_property,
#         se_value,
#         doc_height,
#         doc_width,
#         tr_orderid,
#         tr_affiliation,
#         tr_total,
#         tr_tax,
#         tr_city,
#         tr_state,
#         tr_country,
#         ti_orderid,
#         ti_category,
#         ti_sku,
#         ti_name,
#         ti_price,
#         ti_quantity
#       FROM snowplow.events
#       WHERE domain_userid IS NOT NULL
#       AND collector_tstamp > current_date - 35

#     sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (4*60*60))
#     distkey: domain_userid
#     sortkeys: [domain_userid, domain_sessionidx, collector_tstamp]



#   fields:

#   # DIMENSIONS #

#   - dimension: mkt_medium
#     label: 'Market Medium'
#     sql: ${TABLE}.mkt_medium

#   - dimension: mkt_source
#     label: 'Market Source'
#     sql: ${TABLE}.mkt_source

#   - dimension: mkt_term
#     label: 'Market Term'
#     sql: ${TABLE}.mkt_term

#   - dimension: mkt_content
#     label: 'Market Content'
#     sql: ${TABLE}.mkt_content

#   - dimension: mkt_campaign
#     label: 'Market Campaign'
#     sql: ${TABLE}.mkt_campaign

#   - dimension: mkt_network
#     label: 'Market Ad Network Click'
#     sql: ${TABLE}.mkt_network

#   - dimension: mkt_clickid
#     label: 'Market ClickID'
#     sql: ${TABLE}.mkt_clickid


#   - dimension: location_test
#     type: location
#     label: 'Location'
#     sql_latitude: ROUND(${TABLE}.geo_latitude,1)
#     sql_longitude: ROUND(${TABLE}.geo_longitude,1)

#   - dimension: event_id
#     primary_key: true
#     sql: ${TABLE}.event_id

#   - dimension: event_name
#     label: 'Event Name'
#     sql: ${TABLE}.event_name

#   - dimension: event_type
#     sql: ${TABLE}.event

#   - dimension: dvce_type
#     label: 'Device Type'
#     sql: ${TABLE}.dvce_type

#   - dimension: app_id
#     sql: ${TABLE}.app_id

#   - dimension: brand
#     sql: |
#       case
#       when ${app_id} like '%ABR%' then 'Absolute Radio'
#       when ${app_id} like '%MCN%' then 'Motorcycle News'
#       when ${app_id} like '%DBF%' then 'Debrief'
#       when ${app_id} like '%CAR%' then 'Car Magazine'
#       when ${app_id} like '%PAR%' then 'Parkers'
#       when ${app_id} like '%YRS%' then 'Yours'
#       when ${app_id} like '%EMP%' then 'Empire'
#       when ${app_id} like '%PLR%' then 'Planet Rock'
#       when ${app_id} like '%TDG%' then 'Todays Golfer'
#       when ${app_id} like '%KIS%' then 'Kiss'
#       when ${app_id} like '%HEA%' then 'Heat'
#       when ${app_id} like '%GRA%' then 'Grazia'
#       when ${app_id} like '%CLO%' then 'Closer'
#       when ${app_id} like '%LIF%' then 'Lifestyle.one Homepage'
#       when ${app_id} like '%MAB%' then 'Mother & Baby'
#       when ${app_id} like '%ABR%' then 'Absolute Radio'
#       when ${app_id} like '%KER%' then 'Kerrang'
#       when ${app_id} like '%MAG%' then 'Magic'
#       when ${app_id} like '%AIR%' then 'Radio Aire'
#       when ${app_id} like '%BOR%' then 'Other'
#       when ${app_id} like '%CFM%' then 'CFM Radio'
#       when ${app_id} like '%CIT%' then 'City Talk'
#       when ${app_id} like '%CLY%' then 'Clyde'
#       when ${app_id} like '%COO%' then 'Cool FM'
#       when ${app_id} like '%DWN%' then 'Downtown'
#       when ${app_id} like '%FOR%' then 'Forth 1'
#       when ${app_id} like '%HAL%' then 'Hallam FM'
#       when ${app_id} like '%HIT%' then 'The Hits Radio'
#       when ${app_id} like '%KEY%' then 'Key 103'
#       when ${app_id} like '%KRG%' then 'Kerrang Radio'
#       when ${app_id} like '%MET%' then 'Metro Radio'
#       when ${app_id} like '%MFR%' then 'MFR'
#       when ${app_id} like '%MGC%' then 'Magic'
#       when ${app_id} like '%NTH%' then 'Northsound'
#       when ${app_id} like '%PRK%' then 'Planet Rock'
#       when ${app_id} like '%RDW%' then 'Other'
#       when ${app_id} like '%ROK%' then 'Rock FM'
#       when ${app_id} like '%TAY%' then 'Tay FM'
#       when ${app_id} like '%TFM%' then 'TFM Radio'
#       when ${app_id} like '%VIK%' then 'Viking FM'
#       else 'Other' end
#     html: |
#       {{ linked_value }}
#       <a href="https://bauerxcel.looker.com/dashboards/46?Brand%20Name(s)={{ value }}&Timeframe=1%20months%20ago%20for%201%20months&Set%20same%20date%20as%20Timeframe=1%20months%20ago%20for%201%20months" target="_new">
#       <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>

#   - dimension: uk_only
#     sql: |
#       case when events.geo_country = 'GB' then 'UK Only' else 'Non UK' end

#   - dimension: page_views_tier
#     type: tier
#     tiers: [0,1000,5000,10000,20000,50000,100000,500000]
#     sql: ${page_views_count}
#     style: integer

#   - dimension: Country
#     sql: ${TABLE}.geo_country


#   - dimension: location
#     hidden: TRUE
#     type: location
#     sql_longitude: ${TABLE}.geo_longitude
#     sql_latitude: ${TABLE}.geo_latitude

#   - dimension: timestamp
#     hidden: TRUE
#     sql: ${TABLE}.collector_tstamp

#   - dimension_group: timestamp
#     type: time
#     timeframes: [time, hour, date, week, month, day_of_week]
#     sql: ${TABLE}.collector_tstamp

#   - dimension: session_index
#     type: number
#     sql: ${TABLE}.domain_sessionidx

#   - dimension: domain_userid
#     sql: ${TABLE}.domain_userid

#   - dimension: user_id
#     sql: ${TABLE}.user_id

#   - dimension: session_id
#     sql: ${TABLE}.domain_userid || '-' || ${TABLE}.domain_sessionidx

#   - dimension_group: device_timestamp
#     type: time
#     timeframes: [time, hour, date, week, month]
#     sql: ${TABLE}.dvce_created_tstamp
#     hidden: true

#   - dimension: page_title
#     sql: ${TABLE}.page_title

#   - dimension: page_url_scheme
#     hidden: TRUE
#     sql: ${TABLE}.page_urlscheme

#   - dimension: page_url_host
#     sql: ${TABLE}.page_urlhost

#   - dimension: page_url_path
#     sql: ${TABLE}.page_urlpath

#   - dimension: page_url_port
#     type: number
#     sql: ${TABLE}.page_urlport
#     hidden: true

#   - dimension: page_url_query
#     sql: ${TABLE}.page_urlquery
#     hidden: true

#   - dimension: page_url_fragment
#     sql: ${TABLE}.page_urlfragment
#     hidden: true

#   - dimension: refr_medium
#     label: 'Referer Medium'
#     sql: ${TABLE}.refr_medium

#   - dimension: first_event_in_session
#     type: yesno
#     sql: ${TABLE}.refr_medium != 'internal'

#   - dimension: first_event_for_visitor
#     type: yesno
#     sql: ${TABLE}.refr_medium != 'internal' AND ${TABLE}.domain_sessionidx = 1

#   - dimension: refr_source
#     label: 'Referer Source'
#     sql: ${TABLE}.refr_source

#   - dimension: refr_term
#     label: 'Referer Term'
#     sql: ${TABLE}.refr_term

#   - dimension: refr_url_host
#     sql: |
#     CASE
#       WHEN ${TABLE}.refr_urlhost = 't.co' THEN 'twitter.com'
#       ELSE ${TABLE}.refr_urlhost
#     END

#   - dimension: refr_url_path
#     hidden: TRUE
#     sql: ${TABLE}.refr_urlpath

#   - dimension: x_offset
#     label: 'Page interaction - X axis'
#     type: number
#     sql: ${TABLE}.pp_xoffset_max

#   - dimension: pp_xoffset_min
#     type: number
#     sql: ${TABLE}.pp_xoffset_min
#     hidden: true

#   - dimension: y_offset
#     label: 'Page interaction - Y axis'
#     type: number
#     sql: ${TABLE}.pp_yoffset_max

#   - dimension: pp_yoffset_min
#     type: number
#     sql: ${TABLE}.pp_yoffset_min
#     hidden: true

#   - dimension: structured_event_action
#     hidden: FALSE
#     sql: ${TABLE}.se_action

#   - dimension: structured_event_category
#     hidden: FALSE
#     sql: ${TABLE}.se_category

#   - dimension: structured_event_label
#     sql: ${TABLE}.se_label

#   - dimension: structured_event_property
#     hidden: FALSE
#     sql: ${TABLE}.se_property

#   - dimension: structured_event_value
#     hidden: FALSE
#     type: number
#     sql: ${TABLE}.se_value

#   - dimension: user_agent
#     sql: ${TABLE}.useragent
#     hidden: true

#   # MEASURES #

#   - measure: domain_userid_count
#     label: 'Unique Users Count'
#     type: count_distinct
#     sql: ${domain_userid}

#   - measure: count
#     type: count
#     hidden: TRUE
#     drill_fields: event_detail*

#   - measure: page_pings_count
#     type: count
#     drill_fields: event_detail*
#     filters:
#       event_type: page_ping

#   - measure: page_views_count
#     type: count
#     drill_fields: page_views_detail*
#     filters:
#       event_type: page_view

#   - measure: distinct_pages_viewed_count
#     type: count_distinct
#     drill_fields: page_views_detail*
#     sql: ${page_url_path}

#   - measure: articles_count
#     type: count_distinct                ##################### Testing ##########################
#     drill_fields: page_views_detail*
#     sql: ${TABLE}.page_title

#   - measure: sessions_count
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*


#   - measure: sessions_count_last_7days
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*
#     filters:
#       timestamp_date: 7 days

#   - measure: sessions_count_last_30days
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*
#     filters:
#       timestamp_date: 30 days

#   - measure: sessions_count_7to14_days_ago
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*
#     filters:
#       timestamp_date: 14 days ago for 7 days

#   - measure: sessions_count_14to21_days_ago
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*
#     filters:
#       timestamp_date: 21 days ago for 7 days

#   - measure: sessions_count_21to28_days_ago
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*
#     filters:
#       timestamp_date: 28 days ago for 7 days

#   - measure: sessions_count_yesterday
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*
#     filters:
#       timestamp_date: yesterday

#   - measure: sessions_count_yesterday_prior_week
#     type: count_distinct
#     sql: ${session_id}
#     drill_fields: detail*
#     filters:
#       timestamp_date: 8 days ago for 1 day

#   - measure: sessions_avg_last_30days
#     type: number
#     sql: ${sessions_count_last_30days}/30
#     drill_fields: detail*

#   - measure: sessions_avg_last_7days
#     type: number
#     sql: ${sessions_count_last_7days}/7
#     drill_fields: detail*

#   - measure: page_pings_per_session
#     type: number
#     value_format_name: decimal_2
#     sql: NULLIF(${page_pings_count},0)/NULLIF(${sessions_count},0)::REAL

#   - measure: page_pings_per_visitor
#     type: number
#     value_format_name: decimal_2
#     sql: NULLIF(${page_pings_count},0)/NULLIF(${visitors_count},0)::REAL

#   - measure: visitors_count
#     type: count_distinct
#     sql: ${domain_userid}
#     drill_fields: visitors_detail
#     #hidden: true  # Not to be shown in the UI (in UI only show visitors count for visitors table)

#   - measure: events_per_session
#     type: number
#     value_format_name: decimal_2
#     sql: ${count}/NULLIF(${sessions_count},0)::REAL

#   - measure: events_per_visitor
#     type: number
#     value_format_name: decimal_2
#     sql: ${count}/NULLIF(${visitors_count},0)::REAL

#   - measure: page_views_per_sessions
#     type: number
#     value_format_name: decimal_2
#     sql: ${page_views_count}/NULLIF(${sessions_count},0)::REAL

#   - measure: page_views_per_visitor
#     type: number
#     value_format_name: decimal_2
#     sql: ${page_views_count}/NULLIF(${visitors_count},0)::REAL

#   - measure: landing_page_views_count
#     type: count
#     filters:
#       event_type: page_view
#       first_event_in_session: yes

#   - measure: internal_page_views_count
#     type: count
#     filters:
#       event_type: page_view
#       first_event_in_session: no

#   - measure: approx_user_usage_in_minutes
#     type: number
#     value_format_name: decimal_2
#     sql: APPROXIMATE COUNT( DISTINCT CONCAT(FLOOR(EXTRACT (EPOCH FROM ${TABLE}.collector_tstamp)/10), ${TABLE}.domain_userid) ) /6

#   - measure: approx_usage_per_visitor_in_seconds
#     type: number
#     value_format_name: decimal_2
#     sql: ${approx_user_usage_in_minutes}/NULLIF(${visitors_count}, 0)::REAL

#   - measure: approx_usage_per_visit_in_seconds
#     type: number
#     value_format_name: decimal_2
#     sql: ${approx_user_usage_in_minutes}/NULLIF(${sessions_count}, 0)::REAL

#   # DRILL FIELDS#

#   sets:
#     event_detail:
#       - session_index
#       - event_type
#       - device_timestamp
#       - page_url_host
#       - page_url_path

#     page_views_detail:
#       - page_url_host
#       - page_url_path
#       - device_timestamp
#       - page_views_count

#     session_detail:
#       - user_id
#       - session_index
#       - sessions.referer_url_host
#       - sessions.referer_url_path
#       - sessions.landing_page
#       - sessions.session_duration_seconds
#       - count

#     visitor_detail:
#       - user_id
#       - visitors.first_touch
#       - visitor.referer_url_host
#       - visitors.referer_url_path
#       - visitors.last_touch
#       - visitors.number_of_sessions
#       - visitors.event_stream
