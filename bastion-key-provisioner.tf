resource "null_resource" "ec2-key-pair" {

  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    #private_key = file("eks-terraform-key")
    private_key = file("${path.module}/eks-terraform-key.pem")
  }


  provisioner "file" {
    source      = "/home/sunil/infraprojects/terraform-vpc-bastion-eks/eks-terraform-key.pem"
    destination = "/tmp/eks-terraform-key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/eks-terraform-key.pem"
    ]
  }

  #explicit dependency modules 
  depends_on = [module.vpc, module.ec2_bastion]
}
