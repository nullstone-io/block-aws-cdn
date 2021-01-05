module "cert" {
  source = "./cert"

  domain    = local.main_subdomain
  alt_names = local.alt_subdomains
  tags      = data.ns_workspace.this.tags

  count = local.has_domain ? 1 : 0
}

locals {
  cert_arn = try(data.ns_connection.subdomain.outputs.cert_arn, module.cert.certificate_arn)
}
