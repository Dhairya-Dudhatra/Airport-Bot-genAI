variable "create_new_project" {
  type        = bool
  description = "Weather or not to create a new project or not. If true, set project_id to the ID if the project you want to create these resources in."
}

variable "project_id" {
  type = string
}

variable "region" {
  type        = string
  description = "GCP region in which the project needs to be setup (us-central1, us-east4, asia-south1, etc)"
}

