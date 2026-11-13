use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data Queue:
  | no-one
  | party(size :: Number, rest :: Queue)
end

data Park:
  | ride(name :: String, per-minute :: Number, waiting :: Queue)
  | walkway(minutes :: Number, left :: Park, right :: Park)
end

coaster-line = party(4, party(2, party(6, party(3, no-one))))
carousel-line = party(2, no-one)
flume-line = party(5, party(5, no-one))

funland =
  walkway(2,
    ride("Comet Coaster", 5, coaster-line),
    walkway(4,
      ride("Carousel", 2, carousel-line),
      ride("Log Flume", 2, flume-line)))


#problem 1:
fun people-waiting(l :: Queue) -> Number:
  doc:"design people-waiting, which takes a line and returns how many people are in it."
  cases (Queue) l:
    | no-one => 0
    | party(size, rest) => size + people-waiting(rest)
  end
where:
  people-waiting(no-one) is 0
  people-waiting(carousel-line) is 2
  people-waiting(coaster-line) is 15
end


#Problem 2:
fun total-waiting(n :: Park) -> Number:
  doc:"Design total-waiting, which takes a park and returns how many people are waiting in all of its lines."
  cases (Park) n:
    | ride(name, per-minute, waiting) => people-waiting(waiting)
    | walkway(minutes, left, right) => total-waiting(left) + total-waiting(right)
  end
where:
  total-waiting(ride("Carousel", 2, no-one)) is 0
  total-waiting(ride("Log Flume", 2, flume-line)) is 10
  total-waiting(funland) is 27
end


#Problem 3:
fun soonest-ride(s :: Park) -> Number:
  doc:"Design soonest-ride, which takes a park and returns the fewest minutes, walking and waiting, until you're on a ride."
  cases (Park) s:
    | ride(name, per-minute, waiting) => people-waiting(waiting) / per-minute
    | walkway(minutes, left, right) => minutes + num-min(soonest-ride(left), soonest-ride(right))
  end
where:
  soonest-ride(ride("Carousel", 2, carousel-line)) is 1
  soonest-ride(ride("Comet Coaster", 5, coaster-line)) is 3
  soonest-ride(walkway(4, ride("Carousel", 2, carousel-line), ride("Log Flume", 2, flume-line))) is 5
  soonest-ride(funland) is 5
end


#problem 4:
fun rides-within(n :: Park, m :: Number) -> List<String>:
  doc:"takes a park and a number of minutes, and returns a list of the names of the rides you could be on within that many minutes, walking and waiting, left ones first."
  cases (Park) n:
    | ride(name, per-minute, waiting) => 
      if (people-waiting(waiting) / per-minute) <= m:
        [list: name]
      else:
        empty
      end
    | walkway(minutes, left, right) => rides-within(left, m - minutes) + rides-within(right, m - minutes)
  end
where:
  rides-within(ride("Carousel", 2, carousel-line), 1) is [list: "Carousel"]
  rides-within(funland, 1) is [list: ]
  rides-within(funland, 5) is [list: "Comet Coaster"]
end