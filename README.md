# SwiftPlgr

**SwiftPlgr** is a text processor for texts in polytonic Greek.

## Converter API
```swift
import SwiftPlgr

let polytonic = toPolytonic(from: ">'anthr^opos")
print(polytonic) // ἄνθρωπος
```

## Converter CLI
```bash
$ echo ">anthr^opos" | swiftplgr
ἄνθρωπος
```
