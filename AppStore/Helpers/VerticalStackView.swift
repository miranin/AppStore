//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 12.09.2022.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat) {
        super.init(frame: .zero)
        arrangedSubviews.forEach{(addArrangedSubview($0))}
        self.axis = .vertical
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
