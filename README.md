# grnsh
api for grnsh android app for cocktail recipes
# Example
```nim
import asyncdispatch, grnsh, json, strutils

let data = waitFor get_ingredients()
let ingredients = data["payload"]
for ingredient in ingredients:
  echo ingredient["name"].getStr()
  echo ingredient["imageUrl"].getStr()
  echo "." .repeat(40)
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
