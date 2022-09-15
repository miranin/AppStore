//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 14.09.2022.
//

import UIKit
import SnapKit

class AppsHeaderCell: UICollectionViewCell {
    let companyLabel = UILabel(text: "Company name", font: UIFont.boldSystemFont(ofSize: 12))
    let descriptionLabel = UILabel(text: "Nurkanat, Kirill, Dima and Tima are playin soccer", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        companyLabel.textColor = .blue
        
        descriptionLabel.numberOfLines = 2
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 12
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel,descriptionLabel,imageView], spacing: 12)
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
