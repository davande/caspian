- view: bauer_list
  label: 'Bauer First Party Data'
  sql_table_name: publications.bauer_list
  fields:

#   - dimension: age
#     label: 'Age'
#     type: number
#     sql: |
#        CASE 
#          WHEN ((${TABLE}.age < 90) AND (${TABLE}.age > 18)) THEN ${TABLE}.age
#        END
       
  - dimension: age_as_number
    hidden: true
    sql: |
      CAST(CASE WHEN ${TABLE}.age LIKE '%-%' THEN NULL
      WHEN LEN(${TABLE}.age) = 0 THEN NULL
      ELSE ${TABLE}.age
      END AS INT)
    

  - dimension: age
    label: 'Age'
    type: number
    sql: |
       CASE 
         WHEN ((${age_as_number} < 99) AND (${age_as_number} > 17)) THEN ${TABLE}.age
       END

  - dimension: age_tier
    hidden: TRUE
    label: 'Age Tier'
    type: tier
    tiers: [0,10,20,30,40,60,80]
    sql: ${age}
    style: integer
    
  - dimension: age_banding
    label: 'Age Banding'
    type: string
    sql: ${TABLE}.agebanding

#   - dimension: birthday
#     type: number
#     sql: ${TABLE}.birthday
# 
#   - dimension: birth_month
#     type: number
#     sql: ${TABLE}.birthmonth
# 
#   - dimension: birth_year
#     type: number
#     sql: ${TABLE}.birthyear

  - dimension: city
    label: 'City'
    type: string
    sql: ${TABLE}.city

  - dimension: country
    label: 'Country'
    type: string
    sql: |
       CASE 
         WHEN ${TABLE}.country = 'United States' THEN 'United States of America'
         ELSE INITCAP(${TABLE}.country)
       END


  - dimension_group: created
    label: 'Date Created'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.created

  - dimension: created_by
    hidden: TRUE
    label: 'Data From (ES/Nudge/Gigya)'
    type: string
    sql: ${TABLE}.created_by
    
  - dimension: customer_id
    hidden: TRUE
    type: string
    sql: ${TABLE}.customer_id

  - dimension_group: birth_day
    hidden: TRUE
    type: time
    timeframes: [date, week, month, year, day_of_week]
    convert_tz: false
    sql: ${TABLE}.dateofbirth

  - dimension_group: ddw_updated
    hidden: TRUE
    label: 'DDW Date'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ddw_updated_date

  - dimension: educationlevel
    hidden: TRUE
    type: string
    sql: ${TABLE}.educationlevel

  - dimension: email_address
    hidden: TRUE
    type: string
    sql: ${TABLE}.email_address

  - dimension: email_permission_status
    hidden: TRUE
    type: string
    sql: ${TABLE}.email_permission_status

  - dimension: firstname
    hidden: TRUE
    type: string
    sql: ${TABLE}.firstname
    
  - dimension: gender
    hidden: TRUE
    type: string
    sql_case:
      F: ${TABLE}.gender = 'f' or ${TABLE}.gender = 'Female' 
      M: ${TABLE}.gender = 'm' or ${TABLE}.gender = 'Male' 
      else: 'Unknown'
  
  - dimension: gender_name
    label: 'Gender'
    sql: |
      CASE 
        WHEN ${gender} = 'F' THEN 'Female' 
        WHEN ${gender} = 'M' THEN 'Male' 
        ELSE 'Unknown' 
      END
    
  - dimension: hometown
    hidden: TRUE
    type: string
    sql: ${TABLE}.hometown

  - dimension: household_income
    hidden: TRUE
    label: 'Household Income ($USD)'
    description: 'This is the income in USD '
    type: string
    sql: ${TABLE}.householdincome

  - dimension: is_registered
    label: 'Registered on Gigya'
    type: yesno
    sql: ${TABLE}.isregistered = 'Y'

  - dimension: lastname
    hidden: TRUE
    type: string
    sql: ${TABLE}.lastname

  - dimension: mobile_country
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_country

  - dimension: mobile_number
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_number

  - dimension: nickname
    hidden: TRUE
    type: string
    sql: ${TABLE}.nickname

  - dimension: nudgeid
    hidden: TRUE
    type: string
    sql: ${TABLE}.nudgeid

  - dimension: occupation
    hidden: TRUE
    type: string
    sql: ${TABLE}.occupation

#   - dimension: postal_code
#     label: 'Postcode'
#     type: string
#     sql: UPPER(${TABLE}.postal_code)
  
#   - dimension: postal_code_RAW
#     hidden: TRUE
#     label: 'PostcodeTESTING1'
#     type: string
#     sql: UPPER(${TABLE}.postal_code)
    
