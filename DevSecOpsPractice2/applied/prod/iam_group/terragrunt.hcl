terraform {
   source =  "../../..//infrastructure/region/iam_group" 
}

include {
  path = find_in_parent_folders()
}