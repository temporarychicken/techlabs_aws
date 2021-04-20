
# Fetch AWS Axway V7 AMI identifier
data "aws_ami" "workshop-0001-axwayv7" {
  most_recent = true
  owners      = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "techlab-axwayv7",
    ]
  }
}


















