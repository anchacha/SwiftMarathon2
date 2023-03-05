//
//  ShrinkableButton.swift
//  SwiftMarathon2
//
//  Created by Anton Charny on 05/03/2023.
//

import UIKit

class ShrinkableButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public var buttonColor: UIColor?
    
    override var isHighlighted: Bool {
        didSet {
            let transform = isHighlighted ? 0.9 : 1
            UIView.animate(withDuration: 0.5, delay: 0,
                           usingSpringWithDamping: 1, initialSpringVelocity: 1,
                           options: [.allowUserInteraction, .beginFromCurrentState]) {
                self.transform = CGAffineTransform(scaleX: transform, y: transform)
            }
        }
    }
    
    override func tintColorDidChange() {
        print("Before", self.titleLabel?.text, self.tintColor)
        super.tintColorDidChange()
        print("After", self.titleLabel?.text, self.tintColor)
        switch self.tintAdjustmentMode {
        case .dimmed:
            if let _ = self.configuration {
                self.configuration?.background.backgroundColor = .lightGray
            } else {
                self.backgroundColor = .lightGray
                self.tintColor = .white
            }
        default:
            if let _ = self.configuration {
                self.configuration?.background.backgroundColor = .systemBlue
            } else {
                self.backgroundColor = self.buttonColor ?? .systemBlue
                self.tintColor = .white
            }
        }
    }
}
