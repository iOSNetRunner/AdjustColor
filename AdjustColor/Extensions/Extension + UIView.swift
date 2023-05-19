//
//  Extension + UIView.swift
//  AdjustColor
//
//  Created by Dmitrii Galatskii on 19.05.2023.
//

import UIKit

extension UIView {
    func setBottomColorToGradientBlack() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.black.cgColor]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

