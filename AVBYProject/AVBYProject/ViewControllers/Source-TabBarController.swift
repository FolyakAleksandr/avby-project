import UIKit
struct TabBarController {
    // VC inout tabBarController
    let rootTabBarController = MainViewController()
    let favoritesVC = FavoritesViewController()
    let advertisementsVC = AdvertisementsViewController()
    let dialogueVC = DialoguesViewController()
    let otherVC = OtherViewController()
    
    // tabBarController
    let mainTabBarController = UITabBarController()
    func configureTabBarController() -> UITabBarController {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "background-nav-tab")
        mainTabBarController.viewControllers = [rootTabBarController, favoritesVC, advertisementsVC, dialogueVC, otherVC]
        mainTabBarController.selectedViewController = rootTabBarController
        mainTabBarController.tabBar.scrollEdgeAppearance = appearance
        mainTabBarController.tabBar.barTintColor = UIColor(named: "tabBarTintColorSelected")
        mainTabBarController.tabBar.unselectedItemTintColor = UIColor(named: "tabBarTintColorUnselected")
        
        rootTabBarController.tabBarItem = UITabBarItem(
            title: "Поиск",
            image: UIImage(systemName: "car.2.fill"),
            tag: 0)
        favoritesVC.tabBarItem = UITabBarItem(
            title: "Избранное",
            image: UIImage(systemName: "bookmark.fill"),
            tag: 1)
        advertisementsVC.tabBarItem = UITabBarItem(
            title: "Объявления",
            image: UIImage(systemName: "plus.app.fill"),
            tag: 2)
        dialogueVC.tabBarItem = UITabBarItem(
            title: "Диалоги",
            image: UIImage(systemName: "ellipsis.message.fill"),
            tag: 3)
        otherVC.tabBarItem = UITabBarItem(
            title: "Прочее",
            image: UIImage(systemName: "square.grid.2x2.fill"),
            tag: 4)
        return mainTabBarController
    }
}
