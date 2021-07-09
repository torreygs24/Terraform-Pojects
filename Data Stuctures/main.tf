#there are three primitive types in Terraform: string, number, boolean
variable "my_bool" {
  type    = bool
  default = true
} # In the above example, you can sub the type for any listed type.
# Primitive types have a singe value.

# Collection and Structural types have multiple values.
# Collection types: List, SET, MAP.
# Structural Types: Object and Tuple
# These types are LIST,SET, MAP.
# LIST -List of values in sequence starting at position 0.
# MAP - Collection of values identified by unique key of type string.
# SET - Collection of unique values with no identifiers or ordering.

variable "my_list" {
  type = list(string) # A list of strings
}

variable "my_map" {
  type = map(number)
  default = {
    "statement"  = "Lupe Fiasco is the GOAT"
    "statement1" = "No, JayZ is the GOAT"
    "Statement3" = [2, 1, 2]
  } # A map with number values
}
#["a", 2, false] # Not valid list

# Map Examples
# A map with two keys and list values
#"one" = [3,1,4]
#"two" = ["pi", "is", "good"]



