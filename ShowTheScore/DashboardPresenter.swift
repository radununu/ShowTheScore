//
//  DashboardPresenter.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 11/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol DashboardInput: class {
    func displayScore(_ scoreString: String, scoreRating: CGFloat)
    func display(error errorString: String)
}

protocol DashboardOutput: class {
    func loadData()
}


class DashboardPresenter {
    
    weak var inputView: DashboardInput?
    let router: DashboardRouter
    lazy var interactor: DashboardInteractor = {
        return DashboardInteractor(self)
    }()
    
    init(_ router: DashboardRouter) {
        self.router = router
        
    }
    
    func extractScoreDetails(from model: ScoreModel) -> (stringValue :String, score :CGFloat) {
        if model.minScoreValue < model.maxScoreValue {
            let normalizedScore = model.scoreValue / model.maxScoreValue
            
            return (formattedString(value: Int(model.scoreValue), maxValue: Int(model.maxScoreValue)), normalizedScore)
        } else {
            return ("", 0)
        }
    }
    
    func formattedString(value: Int, maxValue: Int) -> String {
        return "Your credit score is" + " \(value) " + "out of \(maxValue)"
    }
    
}

extension DashboardPresenter: DashboardOutput {
    func loadData() {
        interactor.fetchCreditScore(with: { [weak self] (errorString, model) in
            guard let strongSelf = self,
                let view = strongSelf.inputView else {
                    return
            }
            
            if let error = errorString {
                view.display(error: error)
            } else {
                let scoreString   = strongSelf.extractScoreDetails(from: model).stringValue
                let scoreProgress = strongSelf.extractScoreDetails(from: model).score
                
                view.displayScore(scoreString, scoreRating: scoreProgress)
            }
        })
    }
}
