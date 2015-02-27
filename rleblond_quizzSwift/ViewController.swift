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
    
    var curQuestion: Int = 0
    let questions = [
        (quest:"Pourquoi ?", rep:"Parceque", baleze:false),
        (quest:"Comment ?", rep:"Comme ça", baleze:false),
        (quest:"Où ?", rep:"Là bas", baleze:false),
        (quest:"A quoi bon ?", rep:"C'est pour le travail", baleze:true),
        (quest:"La grande question sur la vie, l'univers et le reste", rep:"42", baleze:true),
        (quest:"Quelle est la couleur du cheval blanc d'Henry 4 ?", rep:"Blanc", baleze:false)
    ]
    
    var affiché = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        afficheQuestion(curQuestion)
    }
    
    func afficheQuestion (numQuestion: Int) {
        println("Affichage de la question \(curQuestion)")
        println(questions[curQuestion].quest)
        txtQuestion.text = questions[curQuestion].quest
        txtReponse.text = questions[curQuestion].rep
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actNav(sender: AnyObject) {
        
        if sender === btnNext {
            println("Next")
            if curQuestion < (questions.count-1) {
                curQuestion++
            }
            
        } else if sender === btnPrev {
            println("Previous")
            if curQuestion > 0 {
                curQuestion--
            }
        }
        
        btnPrev.hidden = (curQuestion == 0)
        btnNext.hidden = (curQuestion == (questions.count-1))
        
        afficheQuestion(curQuestion)
    }

    @IBAction func actAfficheRéponse(sender: AnyObject) {
        println("Affichage de la réponse \(curQuestion)")
        lblReponse.hidden = false
        txtReponse.hidden = false
    }

}

