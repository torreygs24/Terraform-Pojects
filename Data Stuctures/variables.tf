#Object - Set of key/value pairs but each can be of different type. (Example below)
variable "network_info" {
  type = object( #an object with multiple types
    {
      network_name = string
      cidr_ranges  = list(string)
      subnet_count = number
      subnet_mask  = number
      nat_enabled  = bool

    }
  )
}
#Example of Object
network_name = "my_net"
cidr_ranges  = ["10.0.0.0/24", "10.0.1.0/24"]
subnet_count = 2
subnet_mask  = 25
nat_enabled  = false


#Tuple - Similar in nature to a list, it is an indexed set of values where each value can be of a diff type
variable "pi_tuple" {
  type = tuple( #A tuple with four types
    [string, number, bool, list(number)]
  )
}

#example of the tuple
variable "example_tuple" {
  type = tuple([
   ["a", 15, true]
   ]
  )
}