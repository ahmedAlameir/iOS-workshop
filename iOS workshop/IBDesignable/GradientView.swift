//
//  GradientView.swift
//  iOS workshop
//
//  Created by ahmed osama on 26/05/2023.
//

import UIKit
@IBDesignable
class GradientView: UIView {
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var endColor: UIColor = .black {
        didSet {
            updateGradient()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradientLayer: CAGradientLayer? {
        return layer as? CAGradientLayer
    }
    
    private func updateGradient() {
        gradientLayer?.colors = [startColor.cgColor, endColor.cgColor]
    }
}

