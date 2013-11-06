exception unallowed_negatives
fun calculator s = 
let
  fun custom_delimiter s = hd (String.explode (String.substring (s,2,1)))
  fun extract_delimiter s = if String.size s > 2 andalso String.substring (s,0,2) = "//" then custom_delimiter s else #","
  fun stringtolist s = (String.fields (fn x => x = extract_delimiter s) s)
  fun maptoint sList = List.map (fn x => case Int.fromString x of SOME Y => Y | _ => 0) sList
in
    List.foldl (fn (x,y) => y + (if x >= 0 then x else raise unallowed_negatives)) 0 (maptoint (stringtolist s))
end

