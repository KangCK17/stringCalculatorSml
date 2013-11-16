exception unallowed_negatives
fun calculator s = 
let
fun int_from_string x =
  case Int.fromString(x) of
       SOME Y => Y
     |_ => 0
  val separator = if (String.size s) > 2  andalso String.substring(s,0,2) = "//" 
                  then 
                      hd (String.explode (String.substring (s,2,1))) 
                  else #","
  val list_separated = String.fields(fn x => x = separator) s
  val intlist = List.map (int_from_string) list_separated
  val sum = List.foldl (fn (x,y) => y+x) 0 (List.map (int_from_string) list_separated)
  val negatives = List.filter(fn x => x < 0) intlist
in
  if List.length negatives > 0 then raise unallowed_negatives else sum
end
 
