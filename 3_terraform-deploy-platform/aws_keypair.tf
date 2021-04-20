
resource "aws_key_pair" "workshop-0001-axwayv7-key" {
  key_name   = "workshop-0001-axwayv7-key"
  public_key = file ("../keys/axwayv7-key.pub")
}


















