//
//  DashboardPresenterTests.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 13/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest

@testable import ShowTheScore

class DashboardPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    func testExtractScoreDetailsForSuccessFetch() {
        let creditInfo = ["score": NSNumber(integerLiteral: 300), "maxScoreValue": NSNumber(integerLiteral: 700), "minScoreValue" : NSNumber(integerLiteral: 0)]
        let model = ScoreModel(with: ["creditReportInfo" : creditInfo as AnyObject])
        let presenter = DashboardPresenter(DashboardRouter())
        
        let scoreToCompare = "0.428571"
        let stringScoreToCompare = "Your credit score is 300 out of 700"
        
        let toupleToTest = presenter.extractScoreDetails(from: model)

        
        XCTAssertTrue("\(toupleToTest.score)" == scoreToCompare)
        XCTAssertTrue(toupleToTest.stringValue == stringScoreToCompare)
    }
    
    func testExtractScoreDetailsForFailedFetch() {

        let model = ScoreModel(with: [:])
        let presenter = DashboardPresenter(DashboardRouter())
        
        let scoreToCompare = "0.0"
        let stringScoreToCompare = ""
        
        let toupleToTest = presenter.extractScoreDetails(from: model)
                
        XCTAssertTrue("\(toupleToTest.score)" == scoreToCompare)
        XCTAssertTrue(toupleToTest.stringValue == stringScoreToCompare)
    }
    
    
}
