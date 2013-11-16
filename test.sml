val for_empty_string_should_add_to_zero = calculator "" =   0
val for_string_containing_one_should_add_to_one = calculator "1" =   1
val for_two_should_add_to_two = calculator "2" =   2
val for_three_should_add_to_three = calculator "3" =   3
val for_two_numbers_should_add_to_their_sum = calculator "1,2" = 3

val can_handle_new_lines = calculator "1\n,2" = 3 
val can_handle_specified_delimiter = calculator "//;\n1;2" = 3
val raise_exception_for_negatives = (calculator "-1" handle unallowed_negatives => 0) =0

val any_length_delimiter = calculator "//;;\n1;;2" = 3
val any_asdflength_delimiter = calculator "//*&\n1*&2" = 3 
