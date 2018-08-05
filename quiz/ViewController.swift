//
//  ViewController.swift
//  quiz
//
//  Created by Aoyagi Naoto on 2018/08/05.
//  Copyright © 2018年 vertex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var
    
    var currentQuestionNum:Int = 0
    
    let questions:[[String:Any]] = [
    
        [
            "q":"iPhoneアプリを開発する統合環境はZcodeである。",
            "a":false
        ],
        [
            "q":"Xcode画面の右端にはユーティリティーズがある。",
            "a":true
        ],
        [
            "q":"UILabelは文字列を表示する際に利用する。",
            "a":"true"
        ]
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
    func showQuestion(){
        let question = questions[currentQuestionNum]
        
        //optional binding 型を明示する役割がある
        if let questionText = question["q"] as? String{
            questionLabel.text = questionText
        }
        
    }
    
    func checkAnswer(yourAnswer: Bool){
        let question = questions[currentQuestionNum]
        
        if let ans = question["a"] as? Bool{
            if yourAnswer == ans{
                showAlert(message: "正解です！")
                currentQuestionNum += 1
            }else{
                
                showAlert(message: "不正解です・・・")
                
            }
        }
        
        if currentQuestionNum > questions.count {
            currentQuestionNum = 0
            
        }
        
        showQuestion()
        
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: nil, message: message,preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
        
    }
    
}

