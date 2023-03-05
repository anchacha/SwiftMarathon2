//
//  ViewController.swift
//  SwiftMarathon2
//
//  Created by Anton Charny on 04/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if #available(iOS 15.0, *) {
            secondButton.configuration = nil
        }
        secondButton.setTitle("Second medium button", for: .normal)
        secondButton.setImage(.init(systemName: "paperplane"), for: .normal)
        secondButton.semanticContentAttribute = .forceRightToLeft
        
        secondButton.backgroundColor = .systemBlue
        secondButton.tintColor = .white
        secondButton.layer.cornerRadius = 6
        secondButton.setInsets(forContentPadding: .init(top: 10, left: 14, bottom: 10, right: 14), imageTitlePadding: 8)
    }
    
    
}
