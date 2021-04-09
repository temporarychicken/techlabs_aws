
resource "aws_key_pair" "peanuts-axwayv7-key" {
  key_name   = "peanuts-axwayv7-key"
  public_key = file ("../keys/axwayv7-key.pub")
}






