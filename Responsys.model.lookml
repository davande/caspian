- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: responsy_active
  label: 'Email Campaign Data'
  persist_for: 2 hour
  joins:
  
    - join: responsy_device
      type: inner
      relationship: one_to_one
      sql_on: ${responsy_active.concatid} = ${responsy_device.concat_id}
  
    - join: bauer_list
      type: inner
      relationship: one_to_one
      sql_on: ${bauer_list.email_address} = ${responsy_active.email_address}
    
    - join: brand_lookup
      type: inner
      relationship: one_to_one
      sql_on: ${brand_lookup.bra_code} = substring(UPPER(${responsy_active.launch_name}),1,3)

    - join: gigya_users
      type: inner
      relationship: one_to_one
      sql_on: ${gigya_users.email} = ${bauer_list.email_address}
    
    - join: gigya_brand_optin
      type: inner
      relationship: one_to_one
      sql_on: ${gigya_brand_optin.gigya_id} = ${gigya_users.gigya_id}    
      
    - join: gigya_newsletters
      type: inner
      relationship: one_to_one
      sql_on: ${gigya_newsletters.gigya_id} = ${gigya_users.gigya_id}
  
    - join: identities
      type: inner
      relationship: one_to_one
      sql_on: ${identities.email} = ${bauer_list.email_address}
    
    - join: brand_preferences
      type: inner
      relationship: one_to_many
      sql_on: ${brand_preferences.idd_id} = ${identities.idd_id}
      
- explore: responsys_engaged_list
  label: 'Emailable Numbers'
  persist_for: 2 hour
  joins:
  
    - join: responsys_newsletter_permissions
      type: left_outer
      relationship: one_to_many
      sql_on: ${responsys_engaged_list.email_address} = ${responsys_newsletter_permissions.email_address}

    - join: responsys_brand_permissions
      type: left_outer
      relationship: one_to_many
      sql_on: ${responsys_engaged_list.email_address} = ${responsys_brand_permissions.email_address}
      
# - explore: email_list
#   label: 'Testing - In Dev'
#   persist_for: 2 hour
      
  
    
    