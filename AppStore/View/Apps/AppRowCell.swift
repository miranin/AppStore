//
//  AppRowCell.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 13.09.2022.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    let imageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "Name of App", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.backgroundColor = .purple
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.width.equalTo(64)
            make.height.equalTo(64)
        }
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(32)
        }
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubviews: [nameLabel,companyLabel], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
