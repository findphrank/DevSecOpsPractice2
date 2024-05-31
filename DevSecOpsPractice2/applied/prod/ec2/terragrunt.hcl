terraform {
   source =  "../../..//infrastructure/region/ec2" 
}

include {
  path = find_in_parent_folders()
}
