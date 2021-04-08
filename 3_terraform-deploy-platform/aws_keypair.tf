
resource "aws_key_pair" "techlab1234-axwayv7-key" {
  key_name   = "techlab1234-axwayv7-key"
  public_key = file ("../keys/axwayv7-key.pub")
}




