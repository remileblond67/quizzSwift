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
        afficheQuestion(myQuizz.curQuestion)
    }
    
    func afficheQuestion (numQuestion: Int) {
        txtQuestion.text = myQuizz.getCurQuestion()
        txtReponse.text = myQuizz.getCurRep()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func actNav(sender: AnyObject) {
        
        if sender === btnNext {
            println("Next")
            myQuizz.goNext()
            
        } else if sender === btnPrev {
            println("Previous")
            myQuizz.goPrevious()
        }
        
        btnPrev.hidden = myQuizz.first()
        btnNext.hidden = myQuizz.last()
        
        afficheQuestion(myQuizz.curQuestion)
    }

    @IBAction func actAfficheRéponse(sender: AnyObject) {
        println("Affichage de la réponse \(myQuizz.curQuestion)")
        lblReponse.hidden = false
        txtReponse.hidden = false
    }

}

