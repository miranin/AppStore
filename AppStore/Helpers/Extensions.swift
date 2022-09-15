//
//  Extensions.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 13.09.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
    }
}
extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

