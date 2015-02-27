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
    @IBOutlet weak var swtBaleze: UISwitch!
    @IBOutlet weak var txtNiveau: UILabel!
    
    let myQuizz = questionnaire()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myQuizz.findNext(swtBaleze.on)
        
        afficheQuestion()
    }
    
    func afficheQuestion() {
        txtQuestion.text = myQuizz.getCurQuestion()
        
        if myQuizz.getVue() {
            txtReponse.text = myQuizz.getCurRep()
            
            lblReponse.hidden = false
            txtReponse.hidden = false
            btnRéponse.hidden = true
        } else {
            lblReponse.hidden = true
            txtReponse.hidden = true
            btnRéponse.hidden = false
        }
        
        txtNiveau.text = myQuizz.getNiveau()
        btnPrev.hidden = myQuizz.first()
        btnNext.hidden = myQuizz.last()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func actNav(sender: AnyObject) {
        
        if sender === btnNext {
            myQuizz.goNext(swtBaleze.on)
            
        } else if sender === btnPrev {
            myQuizz.goPrevious(swtBaleze.on)
        }
        
        afficheQuestion()
    }

    @IBAction func actAfficheRéponse(sender: AnyObject) {
        myQuizz.setVue()
        afficheQuestion()
    }

}

