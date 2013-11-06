exception unallowed_negatives
fun calculator s = 
    List.foldl (fn (x,y) => y + (if x >= 0 then x else raise unallowed_negatives)) 
       0 
       (List.map (fn x => case Int.fromString x of SOME Y => Y | _ => 0) 
         (String.fields (fn x => x = 
           (if String.size s > 2 andalso String.substring (s,0,2) = "//" 
             then 
                  ( hd (String.explode (String.substring (s,2,1)))) 
             else 
                #",")
             ) 
         s) 
       )
