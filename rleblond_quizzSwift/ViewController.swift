//
//  ViewController.swift
//  rleblond_quizzSwift
//
//  Created by Rémi LEBLOND on 26/02/2015.
//  Copyright (c) 2015 Rémi LEBLOND. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnRéponse: UIButton!
    @IBOutlet weak var lblReponse: UILabel!
    @IBOutlet weak var txtReponse: UITextField!
    @IBOutlet weak var txtQuestion: UITextField!
    
    let myQuizz = questionnaire()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        afficheQuestion(myQuizz.curQuestion)
    }
    
    func afficheQuestion (numQuestion: Int) {
        println("Affichage de la question \(myQuizz.curQuestion)")
        txtQuestion.text = myQuizz.questions[myQuizz.curQuestion].quest
        txtReponse.text = myQuizz.questions[myQuizz.curQuestion].rep
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actNav(sender: AnyObject) {
        
        if sender === btnNext {
            println("Next")
            if myQuizz.curQuestion < (myQuizz.questions.count-1) {
                myQuizz.curQuestion++
            }
            
        } else if sender === btnPrev {
            println("Previous")
            if myQuizz.curQuestion > 0 {
                myQuizz.curQuestion--
            }
        }
        
        btnPrev.hidden = (myQuizz.curQuestion == 0)
        btnNext.hidden = (myQuizz.curQuestion == (myQuizz.questions.count-1))
        
        afficheQuestion(myQuizz.curQuestion)
    }

    @IBAction func actAfficheRéponse(sender: AnyObject) {
        println("Affichage de la réponse \(myQuizz.curQuestion)")
        lblReponse.hidden = false
        txtReponse.hidden = false
    }

}

