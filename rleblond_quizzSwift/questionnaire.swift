//
//  questionnaire.swift
//  rleblond_quizzSwift
//
//  Created by Rémi LEBLOND on 27/02/2015.
//  Copyright (c) 2015 Rémi LEBLOND. All rights reserved.
//

import Foundation

class questionnaire {
    var curQuestion: Int = 0
    
    let questions = [
        (quest:"Pourquoi ?", rep:"Parceque", baleze:false),
        (quest:"Comment ?", rep:"Comme ça", baleze:false),
        (quest:"Où ?", rep:"Là bas", baleze:false),
        (quest:"A quoi bon ?", rep:"C'est pour le travail", baleze:true),
        (quest:"La grande question sur la vie, l'univers et le reste", rep:"42", baleze:true),
        (quest:"Quelle est la couleur du cheval blanc d'Henry 4 ?", rep:"Blanc", baleze:false)
    ]
    
    func getCurQuestion()-> String {
        return questions[curQuestion].quest
    }
    
    func getCurRep()->String {
        return questions[curQuestion].rep
    }
    
    func goNext()->Int {
        if curQuestion < (questions.count-1) {
            curQuestion++
        }
        return curQuestion
    }
    
    func goPrevious()->Int {
        if curQuestion > 0 {
            curQuestion--
        }
        return curQuestion
    }
    
    func first()->Bool {
        return (curQuestion == 0)
    }
    
    func last()->Bool {
        return (curQuestion == (questions.count-1))
    }
 
}