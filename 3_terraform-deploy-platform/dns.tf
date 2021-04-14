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


resource "aws_route53_record" "george-lab-apimanager" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apimanager.george-lab.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.george-lab-axwayv7.public_ip ]

}


resource "aws_route53_record" "george-lab-apigateway" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apigateway.george-lab.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.george-lab-axwayv7.public_ip ]

}

resource "aws_route53_record" "george-lab-apiportal" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apiportal.george-lab.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.george-lab-axwayv7.public_ip ]

}

resource "aws_route53_record" "george-lab-apibuilder" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apibuilder.george-lab.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.george-lab-axwayv7.public_ip ]

}


resource "aws_route53_record" "george-lab-jenkins" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "jenkins.george-lab.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.george-lab-axwayv7.public_ip ]

}

resource "aws_route53_record" "george-lab-api" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "api.george-lab.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.george-lab-axwayv7.public_ip ]

}

# This gets your IP from a simple HTTP request - note it's V4.
data "http" "myip" {
  url = "https://api.ipify.org"
}













