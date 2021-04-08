
# Fetch AWS Axway V7 AMI identifier
data "aws_ami" "techlab1234-axwayv7" {
  most_recent = true
  owners      = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "techlab1234-axwayv7",
    ]
  }
}




