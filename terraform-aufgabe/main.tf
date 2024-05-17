# Archivo de configuración de Terraform para crear una instancia EC2 y aprovisionar Nginx en ella en la región Frankfurt

# Configuración del proveedor AWS
provider "aws" {
  region = "eu-central-1"  # Cambio de región a Frankfurt
}

# Recurso de instancia EC2
resource "aws_instance" "mi_instancia" {
  ami           = "ami-01e444924a2233b07"  
  instance_type = "t2.micro"               

  tags = {
    Name = "MiInstanciaEC2"
  }

  associate_public_ip_address = true  

  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}
