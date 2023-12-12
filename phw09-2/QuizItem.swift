//
//  QuizRecord.swift
//  phw09-2
//
//  Created by jasonhung on 2023/12/11.
//

import Foundation

// 定義一個 struct 來表示測驗記錄
struct QuizRecord {
    var question: String    // 題目
    var options: [QuizOption]   // 可選擇的答案選項，使用陣列來存儲多個選擇
    var correctAnswers: [String] // 一個或多個正確的答案
    var userAnswers: [String] = []  // 使用者選擇的項目

    // 你可以添加其他需要的屬性，例如時間戳記等

    // 計算使用者獲得的分數
    func calculateScore() -> Int {
        var totalScore = 0
        for selectedOption in userAnswers {
            if let option = options.first(where: { $0.text == selectedOption }) {
                totalScore += option.score
            }
        }
        return totalScore
    }

    // 一個簡單的方法來檢查答案是否正確
    func isAnswerCorrect() -> Bool {
        let correctSet = Set(correctAnswers)
        let userSet = Set(userAnswers)
        return correctSet == userSet
    }

    // 設定使用者選擇的答案
    mutating func setUserAnswers(_ selectedOptions: [String]) {
        userAnswers = selectedOptions
    }
}