#   - dimension: postal_code
#     hidden: TRUE
#     label: 'PostcodeTESTING1'
#     type: string
#     sql: |
#       substring(UPPER(TRANSLATE(${postal_code}, ' ,-*.', '')),1,4)
# 
#   - dimension: postal_code1
#     hidden: TRUE
#     label: 'PostcodeTESTING2'
#     type: string
#     sql: |
#       substring(UPPER(TRANSLATE(${postal_code}, ' ,-*.', '')),5,4)
      
#   - dimension: postal_code2
#     hidden: TRUE
#     label: 'PostcodeTESTING3'
#     type: string
#     sql: |
#       substring(${postal_code0},5,4) 
      
#   - dimension: postal_code_clean
#     hidden: TRUE
#     label: 'PostcodeTESTING4'
#     type: string
#     sql: |
#       substring(UPPER(TRANSLATE(${TABLE}.postal_code, ' ,-*.', '')),1,4) || ' ' ||  substring(UPPER(TRANSLATE(${TABLE}.postal_code, ' ,-*.', '')),5,4) 

  - dimension: postal_code
    label: 'Postcode'
    type: string
    sql: |
         CASE
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),2)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),3)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][A-Z][0-9][0-9][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),4)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE '[A-Z][A-Z][0-9][A-Z][0-9][A-Z][A-Z]' THEN LEFT(UPPER(${TABLE}.postal_code),4)+' '+RIGHT(UPPER(${TABLE}.postal_code),3)
           WHEN UPPER(${TABLE}.postal_code) LIKE 'UK%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'UNITED KIN%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'OTHER%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'IRELAND%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'FULL%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'N/A%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE '0%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'GB%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'ERIRE%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'NONE%' THEN 'Unknown'
           WHEN UPPER(${TABLE}.postal_code) LIKE 'ZZZ%' THEN 'Unknown'
           ELSE UPPER(${TABLE}.postal_code)
         END
    

