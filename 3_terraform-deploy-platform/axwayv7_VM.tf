resource "aws_instance" "techlab1234-axwayv7" {
  ami                         = data.aws_ami.techlab1234-axwayv7.id # eu-west-2
  instance_type               = "t2.large"
  key_name                    = "techlab1234-axwayv7-key"
  security_groups             = [aws_security_group.techlab1234-nginx-web-facing.id]
  subnet_id                   = aws_subnet.techlab1234-main.id
  private_ip                  = "10.0.1.20"
  
  tags = {
    Name = "techlab1234-axwayv7"
  }

  
  
  
}



resource "null_resource" "post-instantiation-VM-actions" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    trigger1 = aws_route53_record.techlab1234-apimanager.ttl
  }
  
  provisioner "remote-exec" {
  
    connection {
    type     = "ssh"
    user     = "ubuntu"
	private_key = file("../keys/axwayv7-key.pem")
    host     = aws_instance.techlab1234-axwayv7.public_ip
  }
  
        inline = [
		"sudo hostnamectl set-hostname apimanager",
	    "#sudo ./APIGateway_7.7.20210130_Install_linux-x86-64_BN04.run --mode unattended --unattendedmodeui minimalWithDialogs --setup_type complete --adminpasswd Space*117 --changeCredentials 0 --apimgmtusername apiadmin --apiadminpasswd Space*117 --changeApimgmtCredentials 0 --licenseFilePath resources/api7.lic --analyticsLicenseFilePath resources/api7.lic --apimgmtLicenseFilePath resources/api7.lic --prefix /opt/Axway-7.7.0 --cassandraInstalldir /opt --cassandraJDK  /usr/lib/jvm/java-8-openjdk-amd64/jre --startCassandra 1",
		"#until sudo apt-get update -y; do sleep 10; done",
		"#until sudo apt-get upgrade -y; do sleep 10; done"


    ]
  }

}



