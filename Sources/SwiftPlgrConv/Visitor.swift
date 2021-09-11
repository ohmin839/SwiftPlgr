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
    
    override func visitNonFinalSigma(_ ctx: PlgrConvParser.NonFinalSigmaContext) -> String {
        return "\u{03C3}" + (ctx.alphabet()?.accept(self) ?? "")
    }
    
    override func visitLargeNasableGammaGamma(_ ctx: PlgrConvParser.LargeNasableGammaGammaContext) -> String {
        return "\u{0393}\u{0393}"
    }
    override func visitLargeNasableGammaKappa(_ ctx: PlgrConvParser.LargeNasableGammaKappaContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{0393}\u{03A7}"
        }
        return "\u{0393}\u{039A}"
    }
    override func visitLargeNasableGammaXi(_ ctx: PlgrConvParser.LargeNasableGammaXiContext) -> String {
        return "\u{0393}\u{039E}"
    }
    
    override func visitSmallNasableGammaGamma(_ ctx: PlgrConvParser.SmallNasableGammaGammaContext) -> String {
        return "\u{03B3}\u{03B3}"
    }
    override func visitSmallNasableGammaKappa(_ ctx: PlgrConvParser.SmallNasableGammaKappaContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{03B3}\u{03C7}"
        }
        return "\u{03B3}\u{03BA}"
    }
    override func visitSmallNasableGammaXi(_ ctx: PlgrConvParser.SmallNasableGammaXiContext) -> String {
        return "\u{03B3}\u{03BE}"
    }
    
    override func visitLargeAlpha(_ ctx: PlgrConvParser.LargeAlphaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score)
        {
        case  1: return "\u{1FBC}" // A|
        case  4: return "\u{1FBB}" // 'A
//      case  5: return "\u{xxxx}" // 'A|
        case  8: return "\u{1FBA}" // `A
//      case  9: return "\u{xxxx}" // `A|
//      case 12: return "\u{xxxx}" // ~A
//      case 13: return "\u{xxxx}" // ~A|
        case 16: return "\u{1F09}" // <A
        case 17: return "\u{1F89}" // <A|
        case 20: return "\u{1F0D}" // <'A
        case 21: return "\u{1F8D}" // <'A|
        case 24: return "\u{1F0B}" // <`A
        case 25: return "\u{1F8B}" // <`A|
        case 28: return "\u{1F0F}" // <~A
        case 29: return "\u{1F8F}" // <`A|
        case 32: return "\u{1F08}" // >A
        case 33: return "\u{1F88}" // >A|
        case 36: return "\u{1F0C}" // >'A
        case 37: return "\u{1F8C}" // >'A|
        case 40: return "\u{1F0A}" // >`A
        case 41: return "\u{1F8A}" // >`A|
        case 44: return "\u{1F0E}" // >~A
        case 45: return "\u{1F8E}" // >~A|
        default: return "\u{0391}" // A
        }
    }
    
    override func visitLargeEpsilon(_ ctx: PlgrConvParser.LargeEpsilonContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score) {
        case  4: return "\u{1FC9}" // 'E
        case  8: return "\u{1FC8}" // `E
        case 16: return "\u{1F19}" // <E
        case 20: return "\u{1F1D}" // <'E
        case 24: return "\u{1F1B}" // <`E
        case 32: return "\u{1F18}" // >E
        case 36: return "\u{1F1C}" // >'E
        case 40: return "\u{1F1A}" // >`E
        default: return "\u{0395}" // E
        }
    }
    
    override func visitLargeEta(_ ctx: PlgrConvParser.LargeEtaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score) {
        case  1: return "\u{1FCC}" // ^E|
        case  4: return "\u{1FCB}" // '^E
//      case  5: return "\u{xxxx}" // '^E|
        case  8: return "\u{1FCA}" // `^E
//      case  9: return "\u{xxxx}" // `^E|
//      case 12: return "\u{xxxx}" // ~^E
//      case 13: return "\u{xxxx}" // ~^E|
        case 16: return "\u{1F29}" // <^E
        case 17: return "\u{1F99}" // <^E|
        case 20: return "\u{1F2D}" // <'^E
        case 21: return "\u{1F9D}" // <'^E|
        case 24: return "\u{1F2B}" // <`^E
        case 25: return "\u{1F9B}" // <`^E|
        case 28: return "\u{1F2F}" // <~^E
        case 29: return "\u{1F9F}" // <`^E|
        case 32: return "\u{1F28}" // >^E
        case 33: return "\u{1F98}" // >^E|
        case 36: return "\u{1F2C}" // >'^E
        case 37: return "\u{1F9C}" // >'^E|
        case 40: return "\u{1F2A}" // >`^E
        case 41: return "\u{1F9A}" // >`^E|
        case 44: return "\u{1F2E}" // >~^E
        case 45: return "\u{1F9E}" // >~^E|
        default: return "\u{0397}" // ^E
        }
    }
    
    override func visitLargeIota(_ ctx: PlgrConvParser.LargeIotaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score) {
        case  4: return "\u{1FDB}" // 'I
        case  8: return "\u{1FDA}" // `I
//      case 12: return "\u{xxxx}" // ~I
        case 16: return "\u{1F39}" // <I
        case 20: return "\u{1F3D}" // <'I
        case 24: return "\u{1F3B}" // <`I
        case 28: return "\u{1F3F}" // <~I
        case 32: return "\u{1F38}" // >I
        case 36: return "\u{1F3C}" // >'I
        case 40: return "\u{1F3A}" // >`I
        case 44: return "\u{1F3E}" // >~I
        case 64: return "\u{03AA}" // "I
        default: return "\u{0399}" // I
        }
    }
    
    override func visitLargeOmicron(_ ctx: PlgrConvParser.LargeOmicronContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score) {
        case  4: return "\u{1FF9}" // 'O
        case  8: return "\u{1FF8}" // `O
        case 16: return "\u{1F49}" // <O
        case 20: return "\u{1F4D}" // <'O
        case 24: return "\u{1F4B}" // <`O
        case 32: return "\u{1F48}" // >O
        case 36: return "\u{1F4C}" // >'O
        case 40: return "\u{1F4A}" // >`O
        default: return "\u{039F}" // O
        }
    }
    
    override func visitLargeUpsilon(_ ctx: PlgrConvParser.LargeUpsilonContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score) {
        case  4: return "\u{1FEB}" // 'Y
        case  8: return "\u{1FEA}" // `Y
//      case 12: return "\u{xxxx}" // ~Y
        case 16: return "\u{1F59}" // <Y
        case 20: return "\u{1F5D}" // <'Y
        case 24: return "\u{1F5B}" // <`Y
        case 28: return "\u{1F5F}" // <~Y
        case 64: return "\u{03AB}" // "Y
        default: return "\u{03A5}" // Y
        }
    }
    
    override func visitLargeOmega(_ ctx: PlgrConvParser.LargeOmegaContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score) {
        case  1: return "\u{1FFC}" // ^O|
        case  4: return "\u{1FFB}" // '^O
//      case  5: return "\u{xxxx}" // '^O|
        case  8: return "\u{1FFA}" // `^O
//      case  9: return "\u{xxxx}" // `^O|
//      case 12: return "\u{xxxx}" // ~^O
//      case 13: return "\u{xxxx}" // ~^O|
        case 16: return "\u{1F69}" // <^O
        case 17: return "\u{1FA9}" // <^O|
        case 20: return "\u{1F6D}" // <'^O
        case 21: return "\u{1FAD}" // <'^O|
        case 24: return "\u{1F6B}" // <`^O
        case 25: return "\u{1FAB}" // <`^O|
        case 28: return "\u{1F6F}" // <~^O
        case 29: return "\u{1FAF}" // <`^O|
        case 32: return "\u{1F68}" // >^O
        case 33: return "\u{1FA8}" // >^O|
        case 36: return "\u{1F6C}" // >'^O
        case 37: return "\u{1FAC}" // >'^O|
        case 40: return "\u{1F6A}" // >`^O
        case 41: return "\u{1FAA}" // >`^O|
        case 44: return "\u{1F6E}" // >~^O
        case 45: return "\u{1FAE}" // >~^O|
        default: return "\u{03A9}" // ^O
        }
    }
    
    override func visitLargeBeta(_ ctx: PlgrConvParser.LargeBetaContext) -> String {
        return "\u{0392}"
    }
    override func visitLargeGamma(_ ctx: PlgrConvParser.LargeGammaContext) -> String {
        return "\u{0393}"
    }
    override func visitLargeDelta(_ ctx: PlgrConvParser.LargeDeltaContext) -> String {
        return "\u{0394}"
    }
    override func visitLargeZeta(_ ctx: PlgrConvParser.LargeZetaContext) -> String {
        return "\u{0396}"
    }
    override func visitLargeKappa(_ ctx: PlgrConvParser.LargeKappaContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{03A7}"
        }
        return "\u{039A}"
    }
    override func visitLargeLambda(_ ctx: PlgrConvParser.LargeLambdaContext) -> String {
        return "\u{039B}"
    }
    override func visitLargeMu(_ ctx: PlgrConvParser.LargeMuContext) -> String {
        return "\u{039C}"
    }
    override func visitLargeNu(_ ctx: PlgrConvParser.LargeNuContext) -> String {
        return "\u{039D}"
    }
    override func visitLargeXi(_ ctx: PlgrConvParser.LargeXiContext) -> String {
        return "\u{039E}"
    }
    override func visitLargePi(_ ctx: PlgrConvParser.LargePiContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{03A6}"
        } else if text.contains("s") {
            return "\u{03A8}"
        }
        return "\u{03A0}"
    }
    override func visitLargeRho(_ ctx: PlgrConvParser.LargeRhoContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch score {
        case 16: return "\u{1FEC}" // <R
        default: return "\u{03A1}" // R
        }
    }
    override func visitLargeSigma(_ ctx: PlgrConvParser.LargeSigmaContext) -> String {
        return "\u{03A3}"
    }
    override func visitLargeTau(_ ctx: PlgrConvParser.LargeTauContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{0398}"
        }
        return "\u{03A4}"
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
    
    override func visitSmallBeta(_ ctx: PlgrConvParser.SmallBetaContext) -> String {
        return "\u{03B2}"
    }
    override func visitSmallGamma(_ ctx: PlgrConvParser.SmallGammaContext) -> String {
        return "\u{03B3}"
    }
    override func visitSmallDelta(_ ctx: PlgrConvParser.SmallDeltaContext) -> String {
        return "\u{03B4}"
    }
    override func visitSmallZeta(_ ctx: PlgrConvParser.SmallZetaContext) -> String {
        return "\u{03B6}"
    }
    override func visitSmallKappa(_ ctx: PlgrConvParser.SmallKappaContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{03C7}"
        }
        return "\u{03BA}"
    }
    override func visitSmallLambda(_ ctx: PlgrConvParser.SmallLambdaContext) -> String {
        return "\u{03BB}"
    }
    override func visitSmallMu(_ ctx: PlgrConvParser.SmallMuContext) -> String {
        return "\u{03BC}"
    }
    override func visitSmallNu(_ ctx: PlgrConvParser.SmallNuContext) -> String {
        return "\u{03BD}"
    }
    override func visitSmallXi(_ ctx: PlgrConvParser.SmallXiContext) -> String {
        return "\u{03BE}"
    }
    override func visitSmallPi(_ ctx: PlgrConvParser.SmallPiContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{03C6}"
        } else if text.contains("s") {
            return "\u{03C8}"
        }
        return "\u{03C0}"
    }
    override func visitSmallRho(_ ctx: PlgrConvParser.SmallRhoContext) -> String {
        let text = ctx.getText()
        let score = calculateScore(of: text)
        switch(score) {
        case 16: return "\u{1FE5}" // <r
        case 32: return "\u{1FE4}" // >r
        default: return "\u{03C1}" // r
        }
    }
    override func visitSmallSigma(_ ctx: PlgrConvParser.SmallSigmaContext) -> String {
        let text = ctx.getText()
        if text == "c" {
            return "\u{03C3}"
        }
        return "\u{03C2}"
    }
    override func visitSmallTau(_ ctx: PlgrConvParser.SmallTauContext) -> String {
        let text = ctx.getText()
        if text.contains("h") {
            return "\u{03B8}"
        }
        return "\u{03C4}"
    }
    
    override func visitComma(_ ctx: PlgrConvParser.CommaContext) -> String {
        return ","
    }
    override func visitSemicoron(_ ctx: PlgrConvParser.SemicoronContext) -> String {
        return "\u{0387}"
    }
    override func visitPeriod(_ ctx: PlgrConvParser.PeriodContext) -> String {
        return "."
    }
    override func visitQuestion(_ ctx: PlgrConvParser.QuestionContext) -> String {
        return "\u{037E}"
    }
    override func visitApostroph(_ ctx: PlgrConvParser.ApostrophContext) -> String {
        return "'"
    }
    override func visitLguillemet(_ ctx: PlgrConvParser.LguillemetContext) -> String {
        return "\u{00AB}"
    }
    override func visitRguillemet(_ ctx: PlgrConvParser.RguillemetContext) -> String {
        return "\u{00BB}"
    }
    override func visitEmdash(_ ctx: PlgrConvParser.EmdashContext) -> String {
        return "\u{2014}"
    }
    
    override func visitSpace(_ ctx: PlgrConvParser.SpaceContext) -> String {
        return ctx.getText()
    }
    override func visitNewline(_ ctx: PlgrConvParser.NewlineContext) -> String {
        return ctx.getText()
    }
    
    override func visitAnychar(_ ctx: PlgrConvParser.AnycharContext) -> String {
        return ctx.getText()
    }
}
