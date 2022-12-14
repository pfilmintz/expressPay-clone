//
//  TabBarViewController.swift
//  expressPay Clone
//
//  Created by mac on 02/08/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .light
        
     //   view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController:PayVC())
        let vc3 = UINavigationController(rootViewController:TransfersVC())
        let vc4 = UINavigationController(rootViewController:MyMoneyVC())
        
        self.setViewControllers([vc1,vc2,vc3,vc4], animated: false)
        
        guard let items = self.tabBar.items else {
            return
            
        }
        
        //chart.bar.doc.horizontal
        
        let images = ["house","creditcard","paperplane","chart.bar.doc.horizontal"]
        let titles = ["Home","Pay","Transfers","MyMoney"]
        
        for x in 0..<items.count {
        //    items[1].badgeValue = "1"
            items[x].image = UIImage(systemName: images[x])
            items[x].title = titles[x]
        }
        
        
        self.tabBar.unselectedItemTintColor = UIColor.white
        self.tabBar.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
       // self.tabBar.tintColor = UIColor.white // tab bar icon tint color
            //   self.tabBar.isTranslucent = false
           // UITabBar.appearance().barTintColor = UIColor.blue
        
     /*   guard let tabBarController = self.tabBarController else {
            return
            
        }*/
        
        if #available(iOS 15.0, *) {
           let appearance = UITabBarAppearance()
           appearance.configureWithOpaqueBackground()
           appearance.backgroundColor = #colorLiteral(red: 0, green: 0.2684682608, blue: 0.4762560725, alpha: 1)
           
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance =  self.tabBar.standardAppearance
        }
        else{
        
        tabBar.barTintColor = #colorLiteral(red: 0, green: 0.2684682608, blue: 0.4762560725, alpha: 1)
        tabBar.isTranslucent = false
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
