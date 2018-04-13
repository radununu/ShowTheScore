//
//  DashboardRouter.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 11/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class DashboardRouter {
    
    func dashboardViewController() -> DashboardView {
        let storyBoard = UIStoryboard(name: "DashboardStoryboard", bundle: nil)
        guard
            let viewController = storyBoard.instantiateInitialViewController() as? DashboardView else {
                return DashboardView()
        }
        
        let presenter = DashboardPresenter(self)
        presenter.inputView = viewController
        viewController.presenter = presenter
        
        return viewController
    }
    
}
