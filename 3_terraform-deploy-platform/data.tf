
# Fetch AWS Axway V7 AMI identifier
data "aws_ami" "techlab0001-axwayv7" {
  most_recent = true
  owners      = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "techlab0001-axwayv7",
    ]
  }
}





