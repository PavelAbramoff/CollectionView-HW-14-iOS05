//
//  TabBarController.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    static func createTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(
            [
                createChildViewController(controller: MediaController() , title:
                                            "Медиатека", image: UIImage(systemName:
                                                                            "photo.fill.on.rectangle.fill"), tag: 0),
                createChildViewController(controller: OfferController(), title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"),tag: 1),
                createChildViewController(controller: MainViewController() , title:
                                            "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag:
                                            2),
                createChildViewController(controller: SearchController() ,title: "Поиск",
                                          image: UIImage(systemName: "magnifyingglass"), tag: 3)
            ], animated: true)
        
        tabBarController.selectedIndex = 2
        
        return tabBarController
        
    }
    private static func createChildViewController(controller: UIViewController, title: String, image: UIImage?, tag: Int) -> UIViewController {
        
        let viewController = controller
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        navigationController.navigationBar.topItem?.titleView?.tintColor = .clear
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .white
        
        return navigationController
    }
}
