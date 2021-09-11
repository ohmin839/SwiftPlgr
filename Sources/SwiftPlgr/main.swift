import SwiftPlgrConv

while let line = readLine(strippingNewline: false) {
    let polytonic = toPolytonic(from: line)
    print(polytonic, terminator: "")
}
