use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L
#problem 1:
fun is-allergen(n :: String) -> Boolean:
  doc:"takes an ingredient and returns whether it is one of these allergens."
  if (n == "milk") or (n == "eggs") or (n == "wheat") or (n == "peanuts") or (n == "soy"):
    true
  else:
    false
  end
where:
  is-allergen("soy") is true
  is-allergen("milk") is true
  is-allergen("sugar") is false
end

#problem 2:
fun allergens(i :: List<String>) -> List<String>:
  doc:"takes a list of ingredients and returns the ones that are allergens."
  L.filter(is-allergen, i)
where:
  allergens([list: "oats", "milk", "sugar", "eggs"]) is [list: "milk", "eggs"]
  allergens([list: "wheat", "sugar", "eggs"]) is [list: "wheat", "eggs"]
  allergens([list: "oats", "sugar", "eggs"]) is [list: "eggs"]
end

#problem3:
fun english-list(lst :: List<String>) -> String block:
  doc:"takes a list of words and returns them joined into one String this way."
  var result = ""
  var count1 = 0
  if L.length(lst) == 1:
    result := lst.get(0)
  else:
  for each(n from lst) block:
    if count1 == (L.length(lst) - 1):
      result := result + " and " + n
      else if count1 == 0:
        result := n
    else: 
      block:
      result := result + ", " + n
          count1 := count1 + 1
      end
    end
  end
  end
  result
where:
  english-list([list: ]) is ""
  english-list([list: "milk"]) is "milk"
  english-list([list: "milk", "eggs"]) is "milk and eggs"
  english-list([list: "milk", "eggs", "soy"]) is "milk, eggs and soy"
  english-list([list: "wheat", "milk", "eggs", "soy"]) is "wheat, milk, eggs and soy"
end