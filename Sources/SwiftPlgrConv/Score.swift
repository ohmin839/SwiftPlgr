//
//  Score.swift
//  
//
//  Created by ohmin839 on 2021/09/11.
//

import Foundation

func calculateScore(of text: String) -> Int {
    return addScoreIfDialesis(text,
            addScoreIfBreath(text,
            addScoreIfAccent(text,
            addScoreIfIotaSubscriptum(text))))
}

private func addScoreIfDialesis(_ text: String, _ score: Int = 0) -> Int {
    if text.contains("\"") {
        return 64 + score
    }
    return score
}

func addScoreIfBreath(_ text: String, _ score: Int = 0) -> Int {
    if text.contains("<") {
        return 16 + score
    }
    if text.contains(">") {
        return 32 + score
    }
    return score
}

func addScoreIfAccent(_ text: String, _ score: Int = 0) -> Int {
    if text.contains("'") {
        return  4 + score
    }
    if text.contains("`") {
        return  8 + score
    }
    if text.contains("~") {
        return 12 + score
    }
    return score
}

func addScoreIfIotaSubscriptum(_ text: String, _ score: Int = 0) -> Int {
    if text.contains("|") {
        return  1 + score
    }
    return score
}
