//
//  ShrinkableButton.swift
//  SwiftMarathon2
//
//  Created by Anton Charny on 05/03/2023.
//

import UIKit

class ShrinkableButton: UIButton {
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public var buttonColor: UIColor?
    
    //MARK: - Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.animate(isPressed: true)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        self.animate(isPressed: false)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        self.animate(isPressed: false)
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
    
    private func animate(isPressed: Bool) {
        if self.animator.isRunning {
            self.animator.stopAnimation(true)
        }
        
        self.animator.addAnimations {
            self.transform = isPressed ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
        }
        self.animator.startAnimation()
    }
}
