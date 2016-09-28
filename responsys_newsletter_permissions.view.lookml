- view: responsys_newsletter_permissions
  sql_table_name: responsys.responsys_newsletter_permissions_temp
  fields:

  - dimension: brandcode
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.brandcode LIKE '%campaign_brand%' THEN NULL
        WHEN ${TABLE}.brandcode LIKE '%BRANDCODE%' THEN NULL
        WHEN ${TABLE}.brandcode = '106' THEN 'YHS'
        WHEN ${TABLE}.brandcode = '107' THEN 'YRS'
        WHEN ${TABLE}.brandcode = '108' THEN 'ZOO'
        WHEN ${TABLE}.brandcode = '109' THEN 'ZOO'
        WHEN ${TABLE}.brandcode = '110' THEN 'AIR'
        WHEN ${TABLE}.brandcode = '111' THEN 'CFM'
        WHEN ${TABLE}.brandcode = '112' THEN 'CL1'
        WHEN ${TABLE}.brandcode = '113' THEN 'CL2'
        WHEN ${TABLE}.brandcode = '114' THEN 'CL3'
        WHEN ${TABLE}.brandcode = '115' THEN 'COO'
        WHEN ${TABLE}.brandcode = '116' THEN 'FO1'
        WHEN ${TABLE}.brandcode = '117' THEN 'HAL'
        WHEN ${TABLE}.brandcode = '118' THEN 'KER'
        WHEN ${TABLE}.brandcode = '119' THEN 'KEY'
        WHEN ${TABLE}.brandcode = '120' THEN 'KIS'
        WHEN ${TABLE}.brandcode = '121' THEN 'KRR'
        WHEN ${TABLE}.brandcode = '122' THEN 'MAG'
        WHEN ${TABLE}.brandcode = '123' THEN 'MET'
        WHEN ${TABLE}.brandcode = '124' THEN 'MFR'
        WHEN ${TABLE}.brandcode = '125' THEN 'AI2'
        WHEN ${TABLE}.brandcode = '126' THEN 'KE2'
        WHEN ${TABLE}.brandcode = '127' THEN 'RC2'
        WHEN ${TABLE}.brandcode = '128' THEN 'TF2'
        WHEN ${TABLE}.brandcode = '129' THEN 'ME2'
        WHEN ${TABLE}.brandcode = '130' THEN 'VI2'
        WHEN ${TABLE}.brandcode = '131' THEN 'HA2'
        WHEN ${TABLE}.brandcode = '132' THEN 'NO1'
        WHEN ${TABLE}.brandcode = '133' THEN 'NO2'
        WHEN ${TABLE}.brandcode = '134' THEN 'RBO'
        WHEN ${TABLE}.brandcode = '135' THEN 'RCT'
        WHEN ${TABLE}.brandcode = '136' THEN 'ROC'
        WHEN ${TABLE}.brandcode = '137' THEN 'TA2'
        WHEN ${TABLE}.brandcode = '138' THEN 'TAF'
        WHEN ${TABLE}.brandcode = '139' THEN 'TFM'
        WHEN ${TABLE}.brandcode = '140' THEN 'VIK'
        WHEN ${TABLE}.brandcode = '141' THEN 'WVE'
        WHEN ${TABLE}.brandcode = '142' THEN 'RO2'
        WHEN ${TABLE}.brandcode = '143' THEN 'TST'
        WHEN ${TABLE}.brandcode = '144' THEN 'AUM'
        WHEN ${TABLE}.brandcode = '145' THEN 'BWT'
        WHEN ${TABLE}.brandcode = '146' THEN 'CCW'
        WHEN ${TABLE}.brandcode = '147' THEN 'CLC'
        WHEN ${TABLE}.brandcode = '148' THEN 'CMC'
        WHEN ${TABLE}.brandcode = '149' THEN 'FLN'
        WHEN ${TABLE}.brandcode = '150' THEN 'GAN'
        WHEN ${TABLE}.brandcode = '151' THEN 'GTM'
        WHEN ${TABLE}.brandcode = '152' THEN 'MAT'
        WHEN ${TABLE}.brandcode = '153' THEN 'MDR'
        WHEN ${TABLE}.brandcode = '154' THEN 'PFX'
        WHEN ${TABLE}.brandcode = '155' THEN 'RAI'
        WHEN ${TABLE}.brandcode = '156' THEN 'CTK'
        WHEN ${TABLE}.brandcode = '157' THEN 'DOW'
        WHEN ${TABLE}.brandcode = '158' THEN 'DTC'
        WHEN ${TABLE}.brandcode = '159' THEN 'FO3'
        WHEN ${TABLE}.brandcode = '160' THEN 'KE3'
        WHEN ${TABLE}.brandcode = '161' THEN 'ME3'
        WHEN ${TABLE}.brandcode = '162' THEN 'MF2'
        WHEN ${TABLE}.brandcode = '163' THEN 'MF3'
        WHEN ${TABLE}.brandcode = '164' THEN 'RC3'
        WHEN ${TABLE}.brandcode = '165' THEN 'RO3'
        WHEN ${TABLE}.brandcode = '166' THEN 'TA3'
        WHEN ${TABLE}.brandcode = '167' THEN 'TF3'
        WHEN ${TABLE}.brandcode = '168' THEN 'VI3'
        WHEN ${TABLE}.brandcode = '169' THEN 'WES'
        WHEN ${TABLE}.brandcode = '170' THEN 'WSF'
        WHEN ${TABLE}.brandcode = '171' THEN 'WST'
        WHEN ${TABLE}.brandcode = '172' THEN 'HIT'
        WHEN ${TABLE}.brandcode = '173' THEN '2F1'
        WHEN ${TABLE}.brandcode = '174' THEN '2F1'
        WHEN ${TABLE}.brandcode = '175' THEN 'AUM'
        WHEN ${TABLE}.brandcode = '177' THEN 'BIK'
        WHEN ${TABLE}.brandcode = '178' THEN 'BIK'
        WHEN ${TABLE}.brandcode = '179' THEN 'BWT'
        WHEN ${TABLE}.brandcode = '180' THEN 'BWT'
        WHEN ${TABLE}.brandcode = '181' THEN 'CAR'
        WHEN ${TABLE}.brandcode = '182' THEN 'CAR'
        WHEN ${TABLE}.brandcode = '183' THEN 'CLB'
        WHEN ${TABLE}.brandcode = '184' THEN 'CLB'
        WHEN ${TABLE}.brandcode = '185' THEN 'CCS'
        WHEN ${TABLE}.brandcode = '186' THEN 'CCS'
        WHEN ${TABLE}.brandcode = '187' THEN 'CCW'
        WHEN ${TABLE}.brandcode = '188' THEN 'CCW'
        WHEN ${TABLE}.brandcode = '189' THEN 'CIN'
        WHEN ${TABLE}.brandcode = '190' THEN 'CIN'
        WHEN ${TABLE}.brandcode = '191' THEN 'CLB'
        WHEN ${TABLE}.brandcode = '192' THEN 'CLB'
        WHEN ${TABLE}.brandcode = '193' THEN 'CLC'
        WHEN ${TABLE}.brandcode = '194' THEN 'CLC'
        WHEN ${TABLE}.brandcode = '195' THEN 'CLC'
        WHEN ${TABLE}.brandcode = '196' THEN 'CLC'
        WHEN ${TABLE}.brandcode = '197' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '198' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '199' THEN 'CMC'
        WHEN ${TABLE}.brandcode = '200' THEN 'CMC'
        WHEN ${TABLE}.brandcode = '201' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '202' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '203' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '204' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '205' THEN 'FHM'
        WHEN ${TABLE}.brandcode = '206' THEN 'FHM'
        WHEN ${TABLE}.brandcode = '207' THEN 'FLN'
        WHEN ${TABLE}.brandcode = '208' THEN 'FLN'
        WHEN ${TABLE}.brandcode = '209' THEN 'GAN'
        WHEN ${TABLE}.brandcode = '210' THEN 'GAN'
        WHEN ${TABLE}.brandcode = '211' THEN 'GNW'
        WHEN ${TABLE}.brandcode = '212' THEN 'GNW'
        WHEN ${TABLE}.brandcode = '213' THEN 'GNW'
        WHEN ${TABLE}.brandcode = '214' THEN 'GOF'
        WHEN ${TABLE}.brandcode = '215' THEN 'GOF'
        WHEN ${TABLE}.brandcode = '216' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '217' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '218' THEN 'GTB'
        WHEN ${TABLE}.brandcode = '219' THEN 'GTB'
        WHEN ${TABLE}.brandcode = '220' THEN 'GTM'
        WHEN ${TABLE}.brandcode = '221' THEN 'GTM'
        WHEN ${TABLE}.brandcode = '222' THEN 'GWD'
        WHEN ${TABLE}.brandcode = '223' THEN 'GWD'
        WHEN ${TABLE}.brandcode = '224' THEN 'HDE'
        WHEN ${TABLE}.brandcode = '225' THEN 'HDE'
        WHEN ${TABLE}.brandcode = '226' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '227' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '228' THEN 'CLC'
        WHEN ${TABLE}.brandcode = '229' THEN 'LFT'
        WHEN ${TABLE}.brandcode = '230' THEN 'LFT'
        WHEN ${TABLE}.brandcode = '231' THEN 'LRO'
        WHEN ${TABLE}.brandcode = '232' THEN 'LRO'
        WHEN ${TABLE}.brandcode = '233' THEN 'LSC'
        WHEN ${TABLE}.brandcode = '234' THEN 'LSC'
        WHEN ${TABLE}.brandcode = '235' THEN 'MAB'
        WHEN ${TABLE}.brandcode = '236' THEN 'MAB'
        WHEN ${TABLE}.brandcode = '237' THEN 'MAT'
        WHEN ${TABLE}.brandcode = '238' THEN 'MAT'
        WHEN ${TABLE}.brandcode = '239' THEN 'MCN'
        WHEN ${TABLE}.brandcode = '240' THEN 'MCN'
        WHEN ${TABLE}.brandcode = '241' THEN 'MCN'
        WHEN ${TABLE}.brandcode = '242' THEN 'MCN'
        WHEN ${TABLE}.brandcode = '243' THEN 'MDR'
        WHEN ${TABLE}.brandcode = '244' THEN 'MDR'
        WHEN ${TABLE}.brandcode = '245' THEN 'MOJ'
        WHEN ${TABLE}.brandcode = '246' THEN 'MOJ'
        WHEN ${TABLE}.brandcode = '247' THEN 'PAN'
        WHEN ${TABLE}.brandcode = '248' THEN 'PAN'
        WHEN ${TABLE}.brandcode = '249' THEN 'PBK'
        WHEN ${TABLE}.brandcode = '250' THEN 'PBK'
        WHEN ${TABLE}.brandcode = '251' THEN 'PCP'
        WHEN ${TABLE}.brandcode = '252' THEN 'PCP'
        WHEN ${TABLE}.brandcode = '253' THEN 'PCP'
        WHEN ${TABLE}.brandcode = '254' THEN 'PCP'
        WHEN ${TABLE}.brandcode = '255' THEN 'PFI'
        WHEN ${TABLE}.brandcode = '256' THEN 'PFI'
        WHEN ${TABLE}.brandcode = '257' THEN 'PFX'
        WHEN ${TABLE}.brandcode = '258' THEN 'PFX'
        WHEN ${TABLE}.brandcode = '259' THEN 'PPM'
        WHEN ${TABLE}.brandcode = '260' THEN 'PPM'
        WHEN ${TABLE}.brandcode = '261' THEN 'PRC'
        WHEN ${TABLE}.brandcode = '262' THEN 'PRC'
        WHEN ${TABLE}.brandcode = '263' THEN 'PRS'
        WHEN ${TABLE}.brandcode = '264' THEN 'PRS'
        WHEN ${TABLE}.brandcode = '265' THEN 'QQQ'
        WHEN ${TABLE}.brandcode = '266' THEN 'QQQ'
        WHEN ${TABLE}.brandcode = '267' THEN 'RAI'
        WHEN ${TABLE}.brandcode = '268' THEN 'RAI'
        WHEN ${TABLE}.brandcode = '269' THEN 'RDE'
        WHEN ${TABLE}.brandcode = '270' THEN 'RDE'
        WHEN ${TABLE}.brandcode = '271' THEN 'SAN'
        WHEN ${TABLE}.brandcode = '272' THEN 'SAN'
        WHEN ${TABLE}.brandcode = '273' THEN 'SRA'
        WHEN ${TABLE}.brandcode = '274' THEN 'SRA'
        WHEN ${TABLE}.brandcode = '275' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '276' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '277' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '278' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '279' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '280' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '281' THEN 'TRL'
        WHEN ${TABLE}.brandcode = '282' THEN 'TRL'
        WHEN ${TABLE}.brandcode = '283' THEN 'TRR'
        WHEN ${TABLE}.brandcode = '284' THEN 'TRR'
        WHEN ${TABLE}.brandcode = '285' THEN 'TST'
        WHEN ${TABLE}.brandcode = '286' THEN 'TST'
        WHEN ${TABLE}.brandcode = '287' THEN 'WIN'
        WHEN ${TABLE}.brandcode = '288' THEN 'WIN'
        WHEN ${TABLE}.brandcode = '289' THEN 'YHS'
        WHEN ${TABLE}.brandcode = '290' THEN 'YHS'
        WHEN ${TABLE}.brandcode = '291' THEN 'YRS'
        WHEN ${TABLE}.brandcode = '292' THEN 'YRS'
        WHEN ${TABLE}.brandcode = '293' THEN 'ZOO'
        WHEN ${TABLE}.brandcode = '294' THEN 'ZOO'
        WHEN ${TABLE}.brandcode = '295' THEN 'AI3'
        WHEN ${TABLE}.brandcode = '296' THEN 'AI3'
        WHEN ${TABLE}.brandcode = '297' THEN 'AIR'
        WHEN ${TABLE}.brandcode = '298' THEN 'AIR'
        WHEN ${TABLE}.brandcode = '299' THEN 'CFM'
        WHEN ${TABLE}.brandcode = '300' THEN 'CFM'
        WHEN ${TABLE}.brandcode = '301' THEN 'CL1'
        WHEN ${TABLE}.brandcode = '302' THEN 'CL1'
        WHEN ${TABLE}.brandcode = '303' THEN 'CL2'
        WHEN ${TABLE}.brandcode = '304' THEN 'CL2'
        WHEN ${TABLE}.brandcode = '305' THEN 'CL3'
        WHEN ${TABLE}.brandcode = '306' THEN 'CL3'
        WHEN ${TABLE}.brandcode = '307' THEN 'COO'
        WHEN ${TABLE}.brandcode = '308' THEN 'COO'
        WHEN ${TABLE}.brandcode = '309' THEN 'CTK'
        WHEN ${TABLE}.brandcode = '310' THEN 'CTK'
        WHEN ${TABLE}.brandcode = '311' THEN 'DOW'
        WHEN ${TABLE}.brandcode = '312' THEN 'DOW'
        WHEN ${TABLE}.brandcode = '313' THEN 'DTC'
        WHEN ${TABLE}.brandcode = '314' THEN 'DTC'
        WHEN ${TABLE}.brandcode = '315' THEN 'FO1'
        WHEN ${TABLE}.brandcode = '316' THEN 'FO1'
        WHEN ${TABLE}.brandcode = '317' THEN 'FO3'
        WHEN ${TABLE}.brandcode = '318' THEN 'FO3'
        WHEN ${TABLE}.brandcode = '319' THEN 'HAL'
        WHEN ${TABLE}.brandcode = '320' THEN 'HAL'
        WHEN ${TABLE}.brandcode = '321' THEN 'KE3'
        WHEN ${TABLE}.brandcode = '322' THEN 'KE3'
        WHEN ${TABLE}.brandcode = '323' THEN 'KER'
        WHEN ${TABLE}.brandcode = '324' THEN 'KER'
        WHEN ${TABLE}.brandcode = '325' THEN 'KEY'
        WHEN ${TABLE}.brandcode = '326' THEN 'KEY'
        WHEN ${TABLE}.brandcode = '327' THEN 'KIS'
        WHEN ${TABLE}.brandcode = '328' THEN 'KIS'
        WHEN ${TABLE}.brandcode = '329' THEN 'KRR'
        WHEN ${TABLE}.brandcode = '330' THEN 'KRR'
        WHEN ${TABLE}.brandcode = '331' THEN 'MAG'
        WHEN ${TABLE}.brandcode = '332' THEN 'MAG'
        WHEN ${TABLE}.brandcode = '333' THEN 'ME3'
        WHEN ${TABLE}.brandcode = '334' THEN 'ME3'
        WHEN ${TABLE}.brandcode = '335' THEN 'MET'
        WHEN ${TABLE}.brandcode = '336' THEN 'MET'
        WHEN ${TABLE}.brandcode = '337' THEN 'MF2'
        WHEN ${TABLE}.brandcode = '338' THEN 'MF2'
        WHEN ${TABLE}.brandcode = '339' THEN 'MF3'
        WHEN ${TABLE}.brandcode = '340' THEN 'MF3'
        WHEN ${TABLE}.brandcode = '341' THEN 'MFR'
        WHEN ${TABLE}.brandcode = '342' THEN 'MFR'
        WHEN ${TABLE}.brandcode = '343' THEN 'AI2'
        WHEN ${TABLE}.brandcode = '344' THEN 'AI2'
        WHEN ${TABLE}.brandcode = '345' THEN 'KE2'
        WHEN ${TABLE}.brandcode = '346' THEN 'KE2'
        WHEN ${TABLE}.brandcode = '347' THEN 'RC2'
        WHEN ${TABLE}.brandcode = '348' THEN 'RC2'
        WHEN ${TABLE}.brandcode = '349' THEN 'TF2'
        WHEN ${TABLE}.brandcode = '350' THEN 'TF2'
        WHEN ${TABLE}.brandcode = '351' THEN 'ME2'
        WHEN ${TABLE}.brandcode = '352' THEN 'ME2'
        WHEN ${TABLE}.brandcode = '353' THEN 'VI2'
        WHEN ${TABLE}.brandcode = '354' THEN 'VI2'
        WHEN ${TABLE}.brandcode = '355' THEN 'HA2'
        WHEN ${TABLE}.brandcode = '356' THEN 'HA2'
        WHEN ${TABLE}.brandcode = '357' THEN 'NO1'
        WHEN ${TABLE}.brandcode = '358' THEN 'NO1'
        WHEN ${TABLE}.brandcode = '359' THEN 'NO1'
        WHEN ${TABLE}.brandcode = '360' THEN 'NO2'
        WHEN ${TABLE}.brandcode = '361' THEN 'NO2'
        WHEN ${TABLE}.brandcode = '362' THEN 'RBO'
        WHEN ${TABLE}.brandcode = '363' THEN 'RBO'
        WHEN ${TABLE}.brandcode = '364' THEN 'RC3'
        WHEN ${TABLE}.brandcode = '365' THEN 'RC3'
        WHEN ${TABLE}.brandcode = '366' THEN 'RCT'
        WHEN ${TABLE}.brandcode = '367' THEN 'RCT'
        WHEN ${TABLE}.brandcode = '368' THEN 'RO3'
        WHEN ${TABLE}.brandcode = '369' THEN 'RO3'
        WHEN ${TABLE}.brandcode = '370' THEN 'ROC'
        WHEN ${TABLE}.brandcode = '371' THEN 'ROC'
        WHEN ${TABLE}.brandcode = '372' THEN 'TA3'
        WHEN ${TABLE}.brandcode = '373' THEN 'TA3'
        WHEN ${TABLE}.brandcode = '374' THEN 'TA2'
        WHEN ${TABLE}.brandcode = '375' THEN 'TA2'
        WHEN ${TABLE}.brandcode = '376' THEN 'TAF'
        WHEN ${TABLE}.brandcode = '377' THEN 'TAF'
        WHEN ${TABLE}.brandcode = '378' THEN 'TF3'
        WHEN ${TABLE}.brandcode = '379' THEN 'TF3'
        WHEN ${TABLE}.brandcode = '380' THEN 'TFM'
        WHEN ${TABLE}.brandcode = '381' THEN 'TFM'
        WHEN ${TABLE}.brandcode = '382' THEN 'VI3'
        WHEN ${TABLE}.brandcode = '383' THEN 'VI3'
        WHEN ${TABLE}.brandcode = '384' THEN 'VIK'
        WHEN ${TABLE}.brandcode = '385' THEN 'VIK'
        WHEN ${TABLE}.brandcode = '386' THEN 'WES'
        WHEN ${TABLE}.brandcode = '387' THEN 'WES'
        WHEN ${TABLE}.brandcode = '388' THEN 'WSF'
        WHEN ${TABLE}.brandcode = '389' THEN 'WSF'
        WHEN ${TABLE}.brandcode = '390' THEN 'ALO'
        WHEN ${TABLE}.brandcode = '391' THEN 'WST'
        WHEN ${TABLE}.brandcode = '392' THEN 'ALO'
        WHEN ${TABLE}.brandcode = '393' THEN 'WST'
        WHEN ${TABLE}.brandcode = '394' THEN 'ALO'
        WHEN ${TABLE}.brandcode = '395' THEN 'WVE'
        WHEN ${TABLE}.brandcode = '396' THEN 'WVE'
        WHEN ${TABLE}.brandcode = '397' THEN 'HIT'
        WHEN ${TABLE}.brandcode = '398' THEN 'HIT'
        WHEN ${TABLE}.brandcode = '399' THEN 'RO2'
        WHEN ${TABLE}.brandcode = '400' THEN 'RO2'
        WHEN ${TABLE}.brandcode = '401' THEN 'CPL'
        WHEN ${TABLE}.brandcode = '402' THEN 'CPL'
        WHEN ${TABLE}.brandcode = '403' THEN 'CPL'
        WHEN ${TABLE}.brandcode = '404' THEN 'FO2'
        WHEN ${TABLE}.brandcode = '405' THEN 'FO2'
        WHEN ${TABLE}.brandcode = '406' THEN 'FO2'
        WHEN ${TABLE}.brandcode = '407' THEN 'HA3'
        WHEN ${TABLE}.brandcode = '408' THEN 'HA3'
        WHEN ${TABLE}.brandcode = '409' THEN 'HA3'
        WHEN ${TABLE}.brandcode = '410' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '411' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '412' THEN 'PAN'
        WHEN ${TABLE}.brandcode = '413' THEN 'PAN'
        WHEN ${TABLE}.brandcode = '414' THEN 'PAN'
        WHEN ${TABLE}.brandcode = '415' THEN 'SRA'
        WHEN ${TABLE}.brandcode = '416' THEN 'TRL'
        WHEN ${TABLE}.brandcode = '417' THEN 'AI3'
        WHEN ${TABLE}.brandcode = '418' THEN 'PAN'
        WHEN ${TABLE}.brandcode = '419' THEN 'GAN'
        WHEN ${TABLE}.brandcode = '420' THEN 'PPM'
        WHEN ${TABLE}.brandcode = '421' THEN 'ABR'
        WHEN ${TABLE}.brandcode = '422' THEN 'PLR'
        WHEN ${TABLE}.brandcode = '176' THEN 'BUT'
        WHEN ${TABLE}.brandcode = '2' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '3' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '4' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '5' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '6' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '7' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '8' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '9' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '10' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '11' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '12' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '13' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '14' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '15' THEN 'CLO'
        WHEN ${TABLE}.brandcode = '16' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '17' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '18' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '19' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '20' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '21' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '22' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '23' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '24' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '25' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '26' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '27' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '28' THEN 'GRA'
        WHEN ${TABLE}.brandcode = '29' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '30' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '31' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '32' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '33' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '34' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '35' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '36' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '37' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '38' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '39' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '40' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '41' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '42' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '43' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '44' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '45' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '46' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '47' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '48' THEN 'HEA'
        WHEN ${TABLE}.brandcode = '49' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '50' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '51' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '52' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '53' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '54' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '55' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '56' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '57' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '58' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '59' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '60' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '61' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '62' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '63' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '64' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '65' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '66' THEN 'DBF'
        WHEN ${TABLE}.brandcode = '67' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '68' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '69' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '70' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '71' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '72' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '73' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '74' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '75' THEN 'EMP'
        WHEN ${TABLE}.brandcode = '76' THEN 'BIK'
        WHEN ${TABLE}.brandcode = '77' THEN 'CAR'
        WHEN ${TABLE}.brandcode = '78' THEN 'CLB'
        WHEN ${TABLE}.brandcode = '79' THEN 'CCS'
        WHEN ${TABLE}.brandcode = '80' THEN 'CIN'
        WHEN ${TABLE}.brandcode = '81' THEN 'CLC'
        WHEN ${TABLE}.brandcode = '82' THEN 'FHM'
        WHEN ${TABLE}.brandcode = '83' THEN 'GNW'
        WHEN ${TABLE}.brandcode = '84' THEN 'GOF'
        WHEN ${TABLE}.brandcode = '85' THEN 'GTB'
        WHEN ${TABLE}.brandcode = '86' THEN 'HDE'
        WHEN ${TABLE}.brandcode = '87' THEN 'LFT'
        WHEN ${TABLE}.brandcode = '88' THEN 'LRO'
        WHEN ${TABLE}.brandcode = '89' THEN 'MAB'
        WHEN ${TABLE}.brandcode = '90' THEN 'MCN'
        WHEN ${TABLE}.brandcode = '91' THEN 'MOJ'
        WHEN ${TABLE}.brandcode = '92' THEN 'PAN'
        WHEN ${TABLE}.brandcode = '93' THEN 'PBK'
        WHEN ${TABLE}.brandcode = '94' THEN 'PCP'
        WHEN ${TABLE}.brandcode = '95' THEN 'PCP'
        WHEN ${TABLE}.brandcode = '96' THEN 'PFI'
        WHEN ${TABLE}.brandcode = '97' THEN 'PRC'
        WHEN ${TABLE}.brandcode = '98' THEN 'QQQ'
        WHEN ${TABLE}.brandcode = '99' THEN 'RDE'
        WHEN ${TABLE}.brandcode = '100' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '101' THEN 'LSC'
        WHEN ${TABLE}.brandcode = '102' THEN 'PRS'
        WHEN ${TABLE}.brandcode = '103' THEN '2F1'
        WHEN ${TABLE}.brandcode = '104' THEN 'TDG'
        WHEN ${TABLE}.brandcode = '105' THEN 'TRR'
        ELSE ${TABLE}.brandcode
      END
      
  - dimension: newsletter_id
    type: string
    sql: ${TABLE}.brandcode

  - dimension: created_date
    label: 'Created'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.created_date,'YYYY-MM-DD')
    
  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: modified_date
    label: 'Updated'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.modified_date,'YYYY-MM-DD')

  - dimension: optin
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.optin = '6' THEN '0'
        ELSE ${TABLE}.optin
      END

  - dimension: optin_date
    label: 'Optin'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.optin_date,'YYYY-MM-DD')

  - dimension: unsub_date
    label: 'Unsub'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.unsub_date,'YYYY-MM-DD')
    
  - measure: newsletter_optins
    type: count_distinct
    sql: ${TABLE}.email_address
    filters:
      optin: '1'
      responsys_brand_permissions.optin: '1'
      