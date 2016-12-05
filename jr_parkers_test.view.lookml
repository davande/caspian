
- view: parkers_competing_car_view
  label: 'z: Competitior Search'
  derived_table:
    sql: |
      SELECT
        COMPETITORCAROUTPUT.CAR,COUNT(COMPETITORCAROUTPUT.CAR) AS VIEWS
      FROM
        (SELECT 
          REGEXP_EXTRACT(FULLBIGQUERYTABLERESULTS.pagePath, r'^.*\/(abarth|alfa-romeo|aston\-martin|audi|bentley|bmw|bugatti|caterham|citroën|dacia|ds|ferrari|fiat|ford|honda|hyundai|infiniti|jaguar|jeep|kia|lamborghini|land-rover|lexus|lotus|maserati|mazda|mclaren|mercedes\-benz|mg|mg-motor-uk|mini|mitsubishi|nissan|peugeot|porsche|renault|rolls\-royce|seat|skoda|smart|ssangyong|subaru|suzuki|tesla|toyota|vauxhall|volkswagen|volvo)\/(?:.+?)\/(?:.*)?') + ' ' + REGEXP_EXTRACT(FULLBIGQUERYTABLERESULTS.pagePath, r'^.*\/(?:abarth|alfa-romeo|aston\-martin|audi|bentley|bmw|bugatti|caterham|citroën|dacia|ds|ferrari|fiat|ford|honda|hyundai|infiniti|jaguar|jeep|kia|lamborghini|land-rover|lexus|lotus|maserati|mazda|mclaren|mercedes\-benz|mg|mg-motor-uk|mini|mitsubishi|nissan|peugeot|porsche|renault|rolls\-royce|seat|skoda|smart|ssangyong|subaru|suzuki|tesla|toyota|vauxhall|volkswagen|volvo)\/(.+?)\/(?:.*)?') AS CAR
        FROM
          (SELECT
            fullVisitorId AS VisitorId, //BIGQUERYVISITORRESULTS.VisitorId
          FROM
            FLATTEN(
              (SELECT
                *
              FROM
                (SELECT * FROM (TABLE_DATE_RANGE([24089672.ga_sessions_],TIMESTAMP(TIMESTAMP('2016-11-25')),TIMESTAMP(DATE_ADD(TIMESTAMP('2016-11-30'),-1, 'SECOND')))))
              )
            , hits)
          WHERE hits.page.pagePath LIKE '%ford/fiesta%' AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
          GROUP BY VisitorId
          ) AS BIGQUERYVISITORRESULTS
    
        JOIN
  
          (SELECT
            fullVisitorId AS VisitorId, //FULLBIGQUERYTABLERESULTS.VisitorId
            hits.page.pagePath AS pagePath //FULLBIGQUERYTABLERESULTS.pagePath
          FROM
            FLATTEN(
              (SELECT
                *
              FROM
                (SELECT * FROM (TABLE_DATE_RANGE([24089672.ga_sessions_],TIMESTAMP(TIMESTAMP('2016-11-25')),TIMESTAMP(DATE_ADD(TIMESTAMP('2016-11-30'),-1, 'SECOND')))))
              )
            , hits)
          WHERE (hits.page.pagePath LIKE  '%abarth%' OR hits.page.pagePath LIKE '%alfa-romeo%' OR hits.page.pagePath LIKE '%aston-martin%' OR hits.page.pagePath LIKE '%audi%' OR hits.page.pagePath LIKE '%bentley%' OR hits.page.pagePath LIKE '%bmw%' OR hits.page.pagePath LIKE '%bugatti%' OR hits.page.pagePath LIKE '%caterham%' OR hits.page.pagePath LIKE '%citroën%' OR hits.page.pagePath LIKE '%dacia%' OR hits.page.pagePath LIKE '%ds%' OR hits.page.pagePath LIKE '%ferrari%' OR hits.page.pagePath LIKE '%fiat%' OR hits.page.pagePath LIKE '%ford%' OR hits.page.pagePath LIKE '%honda%' OR hits.page.pagePath LIKE '%hyundai%' OR hits.page.pagePath LIKE '%infiniti%' OR hits.page.pagePath LIKE '%jaguar%' OR hits.page.pagePath LIKE '%jeep%' OR hits.page.pagePath LIKE '%kia%' OR hits.page.pagePath LIKE '%lamborghini%' OR hits.page.pagePath LIKE '%land-rover%' OR hits.page.pagePath LIKE '%lexus%' OR hits.page.pagePath LIKE '%lotus%' OR hits.page.pagePath LIKE '%maserati%' OR hits.page.pagePath LIKE '%mazda%' OR hits.page.pagePath LIKE '%mclaren%' OR hits.page.pagePath LIKE '%mercedes-benz%' OR hits.page.pagePath LIKE '%mg%' OR hits.page.pagePath LIKE '%mg-motor-uk%' OR hits.page.pagePath LIKE '%mini%' OR hits.page.pagePath LIKE '%mitsubishi%' OR hits.page.pagePath LIKE '%nissan%' OR hits.page.pagePath LIKE '%peugeot%' OR hits.page.pagePath LIKE '%porsche%' OR hits.page.pagePath LIKE '%renault%' OR hits.page.pagePath LIKE '%rolls-royce%' OR hits.page.pagePath LIKE '%seat%' OR hits.page.pagePath LIKE '%skoda%' OR hits.page.pagePath LIKE '%smart%' OR hits.page.pagePath LIKE '%ssangyong%' OR hits.page.pagePath LIKE '%subaru%' OR hits.page.pagePath LIKE '%suzuki%' OR hits.page.pagePath LIKE '%tesla%' OR hits.page.pagePath LIKE '%toyota%' OR hits.page.pagePath LIKE '%vauxhall%' OR hits.page.pagePath LIKE '%volkswagen%' OR hits.page.pagePath LIKE '%volvo%')
          AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
          ) AS FULLBIGQUERYTABLERESULTS
        ON BIGQUERYVISITORRESULTS.VisitorId = FULLBIGQUERYTABLERESULTS.VisitorId
        ) AS COMPETITORCAROUTPUT
      GROUP BY COMPETITORCAROUTPUT.CAR
      ORDER BY VIEWS DESC

  fields:
  - filter: date_filter
    type: date
  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())
  
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: competitorcaroutput_car
    type: string
    sql: ${TABLE}.COMPETITORCAROUTPUT_CAR

  - dimension: views
    type: number
    sql: ${TABLE}.VIEWS
    
  - dimension: full_Visitor_Id
    type: string
    primary_key: true
    sql: ${TABLE}.ga_sessions_full_visitor_id

  sets:
    detail:
      - competitorcaroutput_car
      - views

