terraform {
   source =  "../../..//modules/oidc_proxy_worker" 
}

include {
  path = find_in_parent_folders()
}