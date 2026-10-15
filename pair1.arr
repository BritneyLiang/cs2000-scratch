use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun last-four(s :: String) -> String:
  doc:"returns last four digits of a NUID"
  string-substring(s, 5, 9)
where:
  last-four("001234567") is "4567"
  last-four("987654321") is "4321"
  last-four("000000001") is "0001"
end

fun is-valid-box(n :: Number) -> Boolean:
  doc:"returns the number if its bewteen 1 to 400"
  if (n >= 1) and (n <= 400):
    true
  else:
    false
  end
where:
    is-valid-box(1) is true
    is-valid-box(400) is true   
    is-valid-box(0) is false
end

fun mail-code(n :: String, x :: Number) -> String:
  doc:"returns last four digits plus box number, or no box"
  if is-valid-box(x):
    last-four(n) + "-" + num-to-string(x)
  else:
    "no box"
  end
where:
  mail-code("001234567", 112) is "4567-112"
  mail-code("987654321", 1) is "4321-1"
  mail-code("001234567", 0) is "no box"
end

fun slip(name :: String, NUID :: String, n :: Number) -> String:
  doc:"returns slip that includes box number and name"
where:
  