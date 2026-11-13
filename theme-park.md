# Theme Park

A theme park's map is a tree of walkways. Each walkway takes some minutes to walk, and then splits into a left way and a right way, each leading to a ride or to another walkway. A ride has a line of **parties** waiting, first party first, and lets a certain number of people on per minute.

The wait for a ride is the number of people in its line divided by its `per-minute`. For example, the 15 people waiting for the Comet Coaster, at 5 per minute, mean a wait of 3 minutes.

Copy these definitions and examples into your file:

```pyret
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
```

`funland` looks like this:

```
walk 2 minutes
├── Comet Coaster: 5 people per minute, 15 waiting
└── walk 4 minutes
    ├── Carousel: 2 people per minute, 2 waiting
    └── Log Flume: 2 people per minute, 10 waiting
```

Start each function from the template for its data, as in class. Later parts should **call** the functions from earlier parts rather than repeating that logic.

## Part 1: People in line

Design and implement `people-waiting`, which takes a line and returns how many people are in it.

Example behavior:

- `no-one` → `0`
- `carousel-line` → `2`
- `coaster-line` → `15`

## Part 2: Everyone waiting

Design and implement `total-waiting`, which takes a park and returns how many people are waiting in all of its lines.

Example behavior:

- `ride("Carousel", 2, no-one)` → `0`
- `ride("Log Flume", 2, flume-line)` → `10`
- `funland` → `27`

## Part 3: Soonest ride

Design and implement `soonest-ride`, which takes a park and returns the fewest minutes, walking and waiting, until you're on a ride. You can find the smaller of two numbers with `num-min`.

Example behavior:

- `ride("Carousel", 2, carousel-line)` → `1`
- `ride("Comet Coaster", 5, coaster-line)` → `3`
- `walkway(4, ride("Carousel", 2, carousel-line), ride("Log Flume", 2, flume-line))` → `5`
- `funland` → `5`

## Part 4: Rides within reach

Design and implement `rides-within`, which takes a park and a number of minutes, and returns a list of the names of the rides you could be on within that many minutes, walking and waiting, left ones first. Walking a walkway uses up some of your minutes. You can join two lists with `+`, as in `[list: 1] + [list: 2, 3]`.

Example behavior:

- `ride("Carousel", 2, carousel-line)`, `1` → `[list: "Carousel"]`
- `funland`, `1` → `[list: ]`
- `funland`, `5` → `[list: "Comet Coaster"]`
- `funland`, `7` → `[list: "Comet Coaster", "Carousel"]`
- `funland`, `20` → `[list: "Comet Coaster", "Carousel", "Log Flume"]`

## Part 5 (if you have time)

Design and implement `join-line`, which takes a park, the name of a ride, and the size of a party, and returns the park with a new party of that size at the end of that ride's line.

Example behavior:

- `ride("Carousel", 2, carousel-line)`, `"Carousel"`, `3` → `ride("Carousel", 2, party(2, party(3, no-one)))`
- `ride("Carousel", 2, carousel-line)`, `"Log Flume"`, `3` → `ride("Carousel", 2, carousel-line)`
- `funland`, `"Log Flume"`, `4` → a park with `31` people waiting in all
