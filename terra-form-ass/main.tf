#Create Using locals
resource "local_file" "pctfile1" {
  filename = local.user
  content = "${random_id.content.hex}"
}


locals {
  user="test.txt"
  content="I am from ABCD"
  phone=878734567
  age=24
}

# using the random_id
resource "random_id" "content" {
  byte_length = 5
}
#using the Number
resource "local_file" "pctfile2" {
  filename = "value.txt"
  content = var.window
}

variable "window" {
  type=number
  description="what is the value"
  default = 123456
}

# using "String"
resource "local_file" "pctfile3" {
  filename = "Abc.txt"
  content = var.tabs
}

variable "tabs" {
  type=string
  description="Value is Important"
  default = "Mobile is fully Charge"
}

#using object
resource "local_file" "pctfile4" {
  filename = "obj.txt"
  content = var.mobile["content"]

}

variable "mobile" {
  type=object({
    filenames=string,
    content=number
  })
  description = "Number ofcharge Mobile "
  default = {
    content = 15251525
    filenames = "RedMi MI mobile"
  }
}

 # USING map
 resource "local_file" "pctfile5" {
   filename ="match.txt"
   content=var.Amazon["service1"]
 }
 variable "Amazon" {
   type=map(any)   # for map access the key using key 
   description = "Pass Any Amount"
   default = {
     "service1" = "Application"
      "service2"="Networking" 
   }
 }

 #using list

 resource "local_file" "pctfile6" {
   filename = "space.txt"
   content = var.boat[2] # In List access the value using index 
 }

variable "boat" {
    type = list(any)
    description = "pass the value of content"
    default = [ "Abhi","HighAmount Price","amazon web service" ]
  
}

# using the terraform.tfvars
resource "local_file" "pctfile7" {
   filename = var.user
   content = var.content
  }


# output block
resource "local_file" "pctfile9" {
  filename = var.user
  content = var.content
}

output "output_name" {
  value=local_file.pctfile9.filename #output block is for fetching the contain from the variable
}# to see what is the value of this content in my console i am create the output block 


