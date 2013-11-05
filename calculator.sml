exception unallowed_negatives
fun calculator s = 
let
  fun containsnegatives l = List.length (List.filter (fn x => x<0) l) > 0
  fun separator s = if String.size s > 2 andalso String.substring (s,0,2) = "//" then #";" else #","
  fun stringtolist s = (String.fields (fn x => x = separator s) s)
  fun maptoint sList = List.map (fn x => case Int.fromString x of SOME Y => Y | _ => 0) sList
  fun listCalculator l =
    case l of
       H::T => H + listCalculator T
     | _ => 0
  val numbersList = maptoint (stringtolist s)
in
  if containsnegatives numbersList
  then 
     raise unallowed_negatives
  else
    listCalculator numbersList
end

