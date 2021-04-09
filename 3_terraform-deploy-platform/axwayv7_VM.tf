resource "aws_instance" "peanuts-axwayv7" {
  ami                         = data.aws_ami.peanuts-axwayv7.id # eu-west-2
  instance_type               = "t2.large"
  key_name                    = "peanuts-axwayv7-key"
  security_groups             = [aws_security_group.peanuts-nginx-web-facing.id]
  subnet_id                   = aws_subnet.peanuts-main.id
  private_ip                  = "10.0.1.20"
  
  tags = {
    Name = "peanuts-axwayv7"
  }

    provisioner "file" {
    source      = "../certs"
    destination = "/home/ubuntu/"
	
	
    connection {   
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("../keys/axwayv7-key.pem")
    }   
	
  }
  
    provisioner "file" {
    source      = "../2_packer-build-aws-ami-images/resources/default"
    destination = "/home/ubuntu/default"
	
	
    connection {   
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("../keys/axwayv7-key.pem")
    }   
	
  }

  
}



resource "null_resource" "post-instantiation-VM-actions" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    trigger1  = aws_route53_record.peanuts-apimanager.ttl
  }
  
  provisioner "remote-exec" {
  
    connection {
    type     = "ssh"
    user     = "ubuntu"
	private_key = file("../keys/axwayv7-key.pem")
    host     = aws_instance.peanuts-axwayv7.public_ip
  }
  
        inline = [
		"sudo hostnamectl set-hostname apimanager",
		"sleep 30",
		"sudo cp default /etc/nginx/sites-enabled/",
		"sudo nginx -s reload",
	    "#sudo ./APIGateway_7.7.20210130_Install_linux-x86-64_BN04.run --mode unattended --unattendedmodeui minimalWithDialogs --setup_type complete --adminpasswd Space*117 --changeCredentials 0 --apimgmtusername apiadmin --apiadminpasswd Space*117 --changeApimgmtCredentials 0 --licenseFilePath resources/api7.lic --analyticsLicenseFilePath resources/api7.lic --apimgmtLicenseFilePath resources/api7.lic --prefix /opt/Axway-7.7.0 --cassandraInstalldir /opt --cassandraJDK  /usr/lib/jvm/java-8-openjdk-amd64/jre --startCassandra 1",
		"#until sudo apt-get update -y; do sleep 10; done",
		"#until sudo apt-get upgrade -y; do sleep 10; done"


    ]
  }

}

resource "null_resource" "configure_nginx_reverse_proxy_with_subdomain_certs" {

  triggers = {
    trigger2 = aws_route53_record.peanuts-apimanager.ttl
  }
  
  provisioner "local-exec" {
    command     = "echo 'Triggered local exec'>nicefile.txt"
	interpreter = ["PowerShell"]
  }	
}





