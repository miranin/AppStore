//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 14.09.2022.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appHeaderHorizontalController = AppsHorizontalHeaderController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        appHeaderHorizontalController.view.backgroundColor = .purple
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
