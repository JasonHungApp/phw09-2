//
//  ViewController.swift
//  phw09-2
//
//  Created by jasonhung on 2023/12/11.
//

import UIKit


class questionViewController: UIViewController {

    @IBOutlet weak var questNumber: UILabel!
    
    @IBOutlet weak var questionView: UIView!
    
    @IBOutlet weak var questLabel: UILabel!
    
    @IBOutlet weak var answerView1: UIView!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerLabel1: UILabel!
    
    @IBOutlet weak var answerView2: UIView!
    @IBOutlet weak var answerLabel2: UILabel!
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerView3: UIView!
    @IBOutlet weak var answerLabel3: UILabel!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    var quizItems:[QuizItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //testCreateQuizItemsTuple()
        //testCreateQuizItemsStruct()
        
        // 使用 Struct 來表示問題和選項的資料結構

        // 創建 QuizItem 陣列
        quizItems = createQuizItems(questions: initQuiz())
        
        questLabel.text = quizItems[0].question
        

        for (index, option) in quizItems[0].options.enumerated() {
            let answerLabel = view.viewWithTag(index + 1) as? UILabel // 假設你的 answerLabel 分別是 viewWithTag(1), viewWithTag(2), viewWithTag(3)
            
            if let answerLabel = answerLabel {
                answerLabel.text = option.text
            }
        }
        
        
        
        // 使用者選擇答案
        quizItems[0].setUserAnswers(["公帑"])
        //generatedQuizItems[1].setUserAnswers(["岌岌可危", "急急可危"])
        quizItems[1].setUserAnswers(["岌岌可危"])
        quizItems[2].setUserAnswers(["磋商"])
        
        
        
        
        
        // 使用生成的 quizItems
        for quiz in quizItems {
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
    
    
    
    func test(){
        // 在適當的地方，例如測驗完成的時候
        var quizItems: [QuizItem] = []
        
        let question1 = "Q1. 下列字詞何者正確？"
        let options1 = [
            QuizOption(text: "公帑", score: 10),
            QuizOption(text: "公孥", score: 5),
            QuizOption(text: "公砮", score: 3),
        ]
        let correctAnswers1 = ["公帑"]
        let isScoredQuestion1 = true

        let quiz1 = QuizItem(question: question1, options: options1, correctAnswers: correctAnswers1, isScoredQuestion: isScoredQuestion1)
        quizItems.append(quiz1)

        
        let question2 = "Q2. 下列字詞何者正確？"
        let options2 = [
            QuizOption(text: "岌岌可危", score: 8),
            QuizOption(text: "急急可危", score: 6),
            QuizOption(text: "汲汲可危", score: 4),
        ]
        let correctAnswers2 = ["岌岌可危", "急急可危"]
        let isScoredQuestion2 = true

        let quiz2 = QuizItem(question: question2, options: options2, correctAnswers: correctAnswers2, isScoredQuestion: isScoredQuestion2)

        quizItems.append(quiz2)
        
        let options3 = [
            QuizOption(text: "適應能力", score: 5),
            QuizOption(text: "情商", score: 8),
            QuizOption(text: "人際關係", score: 6),
        ]
        let quiz3 = QuizItem(question: "Q3. 以下哪個詞最能描述你的優勢？", options: options3, correctAnswers: [], isScoredQuestion: false)
        quizItems.append(quiz3)
        
        // 使用者選擇答案
        quizItems[0].setUserAnswers(["公帑"])
        quizItems[1].setUserAnswers(["岌岌可危", "急急可危"])
        quizItems[2].setUserAnswers(["情商"])

        // 顯示所有記錄
        for item in quizItems {
            print("Question: \(item.question)")
            print("Options:")
            for option in item.options {
                print("- \(option.text) (\(option.score) points)")
            }
            print("Correct Answers: \(item.correctAnswers)")
            print("User Answers: \(item.userAnswers)")
            print("Is Correct: \(item.isAnswerCorrect())")
            print("Score: \(item.calculateScore())")
            print("-----------")
        }
    }
}

