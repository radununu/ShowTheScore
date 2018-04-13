//
//  DashboardInteractor.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 11/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

class DashboardInteractor {
    private weak var presenter: DashboardPresenter?
    private let networkLayer = NetworkLayer()
    
    init(_ presenter: DashboardPresenter) {
        self.presenter = presenter
    }
    
    
    func fetchCreditScore(with completionHandler: @escaping (String?, ScoreModel) -> ()) {
        networkLayer.requestScoreData { (error, jsonObject) in
            guard let json = jsonObject else {
                completionHandler("Could not get your score this time.", ScoreModel(with: [:]))
                return
            }
            print(json)
            completionHandler(nil, ScoreModel(with: json))
        }
    }
}
