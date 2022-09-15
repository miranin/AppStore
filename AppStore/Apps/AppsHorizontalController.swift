//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 13.09.2022.
//

import UIKit
import SDWebImage

class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    let leftAndRightPadding: CGFloat = 16
    
    var appGroup : AppGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
        let app = appGroup?.feed.results[indexPath.item]
        cell.nameLabel.text = app?.name
        cell.companyLabel.text = app?.artistName
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing ) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: leftAndRightPadding, bottom: topBottomPadding, right: leftAndRightPadding)
    }
}
