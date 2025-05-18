resource "aws_key_pair" "vpckeypair" {
  key_name   = "surajit-KeyPair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
