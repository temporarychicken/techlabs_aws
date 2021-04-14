
resource "aws_key_pair" "george-lab-axwayv7-key" {
  key_name   = "george-lab-axwayv7-key"
  public_key = file ("../keys/axwayv7-key.pub")
}













