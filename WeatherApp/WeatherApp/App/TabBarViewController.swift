import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        tabBar.tintColor = .tabBarColor
        let home = setupTabBar(title: "My Location", image: UIImage(named: "pin")!.resized(to: CGSize(width: 16, height: 20)), viewController: UINavigationController(rootViewController: HomeViewController()))
        let search = setupTabBar(title: "Search", image: UIImage(named: "search")!.resized(to: CGSize(width: 20, height: 20)), viewController: SearchViewController())
        
        self.setViewControllers([home, search], animated: true)
        self.tabBar.center = view.center
        self.tabBar.backgroundColor = .collectionViewCellColor
        self.tabBar.selectedImageTintColor = .white
        self.tabBar.unselectedItemTintColor = .black
    }
    
    private func setupTabBar(title: String, image: UIImage, viewController: UIViewController) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
