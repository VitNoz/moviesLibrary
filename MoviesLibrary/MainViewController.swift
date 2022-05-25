//
//  ViewController.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 06.05.2022.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        
    }

    func setupTabBar () {
        
        let listVC = createNavController(vc: ListVC(), itemName: "Movies List", itemImage: "list.star")
        let favoritesVC = createNavController(vc: FavoritesVC(), itemName: "Favorites", itemImage: "star")
        
        viewControllers = [listVC, favoritesVC]
        
        if #available(iOS 15, *) {
          let appearance = UITabBarAppearance()
          appearance.configureWithOpaqueBackground()
          appearance.backgroundColor = .white
          UITabBar.appearance().standardAppearance = appearance
          UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    
    }

    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
        
    }
    
}

