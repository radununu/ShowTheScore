//
//  DashboardView.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 11/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class DashboardView: UIViewController {
    
    var presenter: DashboardOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dashboard"
        presenter?.loadData()
    }

}

private extension DashboardView {
    
    func displayFetchedScore(with progressText: String, progressValue: CGFloat) {
        let progressView = ProgressView(progressText, progressValue: progressValue)
        
        self.view.addSubview(progressView)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func showAlert(for description: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: description,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Try Again",
                                                style: .default,
                                                handler: {[weak self] _ in
                                                    guard let strongSelf = self else {
                                                        return
                                                    }
                                                    strongSelf.presenter?.loadData()
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel",
                                                style: .cancel,
                                                handler: {[weak self] _ in
                                                    guard let strongSelf = self else {
                                                        return
                                                    }
                                                    strongSelf.dismiss(animated: true)
        }))
        
        present(alertController, animated: true)
    }
}

extension DashboardView: DashboardInput {
    
    func display(error errorString: String) {
        showAlert(for: errorString)
    }
    
    func displayScore(_ scoreString: String, scoreRating: CGFloat) {
        displayFetchedScore(with: scoreString, progressValue: scoreRating)
    }
}
