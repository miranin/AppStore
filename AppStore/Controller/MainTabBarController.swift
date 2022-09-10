//
//  File.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 10.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        viewControllers = [
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps")
            
        ]
        
        
    }
    
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String)->UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        viewController.view.backgroundColor = .white
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}
