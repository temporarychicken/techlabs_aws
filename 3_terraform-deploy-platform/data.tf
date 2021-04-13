
# Fetch AWS Axway V7 AMI identifier
data "aws_ami" "techlab0002-axwayv7" {
  most_recent = true
  owners      = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "techlab-axwayv7",
    ]
  }
}










