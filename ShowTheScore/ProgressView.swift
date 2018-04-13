//
//  ProgressView.swift
//  ShowTheScore
//
//  Created by Nunu, Radu (Developer) on 12/04/2018.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    fileprivate let progressLayer = CAShapeLayer()
    fileprivate let progressLabel = UILabel()
    fileprivate let progressText: String
    fileprivate let progressValue: CGFloat

    init(
        _ progressText: String,
        progressValue: CGFloat
        ) {
        self.progressText  = progressText
        self.progressValue = progressValue
        
        super.init(frame: .zero)
        
        backgroundColor = .clear
        createLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // create view radius rounded with black color margin.
        layer.masksToBounds = true
        layer.cornerRadius  = frame.width / 2
        layer.borderColor   = UIColor.black.cgColor
        layer.borderWidth   = 1.0
        
        createProgressLayer()
    }
    
}

private extension ProgressView {
    
    func createLabel() {
        progressLabel.frame =  CGRect(x: 0, y: 0, width: frame.width, height: 60)
        progressLabel.textColor = .black
        progressLabel.textAlignment = .center
        progressLabel.numberOfLines = 3
        progressLabel.text = progressText
        progressLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20.0)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(progressLabel)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        progressLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        progressLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        progressLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
    }
    
    func createProgressLayer() {
        let startAngle = degreeToRadians(degree: -90)
        let endAngle = degreeToRadians(degree: 360)
        let centerPoint = CGPoint(x: frame.width / 2 , y: frame.height / 2)
        let radius = frame.width / 2 - 10
        
        let gradientMaskLayer = gradientMask()
        progressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: radius, startAngle:startAngle, endAngle:endAngle, clockwise: true).cgPath
        progressLayer.backgroundColor = UIColor.blue.cgColor
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.black.cgColor
        progressLayer.lineWidth = 4.0
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = progressValue
        
        gradientMaskLayer.mask = progressLayer
        layer.addSublayer(gradientMaskLayer)
    }
    
    func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        gradientLayer.locations = [0.0, 1.0]
        
        let colorTop = UIColor(red: 255.0/255.0, green: 213.0/255.0, blue: 63.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 198.0/255.0, blue: 5.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        
        return gradientLayer
    }
    
    func degreeToRadians(degree: CGFloat) -> CGFloat {
        return degree * .pi / 180
    }
}
