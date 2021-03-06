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

# - view: sessions_landing_page
#   derived_table:
#     sql: |
#       SELECT
#         *
#       FROM (
#         SELECT -- Select the first page (using dvce_tstamp)
#           a.domain_userid,
#           a.domain_sessionidx,
#           a.page_urlhost,
#           a.page_urlpath,
#           a.app_id,
#           RANK() OVER (PARTITION BY a.domain_userid, a.domain_sessionidx ORDER BY a.page_urlhost, a.page_urlpath) AS rank
#         FROM snowplow.events AS a
#         INNER JOIN ${sessions_basic.SQL_TABLE_NAME} AS b
#           ON  a.domain_userid = b.domain_userid
#           AND a.domain_sessionidx = b.domain_sessionidx
#           AND a.dvce_created_tstamp = b.dvce_min_tstamp
#         GROUP BY 1,2,3,4,5 -- Aggregate identital rows (that happen to have the same dvce_tstamp)
#       )
#       WHERE rank = 1 -- If there are different rows with the same dvce_tstamp, rank and pick the first row
#     sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (4*60*60))
#     distkey: domain_userid
#     sortkeys: [domain_userid, domain_sessionidx]

#   fields:

#   # DIMENSIONS #

#   - dimension: user_id
#     sql: ${TABLE}.domain_userid

#   - dimension: app_id
#     sql: ${TABLE}.app_id

#   - dimension: session_index
#     type: int
#     sql: ${TABLE}.domain_sessionidx

#   - dimension: landing_page_url_host
#     sql: ${TABLE}.page_urlhost

#   - dimension: landing_page_url_path
#     sql: ${TABLE}.page_urlpath

#   - dimension: landing_page_url
#     sql: ${TABLE}.page_urlhost || ${TABLE}.page_urlpath

#   # MEASURES #

#   - measure: count
#     type: count

#   - measure: landing_page_count
#     type: count_distinct
#     sql: ${landing_page_url}
