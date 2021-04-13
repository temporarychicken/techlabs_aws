
resource "aws_key_pair" "techlab0002-axwayv7-key" {
  key_name   = "techlab0002-axwayv7-key"
  public_key = file ("../keys/axwayv7-key.pub")
}










