variable "credentials" {
  description = "GCP JSON Key path"
  default     = "./keys/gcp_key.json"
}
variable "project" {
  description = "Project ID"
  default     = "high-magpie-412123"
}
variable "region" {
  description = "Project Region"
  default     = "us-central1"
}
variable "location" {
  description = "Project Location"
  default     = "US"
}
variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "terraform-demo-bucket-high-magpie-412123"
}

variable "gcs_storage_class" {
  description = "Bucket Storage"
  default     = "STANDARD"
}