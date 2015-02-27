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
    
    // Otenir la question courante
    func getCurQuestion()-> String {
        return questions[curQuestion].quest
    }
    
    // Obtenir la réponse courante
    func getCurRep()->String {
        return questions[curQuestion].rep
    }
    
    // Aller à la question suivante
    func goNext(baleze:Bool)->Int {
        if curQuestion < (questions.count-1) {
            curQuestion++
        }
        return curQuestion
    }
    
    // Aller à la question précédante
    func goPrevious(baleze:Bool)->Int {
        if curQuestion > 0 {
            curQuestion--
        }
        return curQuestion
    }
    
    // Affiche-t-on la première question ?
    func first()->Bool {
        return (curQuestion == 0)
    }
    
    // Affiche-t-on la dernière question ?
    func last()->Bool {
        return (curQuestion == (questions.count-1))
    }
 
}