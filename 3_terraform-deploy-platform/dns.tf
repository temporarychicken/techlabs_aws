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


resource "aws_route53_record" "peanuts-apimanager" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apimanager.peanuts.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.peanuts-axwayv7.public_ip ]

}


resource "aws_route53_record" "peanuts-apigateway" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apigateway.peanuts.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.peanuts-axwayv7.public_ip ]

}

resource "aws_route53_record" "peanuts-apiportal" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apiportal.peanuts.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.peanuts-axwayv7.public_ip ]

}

resource "aws_route53_record" "peanuts-apibuilder" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apibuilder.peanuts.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.peanuts-axwayv7.public_ip ]

}


resource "aws_route53_record" "peanuts-jenkins" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "jenkins.peanuts.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.peanuts-axwayv7.public_ip ]

}


# This gets your IP from a simple HTTP request - note it's V4.
data "http" "myip" {
  url = "https://api.ipify.org"
}






