//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 10.09.2022.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
