terraform {
   source =  "../../..//modules/oidc_provider" 
}

include {
  path = find_in_parent_folders()
}