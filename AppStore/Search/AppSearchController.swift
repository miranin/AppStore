//
//  AppSearchController.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 10.09.2022.
//

import UIKit

class AppSearchController:BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate var appResults = [Results]()
    fileprivate let cellSearchIdentifier = "cellSearch"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let enterSearchTerm: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above.."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var timer: Timer?
    var requestPending = false
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(enterSearchTerm)
        enterSearchTerm.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(50)
            make.bottom.equalToSuperview()
        }
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellSearchIdentifier)
        setupSearchBar()
        //        fetchITunesApps()
    }
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("print text changed \(searchText)")
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(updateSearch), with: searchText, afterDelay: 1)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.searchBar.text = ""
        self.searchController.resignFirstResponder()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    @objc func updateSearch(text: String) {
        guard !text.isEmpty else {
            return
        }
        print("print request")
        Service.shared.fetchApps(searchItem: text) { res, err in
            self.appResults = res?.results ?? []
            print("print response")
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    fileprivate func fetchITunesApps() {
        Service.shared.fetchApps(searchItem: "Twitter" ) { (res,error)  in
            if let error = error {
                print("error occured \(error)")
                return
            }
            self.appResults = res?.results ?? [] 
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTerm.isHidden = appResults.count != 0
        return appResults.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellSearchIdentifier, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
        return cell
    }
}


