# Allergen Label

A campus bakery prints an allergen warning on everything it sells. A recipe's **ingredients** are a `List<String>` of ingredient names, such as `[list: "oats", "milk", "sugar"]`, and the bakery also records how many grams of each ingredient the recipe uses. You may assume every ingredient name is lowercase, every recipe has at least one ingredient, and no two ingredients in a recipe weigh the same.

Start your file with `import lists as L` so you can use `L.filter` and `L.length`.

Later parts should **call** the functions from earlier parts rather than repeating that logic.

## Part 1: Allergens

The bakery warns about five common allergens: `"milk"`, `"eggs"`, `"wheat"`, `"peanuts"`, and `"soy"`.

Design and implement `is-allergen`, which takes an ingredient and returns whether it is one of these allergens.

Example behavior:

- `"milk"` → `true`
- `"eggs"` → `true`
- `"wheat"` → `true`
- `"peanuts"` → `true`
- `"soy"` → `true`
- `"oats"` → `false`
- `"sugar"` → `false`

## Part 2: Allergens in a recipe

Design and implement `allergens`, which takes a list of ingredients and returns the ones that are allergens, in the same order. Use `L.filter`.

Example behavior:

- `[list: "oats", "milk", "sugar", "eggs"]` → `[list: "milk", "eggs"]`
- `[list: "oats", "salt"]` → `[list: ]`
- `[list: ]` → `[list: ]`

## Part 3: An English list

The label lists allergens the way you would in a sentence: the words are separated by commas, except that the last two are joined by `" and "` with no comma.

Design and implement `english-list`, which takes a list of words and returns them joined into one `String` this way. Use `for each`.

If the body of your loop has more than one expression, mark it the same way you mark a function: write `for each(... from ...) block:` instead of `for each(... from ...):`. The same goes for an `if` with more than one expression in a branch: write `if ... block:`.

Example behavior:

- `[list: ]` → `""`
- `[list: "milk"]` → `"milk"`
- `[list: "milk", "eggs"]` → `"milk and eggs"`
- `[list: "milk", "eggs", "soy"]` → `"milk, eggs and soy"`
- `[list: "wheat", "milk", "eggs", "soy"]` → `"wheat, milk, eggs and soy"`

## Part 4: Warning

The bakery keeps each recipe in a table with an `ingredient` column and a `grams` column:

```pyret
muffins = table: ingredient :: String, grams :: Number
  row: "wheat", 240
  row: "bananas", 300
  row: "sugar", 100
  row: "eggs", 110
  row: "milk", 60
  row: "salt", 3
end
```

Design and implement `warning`, which takes a table like this and returns a one-line `String` that starts with the heaviest ingredient and then either lists the allergens, in table order, or says there are none. Use `order-by` to find the heaviest ingredient.

Example behavior:

- the table above → `"Mostly bananas, contains wheat, eggs and milk"`
- a table with `"oats"` (120 grams), `"honey"` (40 grams), and `"raisins"` (30 grams) → `"Mostly oats, no common allergens"`

## Part 5 (if you have time)

Design and implement `label-image`, which takes a list of ingredients and returns an `Image`: a rectangle with the allergen part of the warning written on it, such as `"contains milk and eggs"` or `"no common allergens"`. The rectangle should be red when the ingredients include an allergen and green when they do not.

You can turn a String into an image with `text(string, font-size, color)`.

For this function you still need a type annotation and a docstring, but you do not need tests. Try it in the interactions window to check that it looks right.
