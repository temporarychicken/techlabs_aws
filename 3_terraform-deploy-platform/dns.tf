# Set some defaults for AWS like region.
#provider "aws" {
# profile = "default"
# region  = "eu-west-2"
#}


# Locate the correct zone from Route53

data "aws_route53_zone" "selected" {
  name         = "axwaydemo.net"
  private_zone = false
}


resource "aws_route53_record" "techlab0001-apimanager" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apimanager.techlab0001.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.techlab0001-axwayv7.public_ip ]

}


resource "aws_route53_record" "techlab0001-apigateway" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apigateway.techlab0001.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.techlab0001-axwayv7.public_ip ]

}

resource "aws_route53_record" "techlab0001-apiportal" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apiportal.techlab0001.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.techlab0001-axwayv7.public_ip ]

}

resource "aws_route53_record" "techlab0001-apibuilder" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apibuilder.techlab0001.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.techlab0001-axwayv7.public_ip ]

}


resource "aws_route53_record" "techlab0001-jenkins" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "jenkins.techlab0001.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.techlab0001-axwayv7.public_ip ]

}


# This gets your IP from a simple HTTP request - note it's V4.
data "http" "myip" {
  url = "https://api.ipify.org"
}








