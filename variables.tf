variable "ami" {
    default = ["ami-0e1d06225679bc1c5", "ami-0f58b397bc5c1f2e8", "ami-040acbfd65da0c993"]
    type = list(any)
    description = "ami's from aws instances"
}

variable "instance_type" {
    default = "t2.micro"
    type    = string 
    description  = "instance type"
}

variable "subnet_id" {
    default = ["subnet-0a701d42726922f88", "subnet-089a602ca15fa36da", "subnet-031a9068ec8490752"]
    type    = list(any)
    description = "id's of subnets where the instances will be deployed"
}