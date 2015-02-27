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
    
    enum niveau {case facile, moyen, baleze}
    
    var questions = [
        (quest:"Pourquoi ?", rep:"Parceque", niv:niveau.baleze, vue:false),
        (quest:"Comment ?", rep:"Comme ça", niv:niveau.facile, vue:false),
        (quest:"Où ?", rep:"Là bas", niv:niveau.moyen, vue:false),
        (quest:"A quoi bon ?", rep:"C'est pour le travail", niv:niveau.moyen, vue:false),
        (quest:"La grande question sur la vie, l'univers et le reste", rep:"42", niv:niveau.baleze, vue:false),
        (quest:"Quelle est la couleur du cheval blanc d'Henry 4 ?", rep:"Blanc", niv:niveau.facile, vue:false)
    ]
    
    func findNext(baleze: Bool) {
        if (!baleze && questions[curQuestion].niv == niveau.baleze) {
            goNext(baleze)
        }
    }
    
    func findPrev(baleze: Bool) {
        if (!baleze && questions[curQuestion].niv == niveau.baleze) {
            goPrevious(baleze)
        }
    }

    
    func getNiveau()->String {
        switch questions[curQuestion].niv {
        case niveau.facile:
            return "Question facile"
        case niveau.moyen:
            return "Question moyenne"
        case niveau.baleze:
            return "Question balèze qui déchire sa race"
        }
    }
    
    // Otenir la question courante
    func getCurQuestion()-> String {
        return questions[curQuestion].quest
    }
    
    // Obtenir la réponse courante
    func getCurRep()->String? {
        if questions[curQuestion].vue {
            return questions[curQuestion].rep
        } else {
            return nil
        }
    }
    
    func getVue()->Bool {
        return questions[curQuestion].vue
    }
    
    func setVue() {
        questions[curQuestion].vue = true
    }
    
    // Aller à la question suivante
    func goNext(baleze: Bool) {
        if curQuestion < (questions.count-1) {
            curQuestion++
            if last() {
                findPrev(baleze)
            } else {
                findNext(baleze)
            }
        }
    }
    
    // Aller à la question précédante
    func goPrevious(baleze: Bool) {
        if curQuestion > 0 {
            curQuestion--
            if first() {
                findNext(baleze)
            } else {
                findPrev(baleze)
            }
        }
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