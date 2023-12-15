//
//  createQuizItems.swift
//  phw09-2
//
//  Created by jasonhung on 2023/12/12.
//

import Foundation

func createQuizItemsTurple(questions: [(String, [String], [Int], Bool, [String])]) -> [QuizItem] {
    var quizItems: [QuizItem] = []
    
    for (index, questionData) in questions.enumerated() {
        let (questionText, optionsText, scores, isScoredQuestion, correctAnswers) = questionData
        
        let question = "Q\(index + 1). \(questionText)"
        
        // 生成選項
        let options = zip(optionsText, scores).map { (optionText, score) in
            return QuizOption(text: optionText, score: score)
        }
        //此修正版本使用了 zip 函式，它允許您將 optionsText 和 scores 這兩個陣列合併，然後使用 map 函式創建 QuizOption。這樣就確保了每個選項都有對應的分數。
        
        // 生成正確答案
       // let correctAnswersSet = Set(correctAnswers)
        let correctAnswersSet = correctAnswers

        // 創建 QuizItem 並添加到陣列中
        let quiz = QuizItem(question: question, options: options, correctAnswers: correctAnswersSet, isScoredQuestion: isScoredQuestion)
        quizItems.append(quiz)
    }

    return quizItems
}


func testQuizItems2(){
    
    /*
    let questionsData: [(String, [String], [Int], Bool, [String])] 定義的是一個陣列，每個元素都是一組 tuple。這個 tuple 包含五個元素，分別是：
    
    字串 (String)：代表問題的文字內容。
    字串陣列 ([String])：代表選項的文字內容。
    整數陣列 ([Int])：代表每個選項對應的分數。
    布林值 (Bool)：代表是否是需要計分的問題。
    字串陣列 ([String])：代表正確答案。
    這樣的資料型態允許您存儲多個問題，每個問題都有不同的特性和結構。請記住，每個元素的順序要與 tuple 內的型態一致。

    如果您有特定的問題或需要進一步的解釋，請告訴我！
    */
    
    // 使用 createQuizItems function
    let questionsData: [(Question:String, Options:[String], Scores:[Int], isScoredQuestion:Bool, correctAnswers:[String])] = [
        (
            Question:"下列字詞何者正確？",
            Options:["公帑", "公孥", "公砮"],
            Scores:[10, 5, 3],
            isScoredQuestion:true,
            correctAnswers:["公帑"]
        ),
        (
            "下列字詞何者正確？",
            ["岌岌可危", "急急可危", "汲汲可危"],
            [8, 6, 4],
            true,
            ["岌岌可危"]
        ),
        (
            "以下哪個詞最能描述你的優勢？",
            ["適應能力", "情商", "人際關係"],
            [9, 8, 7],
            false,
            []  // 心理測驗題目，沒有正確答案
        )
    ]

    var generatedQuizItems = createQuizItems(questions: questionsData)
    
    
    // 使用者選擇答案
    generatedQuizItems[0].setUserAnswers(["公帑"])
    //generatedQuizItems[1].setUserAnswers(["岌岌可危", "急急可危"])
    generatedQuizItems[1].setUserAnswers(["岌岌可危"])
    generatedQuizItems[2].setUserAnswers(["情商", "人際關係"])
    
    // 使用生成的 quizItems
    for quiz in generatedQuizItems {
        print("Question: \(quiz.question)")
        //print("Options: \(quiz.options)")
        print("Options:")
        for option in quiz.options {
            print("- \(option.text) (\(option.score) points)")
        }
        print("Correct Answers: \(quiz.correctAnswers)")
        print("User Answers: \(quiz.userAnswers)")
        print("Is Scored Question: \(quiz.isScoredQuestion)")
        print("Score: \(quiz.calculateScore())")
        print("---------------")
    }
    
}
