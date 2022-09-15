//
//  BaseListController.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 13.09.2022.
//

import UIKit

class BaseListController: UICollectionViewController {
    
   
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
