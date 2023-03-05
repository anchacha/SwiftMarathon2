//
//  ShrinkableButton.swift
//  SwiftMarathon2
//
//  Created by Anton Charny on 05/03/2023.
//

import UIKit

class ShrinkableButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            let transform = isHighlighted ? 0.9 : 1
            UIView.animate(withDuration: 0.3, delay: 0,
                           usingSpringWithDamping: 1, initialSpringVelocity: 1,
                           options: [.allowUserInteraction, .beginFromCurrentState]) {
                self.transform = CGAffineTransform(scaleX: transform, y: transform)
            }
        }
    }
}
