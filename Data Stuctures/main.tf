#there are three primitive types in Terraform: string, number, boolean
variable "my_bool" {
  type = bool
  default = true
} # In the above example, you can sub the type for any listed type.
# Primitive types have a singe value.

# Collection and Structural types have multiple values.
# These types are LIST,SET, MAP.
# LIST -List of values in sequence starting at position 0.
# MAP - Collection of values identified by unique key of type string.
# SET - Collection of unique values with no identifiers or ordering.

variable "my_list" {
  type = list(string) # A list of strings
}

variable "my_map" {
  type = map(number) # A map with number values
}
# list examples
[1,2,3,4] # A valid list of 4 numbers with 1 position being 0
["a", 2, fales] # Not valid list

# Map Examples
{ # A map with two keys and list values
        "one" = [3,1,4]
        "two" = ["pi", "is", "good"]
}

{ #A map with two keys and number values
        "one" = 1
        "two" = 2
}
var.map_var["one"] #retruens the value with the key "one"