#   - dimension: postal_area
#     hidden: TRUE
#     label: 'Postal Area'
#     type: string
#     sql: UPPER(split_part(${postal_code},' ', 1))
    
  - dimension: postal_area1
    label: 'Postal Area'
    type: string
    sql: |
       CASE 
            WHEN substring(${postal_code},1,2) = 'AB' THEN 'AB'
            WHEN substring(${postal_code},1,2) = 'AL' THEN 'AL'
            WHEN substring(${postal_code},1,2) = 'B' THEN 'B'
            WHEN substring(${postal_code},1,2) = 'BA' THEN 'BA'
            WHEN substring(${postal_code},1,2) = 'BB' THEN 'BB'
            WHEN substring(${postal_code},1,2) = 'BD' THEN 'BD'
            WHEN substring(${postal_code},1,2) = 'BH' THEN 'BH'
            WHEN substring(${postal_code},1,2) = 'BL' THEN 'BL'
            WHEN substring(${postal_code},1,2) = 'BN' THEN 'BN'
            WHEN substring(${postal_code},1,2) = 'BR' THEN 'BR'
            WHEN substring(${postal_code},1,2) = 'BS' THEN 'BS'
            WHEN substring(${postal_code},1,2) = 'BT' THEN 'BT'
            WHEN substring(${postal_code},1,2) = 'CA' THEN 'CA'
            WHEN substring(${postal_code},1,2) = 'CB' THEN 'CB'
            WHEN substring(${postal_code},1,2) = 'CF' THEN 'CF'
            WHEN substring(${postal_code},1,2) = 'CH' THEN 'CH'
            WHEN substring(${postal_code},1,2) = 'CM' THEN 'CM'
            WHEN substring(${postal_code},1,2) = 'CO' THEN 'CO'
            WHEN substring(${postal_code},1,2) = 'CR' THEN 'CR'
            WHEN substring(${postal_code},1,2) = 'CT' THEN 'CT'
            WHEN substring(${postal_code},1,2) = 'CV' THEN 'CV'
            WHEN substring(${postal_code},1,2) = 'CW' THEN 'CW'
            WHEN substring(${postal_code},1,2) = 'DA' THEN 'DA'
            WHEN substring(${postal_code},1,2) = 'DD' THEN 'DD'
            WHEN substring(${postal_code},1,2) = 'DE' THEN 'DE'
            WHEN substring(${postal_code},1,2) = 'DG' THEN 'DG'
            WHEN substring(${postal_code},1,2) = 'DH' THEN 'DH'
            WHEN substring(${postal_code},1,2) = 'DL' THEN 'DL'
            WHEN substring(${postal_code},1,2) = 'DN' THEN 'DN'
            WHEN substring(${postal_code},1,2) = 'DT' THEN 'DT'
            WHEN substring(${postal_code},1,2) = 'DY' THEN 'DY'
            WHEN substring(${postal_code},1,2) = 'E' THEN 'E'
            WHEN substring(${postal_code},1,2) = 'EC' THEN 'EC'
            WHEN substring(${postal_code},1,2) = 'EH' THEN 'EH'
            WHEN substring(${postal_code},1,2) = 'EN' THEN 'EN'
            WHEN substring(${postal_code},1,2) = 'EX' THEN 'EX'
            WHEN substring(${postal_code},1,2) = 'FK' THEN 'FK'
            WHEN substring(${postal_code},1,2) = 'FY' THEN 'FY'
            WHEN substring(${postal_code},1,2) = 'G' THEN 'G'
            WHEN substring(${postal_code},1,2) = 'GL' THEN 'GL'
            WHEN substring(${postal_code},1,2) = 'GU' THEN 'GU'
            WHEN substring(${postal_code},1,2) = 'HA' THEN 'HA'
            WHEN substring(${postal_code},1,2) = 'HD' THEN 'HD'
            WHEN substring(${postal_code},1,2) = 'HG' THEN 'HG'
            WHEN substring(${postal_code},1,2) = 'HP' THEN 'HP'
            WHEN substring(${postal_code},1,2) = 'HR' THEN 'HR'
            WHEN substring(${postal_code},1,2) = 'HS' THEN 'HS'
            WHEN substring(${postal_code},1,2) = 'HU' THEN 'HU'
            WHEN substring(${postal_code},1,2) = 'HX' THEN 'HX'
            WHEN substring(${postal_code},1,2) = 'IG' THEN 'IG'
            WHEN substring(${postal_code},1,2) = 'IP' THEN 'IP'
            WHEN substring(${postal_code},1,2) = 'IV' THEN 'IV'
            WHEN substring(${postal_code},1,2) = 'KA' THEN 'KA'
            WHEN substring(${postal_code},1,2) = 'KT' THEN 'KT'
            WHEN substring(${postal_code},1,2) = 'KW' THEN 'KW'
            WHEN substring(${postal_code},1,2) = 'KY' THEN 'KY'
            WHEN substring(${postal_code},1,2) = 'L' THEN 'L'
            WHEN substring(${postal_code},1,2) = 'LA' THEN 'LA'
            WHEN substring(${postal_code},1,2) = 'LD' THEN 'LD'
            WHEN substring(${postal_code},1,2) = 'LE' THEN 'LE'
            WHEN substring(${postal_code},1,2) = 'LL' THEN 'LL'
            WHEN substring(${postal_code},1,2) = 'LN' THEN 'LN'
            WHEN substring(${postal_code},1,2) = 'LS' THEN 'LS'
            WHEN substring(${postal_code},1,2) = 'LU' THEN 'LU'
            WHEN substring(${postal_code},1,2) = 'M' THEN 'M'
            WHEN substring(${postal_code},1,2) = 'ME' THEN 'ME'
            WHEN substring(${postal_code},1,2) = 'MK' THEN 'MK'
            WHEN substring(${postal_code},1,2) = 'ML' THEN 'ML'
            WHEN substring(${postal_code},1,2) = 'N' THEN 'N'
            WHEN substring(${postal_code},1,2) = 'NE' THEN 'NE'
            WHEN substring(${postal_code},1,2) = 'NG' THEN 'NG'
            WHEN substring(${postal_code},1,2) = 'NN' THEN 'NN'
            WHEN substring(${postal_code},1,2) = 'NP' THEN 'NP'
            WHEN substring(${postal_code},1,2) = 'NR' THEN 'NR'
            WHEN substring(${postal_code},1,2) = 'NW' THEN 'NW'
            WHEN substring(${postal_code},1,2) = 'OL' THEN 'OL'
            WHEN substring(${postal_code},1,2) = 'OX' THEN 'OX'
            WHEN substring(${postal_code},1,2) = 'PA' THEN 'PA'
            WHEN substring(${postal_code},1,2) = 'PE' THEN 'PE'
            WHEN substring(${postal_code},1,2) = 'PH' THEN 'PH'
            WHEN substring(${postal_code},1,2) = 'PL' THEN 'PL'
            WHEN substring(${postal_code},1,2) = 'PO' THEN 'PO'
            WHEN substring(${postal_code},1,2) = 'PR' THEN 'PR'
            WHEN substring(${postal_code},1,2) = 'RG' THEN 'RG'
            WHEN substring(${postal_code},1,2) = 'RH' THEN 'RH'
            WHEN substring(${postal_code},1,2) = 'RM' THEN 'RM'
            WHEN substring(${postal_code},1,2) = 'S' THEN 'S'
            WHEN substring(${postal_code},1,2) = 'SA' THEN 'SA'
            WHEN substring(${postal_code},1,2) = 'SE' THEN 'SE'
            WHEN substring(${postal_code},1,2) = 'SG' THEN 'SG'
            WHEN substring(${postal_code},1,2) = 'SK' THEN 'SK'
            WHEN substring(${postal_code},1,2) = 'SL' THEN 'SL'
            WHEN substring(${postal_code},1,2) = 'SM' THEN 'SM'
            WHEN substring(${postal_code},1,2) = 'SN' THEN 'SN'
            WHEN substring(${postal_code},1,2) = 'SO' THEN 'SO'
            WHEN substring(${postal_code},1,2) = 'SP' THEN 'SP'
            WHEN substring(${postal_code},1,2) = 'SR' THEN 'SR'
            WHEN substring(${postal_code},1,2) = 'SS' THEN 'SS'
            WHEN substring(${postal_code},1,2) = 'ST' THEN 'ST'
            WHEN substring(${postal_code},1,2) = 'SW' THEN 'SW'
            WHEN substring(${postal_code},1,2) = 'SY' THEN 'SY'
            WHEN substring(${postal_code},1,2) = 'TA' THEN 'TA'
            WHEN substring(${postal_code},1,2) = 'TD' THEN 'TD'
            WHEN substring(${postal_code},1,2) = 'TF' THEN 'TF'
            WHEN substring(${postal_code},1,2) = 'TN' THEN 'TN'
            WHEN substring(${postal_code},1,2) = 'TQ' THEN 'TQ'
            WHEN substring(${postal_code},1,2) = 'TR' THEN 'TR'
            WHEN substring(${postal_code},1,2) = 'TS' THEN 'TS'
            WHEN substring(${postal_code},1,2) = 'TW' THEN 'TW'
            WHEN substring(${postal_code},1,2) = 'UB' THEN 'UB'
            WHEN substring(${postal_code},1,2) = 'W' THEN 'W'
            WHEN substring(${postal_code},1,2) = 'WA' THEN 'WA'
            WHEN substring(${postal_code},1,2) = 'WC' THEN 'WC'
            WHEN substring(${postal_code},1,2) = 'WD' THEN 'WD'
            WHEN substring(${postal_code},1,2) = 'WF' THEN 'WF'
            WHEN substring(${postal_code},1,2) = 'WN' THEN 'WN'
            WHEN substring(${postal_code},1,2) = 'WR' THEN 'WR'
            WHEN substring(${postal_code},1,2) = 'WS' THEN 'WS'
            WHEN substring(${postal_code},1,2) = 'WV' THEN 'WV'
            WHEN substring(${postal_code},1,2) = 'YO' THEN 'YO'
            WHEN substring(${postal_code},1,2) = 'ZE' THEN 'ZE'
       END
    
  - dimension: postal_street_1
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_1

  - dimension: postal_street_2
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_2

  - dimension: postal_street_3
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_3

  - dimension_group: regdate
    label: 'Gigya Registered'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.regdate

  - dimension: region
    label: 'Region'
    type: string
    sql: ${TABLE}.region

  - dimension: regsource
    label: 'Brand Registration Source'
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.regsource = 'NDG' THEN NULL
      ELSE ${TABLE}.regsource
      END

  - dimension: state
    hidden: TRUE
    label: 'State'
    type: string
    sql: ${TABLE}.state

  - dimension: subsindividualid
    hidden: TRUE
    type: string
    sql: ${TABLE}.subsindividualid

  - dimension: telephonehomeadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomeadded

  - dimension: telephonehomeiso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomeiso

  - dimension: telephonehomenumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomenumber

  - dimension: telephonemobileadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonemobileadded

  - dimension: telephonemobileiso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonemobileiso

  - dimension: telephoneworkadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworkadded

  - dimension: telephone_work_iso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworkiso

  - dimension: telephoneworknumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworknumber

  - dimension: title
    hidden: TRUE
    type: string
    sql: ${TABLE}.title

  - dimension: updated_by
    hidden: TRUE
    type: string
    sql: ${TABLE}.updated_by

  - dimension: username
    hidden: TRUE
    type: string
    sql: ${TABLE}.username

  - dimension: zippafvalidated
    hidden: TRUE
    type: string
    sql: ${TABLE}.zippafvalidated
    
  - dimension: registered_date_banding
    label: 'Gigya Registered Date Banding'
    type: string
    sql: |
      CASE 
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) = 0 THEN '1) Today'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 7 THEN '2) 1-7 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 30 THEN '3) 8-30 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 90 THEN '4) 1-3 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 180 THEN '5) 3-6 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 365 THEN '6) 6-12 months'
        ELSE '7) Unknown'
      END
  
  - measure: count
    hidden: TRUE
    label: 'Count'
    type: count
    drill_fields: [firstname, lastname, nickname, username]
  
  - measure: registered_users_count
    label: 'Users Count'
    type: count_distinct
    sql: ${customer_id}

