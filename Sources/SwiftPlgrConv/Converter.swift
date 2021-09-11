//
//  Converter.swift
//  
//
//  Created by ohmin839 on 2021/09/11.
//

import Antlr4
import Foundation

public func toPolytonic(from text: String) -> String {
    let inputStream = ANTLRInputStream(text)
    let lexer = PlgrConvLexer(inputStream)
    let tokenStream = CommonTokenStream(lexer)
    guard let parser = try? PlgrConvParser(tokenStream) else {
        return ""
    }
    guard let parseTree = try? parser.letters() else {
        return ""
    }
    let visitor = Visitor()
    return visitor.visitLetters(parseTree)
}
