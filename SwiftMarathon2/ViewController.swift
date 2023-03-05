//
//  ViewController.swift
//  SwiftMarathon2
//
//  Created by Anton Charny on 04/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstButton: ShrinkableButton!
    @IBOutlet var secondButton: ShrinkableButton!
    
    private var thirdButton: ShrinkableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.firstButton.buttonColor = .red
        self.secondButton.buttonColor = .magenta
        
        self.configureButton(button: self.firstButton, text: "First button")
        self.configureButton(button: self.secondButton, text: "Second medium button")
        self.configureThirdButton()
    }
    
    func configureButton(button: UIButton, text: String) {
        button.configuration = nil
        button.setTitle(text, for: .normal)
        button.setImage(.init(systemName: "paperplane"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.backgroundColor = (button as? ShrinkableButton)?.buttonColor ?? .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 6
        button.setInsets(forContentPadding: .init(
            top: 10, left: 14, bottom: 10, right: 14), imageTitlePadding: 8)
        button.adjustsImageWhenHighlighted = false
    }
    
    @available(iOS 15.0, *)
    func configureThirdButton() {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.cornerStyle = .capsule
        buttonConfiguration.image = .init(systemName: "paperclip")
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                    leading: 14,
                                                                    bottom: 10,
                                                                    trailing: 14)
        
        buttonConfiguration.title = "Third button with configuration"
        buttonConfiguration.imagePlacement = .trailing
        buttonConfiguration.imagePadding = 8
        
        let button = ShrinkableButton(configuration: buttonConfiguration, primaryAction: .init(handler: { action in
            let modalController = UIViewController()
            modalController.view.backgroundColor = .white.withAlphaComponent(0.8)
            self.present(modalController, animated: true)
        }))
        
        self.thirdButton = button
        self.thirdButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.thirdButton)
        
        self.view.addConstraints([
            .init(item: button, attribute: .top, relatedBy: .equal, toItem: self.secondButton, attribute: .bottom, multiplier: 1, constant: 18),
            .init(item: button, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
    }
}
