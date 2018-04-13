//
//  ApplicationFlow.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 11/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ApplicationFlow {
    
    static func addApplicationFlow(to window: UIWindow?) {
        
        guard let window = window else {
            return
        }
        
        let dashboardRouter = DashboardRouter()
        let dashboardViewController = dashboardRouter.dashboardViewController()
        window.rootViewController = UINavigationController(rootViewController: dashboardViewController)
        window.makeKeyAndVisible()
    }
    
}
