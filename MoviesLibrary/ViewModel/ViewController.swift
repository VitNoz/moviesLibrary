//
//  ViewController.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 06.05.2022.
//

/*
 Создать UITabBarController c 2-мя табами. UITabBarItem (названия 1. MoviesList 2. Favorites).
 Верстку UITabBarController сделать кодом.
 Первый childViewController это первый таб “List VC”. Должен содержать список фильмов. Для этого нужно создать Storyboard в котором будет - UITableView или UICollectionView.
 Верстку ячейки сделать кодом. Ячейку отобразить нативными методами autolayout/constraints.
 Данные спарсить используя нативные методы URLSession. Для структурирования моделей использовать протокол Codable.

 Ссылка на API - Moviedb
 https://developers.themoviedb.org/3/getting-started/introduction
 Сгенерировать ключ.
 В разделе - Movies по ссылке выше (API):
 Сделать запросы на получение фильмов, деталей фильма.

 // 184e75efa627664fffa178dd48fec464
 
 Функции:

 1 - При нажатии на ячейку (UITableViewCell или UICollectionViewCell) открывать экран Details фильма. Отобразить изображение фильма, его описание и год выпуска.
 Дизайн UI не принципиален - главное чтобы выглядело красиво.

 2 - При long press по ячейке, контент добавляется в Favorites. А во втором childViewController (второй таб “Favorites”) отобразить те фильмы, которые юзер добавил в избранное. Избавиться от дубликатов при добавлении. (Для верстки для второго таба “Favorites” использовать TableView или CollectionView сделать полностью кодом (не через Storyboard) использовать нативную верстку, а ячейку сверстать xib файлом.

 3 - При нажатии на ячейку во втором табе “Favorites” открывается новый экран - отобразить жанр и название фильма, год выпуска… (чем больше данных о фильме - тем лучше!)

 4 - Во втором табе “Favorites” сделать возможность редактирования, для удаления ячейки, если быть точнее юзер удаляет избранный элемент. Визуально дать понять юзеру, что элемент удален.(можно реализовать удаление по long press)
 Приложение сделать на архитектуре VIPER или MVVM

 Для передачи данных использовать делегаты, замыкания или координатор/роутер по желанию.

 Вопросы приветствуются через HR-специалиста.

 */

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        
    }

    func setupTabBar () {
        
        let listVC = createNavController(vc: ListVC(), itemName: "Movies List", itemImage: "list.star")
        let favoritesVC = createNavController(vc: FavoritesVC(), itemName: "Favorites", itemImage: "star")
        //listVC.navigationBar.barTintColor = UIColor.green
        //favoritesVC.navigationBar.barTintColor = UIColor.green
        
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

