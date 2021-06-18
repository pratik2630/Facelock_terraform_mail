provider "aws"{

region = "ap-south-1"
profile = "Pratik"

}


#Launching EC2 instance
resource "aws_instance""ec2_os"{
    availability_zone = "ap-south-1b"
    instance_type = "t2.micro"
    ami = "ami-0ad704c126371a549"
    tags = {
        Name = "Test_ec2"
    }
}

output "Instance_IP" {
    value = aws_instance.ec2_os.public_ip
 
}

#Creating volume
resource "aws_ebs_volume" "ebs_vol"{
    availability_zone = aws_instance.ec2_os.availability_zone
    size = 20
    tags = {

        Name = "Task_Ebs"
    }
}

output "volume_Id" {
    value = aws_ebs_volume.ebs_vol.id
}

#Attaching EBS to EC2 instance
resource "aws_volume_attachment" "ebs_attach"{
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.ebs_vol.id
    instance_id = aws_instance.ec2_os.id
}

#Printing all outputs
#output "op1"{

 #   az = aws_instance.ec2_os.availability_zone
 #  instance_id = aws_instance.ec2_os
 #   volume_id = aws_ebs_volume.ebs_vol.id
#  value = aws_volume_attachment.ebs_attach
#}
