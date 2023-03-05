//
//  UIButton+Ex.swift
//  SwiftMarathon2
//
//  Created by Anton Charny on 05/03/2023.
//

import UIKit

extension UIButton {
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat) {
            switch self.semanticContentAttribute {
            case .forceRightToLeft:
                self.contentEdgeInsets = UIEdgeInsets(
                    top: contentPadding.top,
                    left: contentPadding.left + imageTitlePadding,
                    bottom: contentPadding.bottom,
                    right: contentPadding.left
                )
                self.titleEdgeInsets = UIEdgeInsets(
                    top: 0,
                    left: -imageTitlePadding,
                    bottom: 0,
                    right: imageTitlePadding
                )
            default:
                self.contentEdgeInsets = UIEdgeInsets(
                    top: contentPadding.top,
                    left: contentPadding.left,
                    bottom: contentPadding.bottom,
                    right: contentPadding.right + imageTitlePadding
                )
                self.titleEdgeInsets = UIEdgeInsets(
                    top: 0,
                    left: imageTitlePadding,
                    bottom: 0,
                    right: -imageTitlePadding
                )
            }
        }
}
