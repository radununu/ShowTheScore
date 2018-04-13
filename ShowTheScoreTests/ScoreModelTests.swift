//
//  ScoreModelTests.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 13/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest

@testable import ShowTheScore

class ScoreModelTests: XCTestCase {
   
    func testWithNonEmptyDictionary() {
        let creditInfo = ["score": NSNumber(integerLiteral: 380), "maxScoreValue": NSNumber(integerLiteral: 930), "minScoreValue" : NSNumber(integerLiteral: 0)]
        let model = ScoreModel(with: ["creditReportInfo" : creditInfo as AnyObject])
        
        
        
        XCTAssertTrue(model.maxScoreValue == 930.0)
        XCTAssertTrue(model.minScoreValue == 0.0)
        XCTAssertTrue(model.scoreValue == 380.0)
    }
    
    func testWithEmptyDictionary() {
        let model = ScoreModel(with: [:])
        
        XCTAssertTrue(model.maxScoreValue == 0.0)
        XCTAssertTrue(model.minScoreValue == 0.0)
        XCTAssertTrue(model.scoreValue == 0.0)
    }

}
