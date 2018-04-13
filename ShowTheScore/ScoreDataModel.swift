//
//  ScoreDataModel.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 11/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit


struct ScoreModel {
    struct ScoreModelKey {
        static let creditReportInfo = "creditReportInfo"
        static let maxScoreValue    = "maxScoreValue"
        static let minScoreValue    = "minScoreValue"
        static let scoreValue       = "score"
    }
    
    let maxScoreValue: CGFloat
    let minScoreValue: CGFloat
    let scoreValue: CGFloat
    
    init(with dict: [String: AnyObject]) {
        let creditReportInfo = dict[ScoreModelKey.creditReportInfo] as? [String: AnyObject] ?? [:]
        self.maxScoreValue = creditReportInfo[ScoreModelKey.maxScoreValue] as? CGFloat ?? 0.0
        self.minScoreValue = creditReportInfo[ScoreModelKey.minScoreValue] as? CGFloat ?? 0.0
        self.scoreValue    = creditReportInfo[ScoreModelKey.scoreValue] as? CGFloat ?? 0.0
    }
}
