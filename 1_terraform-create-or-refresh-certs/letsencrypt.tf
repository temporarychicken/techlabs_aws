terraform {
  required_providers {
    acme = {
      source = "vancluever/acme"
      version = "~> 2.0"
    }
  }
}


provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}
 
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "dluke@axway.com"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = "*.george-lab.axwaydemo.net"
 
  dns_challenge {
    provider = "route53"
  }
}

resource "local_file" "crt" {
    content     = acme_certificate.certificate.certificate_pem
    filename = "../certs/george-lab.axwaydemo.net.crt.pem"
}

resource "local_file" "key" {
    content     = acme_certificate.certificate.private_key_pem
    filename = "../certs/george-lab.axwaydemo.net.key.pem"
}

resource "local_file" "issuer" {
    content     = acme_certificate.certificate.issuer_pem
    filename = "../certs/george-lab.axwaydemo.net.issuer.pem"
}

resource "local_file" "nginx-crt" {
    content = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
	filename = "../certs/fullchain.pem"
}

resource "local_file" "nginx-key" {
    content = acme_certificate.certificate.private_key_pem
	filename = "../certs/privkey.pem"
}











