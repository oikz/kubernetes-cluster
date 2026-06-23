variable "tenancy_ocid" {
  type = string
  sensitive = true
}
variable "user_ocid" {
  type = string
  sensitive = true
}
variable "fingerprint" {
  type = string
  sensitive = true
}
variable "private_key" {
  type = string
  sensitive = true
}
variable "region" {
  type = string
}
variable "compartment_id" {
  type = string
  sensitive = true
}
variable "public_key" {
  type = string
  sensitive = true
}
variable "timezone" {
  type = string
}
