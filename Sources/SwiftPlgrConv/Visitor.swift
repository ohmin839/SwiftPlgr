//
//  Visitor.swift
//  
//
//  Created by ohmin839 on 2021/09/11.
//

import Antlr4
import Foundation

final class Visitor: PlgrConvVisitor<String> {
    override func visitLetters(_ ctx: PlgrConvParser.LettersContext) -> String {
        guard let letters = ctx.children else {
            return ""
        }
        return letters.map {
            $0.accept(self) ?? ""
        }.reduce("") {
            $0 + $1
        }
    }
    
    override func visitLetter(_ ctx: PlgrConvParser.LetterContext) -> String {
        guard let child = ctx.children?.first else {
            return ""
        }
        return child.accept(self) ?? ""
    }
    
    override func visitAlphabet(_ ctx: PlgrConvParser.AlphabetContext) -> String {
        guard let child = ctx.children?.first else {
            return ""
        }
        return child.accept(self) ?? ""
    }
    
    override func visitSmallAlpha(_ ctx: PlgrConvParser.SmallAlphaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case  1: return "\u{1FB3}" // a|
        case  4: return "\u{1F71}" // 'a
        case  5: return "\u{1FB4}" // 'a|
        case  8: return "\u{1F70}" // `a
        case  9: return "\u{1FB2}" // `a|
        case 12: return "\u{1FB6}" // ~a
        case 13: return "\u{1FB7}" // ~a|
        case 16: return "\u{1F01}" // <a
        case 17: return "\u{1F81}" // <a|
        case 20: return "\u{1F05}" // <'a
        case 21: return "\u{1F85}" // <'a|
        case 24: return "\u{1F03}" // <`a
        case 25: return "\u{1F83}" // <`a|
        case 28: return "\u{1F07}" // <~a
        case 29: return "\u{1F87}" // <~a|
        case 32: return "\u{1F00}" // >a
        case 33: return "\u{1F80}" // >a|
        case 36: return "\u{1F04}" // >'a
        case 37: return "\u{1F84}" // >'a|
        case 40: return "\u{1F02}" // >`a
        case 41: return "\u{1F82}" // >`a|
        case 44: return "\u{1F06}" // >~a
        case 45: return "\u{1F86}" // >~a|
        default: return "\u{03B1}" // a
        }
    }
    
    override func visitSmallEpsilon(_ ctx: PlgrConvParser.SmallEpsilonContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case  4: return "\u{1F73}" // 'e
        case  8: return "\u{1F72}" // `e
        case 16: return "\u{1F11}" // <e
        case 20: return "\u{1F15}" // <'e
        case 24: return "\u{1F13}" // <`e
        case 32: return "\u{1F10}" // >e
        case 36: return "\u{1F14}" // >'e
        case 40: return "\u{1F12}" // >`e
        default: return "\u{03B5}" // e
        }
    }
    
    override func visitSmallEta(_ ctx: PlgrConvParser.SmallEtaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case  1: return "\u{1FC3}" // ^e|
        case  4: return "\u{1F75}" // '^e
        case  5: return "\u{1FC4}" // '^e|
        case  8: return "\u{1F74}" // `^e
        case  9: return "\u{1FC2}" // `^e|
        case 12: return "\u{1FC6}" // ~^e
        case 13: return "\u{1FC7}" // ~^e|
        case 16: return "\u{1F21}" // <^e
        case 17: return "\u{1F91}" // <^e|
        case 20: return "\u{1F25}" // <'^e
        case 21: return "\u{1F95}" // <'^e|
        case 24: return "\u{1F23}" // <`^e
        case 25: return "\u{1F93}" // <`^e|
        case 28: return "\u{1F27}" // <~^e
        case 29: return "\u{1F97}" // <`^e|
        case 32: return "\u{1F20}" // >^e
        case 33: return "\u{1F90}" // >^e|
        case 36: return "\u{1F24}" // >'^e
        case 37: return "\u{1F94}" // >'^e|
        case 40: return "\u{1F22}" // >`^e
        case 41: return "\u{1F92}" // >`^e|
        case 44: return "\u{1F26}" // >~^e
        case 45: return "\u{1F96}" // >~^e|
        default: return "\u{03B7}" // ^e
        }
    }
    
    override func visitSmallIota(_ ctx: PlgrConvParser.SmallIotaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case  4: return "\u{1F77}" // 'i
        case  8: return "\u{1F76}" // `i
        case 12: return "\u{1FD6}" // ~i
        case 16: return "\u{1F31}" // <i
        case 20: return "\u{1F35}" // <'i
        case 24: return "\u{1F33}" // <`i
        case 28: return "\u{1F37}" // <~i
        case 32: return "\u{1F30}" // >i
        case 36: return "\u{1F34}" // >'i
        case 40: return "\u{1F32}" // >`i
        case 44: return "\u{1F36}" // >~i
        case 64: return "\u{03CA}" // "i
        case 68: return "\u{1FD3}" // "'i
        case 72: return "\u{1FD2}" // "`i
        case 76: return "\u{1FD7}" // "~i
        default: return "\u{03B9}" // i
        }
    }
    
    override func visitSmallOmicron(_ ctx: PlgrConvParser.SmallOmicronContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case  4: return "\u{1F79}" // 'o
        case  8: return "\u{1F78}" // `o
        case 16: return "\u{1F41}" // <o
        case 20: return "\u{1F45}" // <'o
        case 24: return "\u{1F43}" // <`o
        case 32: return "\u{1F40}" // >o
        case 36: return "\u{1F44}" // >'o
        case 40: return "\u{1F42}" // >`o
        default: return "\u{03BF}" // o
        }
    }
    
    override func visitSmallUpsilon(_ ctx: PlgrConvParser.SmallUpsilonContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case  4: return "\u{1F7B}" // 'y
        case  8: return "\u{1F7A}" // `y
        case 12: return "\u{1FE6}" // ~y
        case 16: return "\u{1F51}" // <y
        case 20: return "\u{1F55}" // <'y
        case 24: return "\u{1F53}" // <`y
        case 28: return "\u{1F57}" // <~y
        case 32: return "\u{1F50}" // >y
        case 36: return "\u{1F54}" // >'y
        case 40: return "\u{1F52}" // >`y
        case 44: return "\u{1F56}" // >~y
        case 64: return "\u{03CB}" // "y
        case 68: return "\u{1FE3}" // "'y
        case 72: return "\u{1FE2}" // "`y
        case 76: return "\u{1FE7}" // "~y
        default: return "\u{03C5}" // y
        }
    }
    
    override func visitSmallOmega(_ ctx: PlgrConvParser.SmallOmegaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case  1: return "\u{1FF3}" // ^o|
        case  4: return "\u{1F7D}" // '^o
        case  5: return "\u{1FF4}" // '^o|
        case  8: return "\u{1F7C}" // `^o
        case  9: return "\u{1FF2}" // `^o|
        case 12: return "\u{1FF6}" // ~^o
        case 13: return "\u{1FF7}" // ~^o|
        case 16: return "\u{1F61}" // <^o
        case 17: return "\u{1FA1}" // <^o|
        case 20: return "\u{1F65}" // <'^o
        case 21: return "\u{1FA5}" // <'^o|
        case 24: return "\u{1F63}" // <`^o
        case 25: return "\u{1FA3}" // <`^o|
        case 28: return "\u{1F67}" // <~^o
        case 29: return "\u{1FA7}" // <`^o|
        case 32: return "\u{1F60}" // >^o
        case 33: return "\u{1FA0}" // >^o|
        case 36: return "\u{1F64}" // >'^o
        case 37: return "\u{1FA4}" // >'^o|
        case 40: return "\u{1F62}" // >`^o
        case 41: return "\u{1FA2}" // >`^o|
        case 44: return "\u{1F66}" // >~^o
        case 45: return "\u{1FA6}" // >~^o|
        default: return "\u{03C9}" // ^o
        }
    }
}
