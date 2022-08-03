//
//  HomeVC.swift
//  expressPay Clone
//
//  Created by mac on 01/08/2022.
//

import UIKit
import SwipeCellKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var collectionview: UICollectionView?
    
    struct featuredData{
        let name: String
        let image: UIImage
    }
    
    struct FavData{
        let title: String
        let subtitle: String
        let image: UIImage
    }
    
    struct FeaturedSection{
        let featuredItems: [featuredData]
      
    }
    
    struct FavSection{
        let favItems: [FavData]
      
    }
    
    var featuredItems = [featuredData]()
    var favItems = [FavData]()
    
    var featuredSection = [FeaturedSection]()
    var favSection = [FavSection]()
    
    var buttonDisplayMode: ButtonDisplayMode = .titleAndImage
        var buttonStyle: ButtonStyle = .backgroundColor

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lblTitle = UILabel()
        
        let titleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 20)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
        let attributedString = NSMutableAttributedString(string: "expressPay", attributes: titleAttributes)
        lblTitle.attributedText = attributedString
        lblTitle.sizeToFit()
        navigationItem.titleView = lblTitle
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        
        //navigationItem.title = "expressPay"
        
        let featuredItem1 = featuredData(name: "Airtime", image: #imageLiteral(resourceName: "groceries"))
        let featuredItem2 = featuredData(name: "Internet", image: #imageLiteral(resourceName: "groceries"))
        let featuredItem3 = featuredData(name: "Bank Direct", image: #imageLiteral(resourceName: "groceries"))
        let featuredItem4 = featuredData(name: "Transfers", image: #imageLiteral(resourceName: "groceries")) 
        featuredItems.append(featuredItem1)
        featuredItems.append(featuredItem2)
        featuredItems.append(featuredItem3)
        featuredItems.append(featuredItem4)
        
        let featSection = FeaturedSection(featuredItems: featuredItems)
        
        featuredSection.append(featSection)
        
        
        
        
        let favItem1 = FavData(title: "My MTN prepaid topup",subtitle: "MTN Prepaid Topup", image: #imageLiteral(resourceName: "groceries"))
        let favItem2 = FavData(title: "Philip Mintah",subtitle: "MTN Mobile Money",  image: #imageLiteral(resourceName: "groceries"))
        
        
        favItems.append(favItem1)
        favItems.append(favItem2)
        
        let favSec = FavSection(favItems: favItems)
        
        
        
        favSection.append(favSec)
        

        // Do any additional setup after loading the view.
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        guard let collectionview = collectionview else {
            return
        }
        
        
      

        collectionview.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.identifier)
        
        collectionview.register(FavouritesCell.self, forCellWithReuseIdentifier: FavouritesCell.identifier)
    //    collectionview.register(TransactionCell.self, forCellWithReuseIdentifier: TransactionCell.identifier)
        
      //  collectionview.register(PromoCell.self, forCellWithReuseIdentifier: PromoCell.identifier)
        
       
     
      
        
        collectionview.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        view.addSubview(collectionview)
         
        collectionview.translatesAutoresizingMaskIntoConstraints = false
         
         
        collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -2).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 2).isActive = true
        
            //collectionview.backgroundColor = #colorLiteral(red: 0, green: 0.6711869624, blue: 1, alpha: 0.8913582303)
        collectionview.backgroundColor = .white
        
        collectionview.reloadData()
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout{
       let layout = UICollectionViewCompositionalLayout{[weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {return nil}
            
            if sectionIndex == 0{
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(100)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                
               
                
                section.decorationItems = [NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.identifier)]
                
                //scroll behavior/direction
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 15, bottom: 10, trailing: 10)
                
              
                
                //prevent header from following padding insets of main cell
                section.supplementariesFollowContentInsets = false
                
                let headerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                             heightDimension: .estimated(50))
                    
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerHeaderSize,elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                
                
                    
                section.boundarySupplementaryItems = [sectionHeader]
                
               
                
                
                
                return section
                
            }else{
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                
               
                
              //  section.decorationItems = [NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.identifier)]
                
                //scroll behavior/direction
             //   section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 15, bottom: 10, trailing: 15)
                
              
                
                //prevent header from following padding insets of main cell
                section.supplementariesFollowContentInsets = false
                
                let headerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                             heightDimension: .estimated(50))
                    
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerHeaderSize,elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                
                
                    
                section.boundarySupplementaryItems = [sectionHeader]
                
               
                
                
                
                return section
            }
            
        }
        
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: SectionBackgroundDecorationView.identifier)
        return layout
        
    }
        
        func numberOfSections (in collectionview: UICollectionView) -> Int {
            return 2
            
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if(section == 0){
                return featuredItems.count
            }else{
                return favItems.count
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.section == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.identifier , for: indexPath) as! FeaturedCell
                
                let image = featuredSection[indexPath.section].featuredItems[indexPath.row].image
                let name = featuredSection[indexPath.section].featuredItems[indexPath.row].name
                
                cell.imgView.image = image
                cell.nameLabel.text = name
                
              //  cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2524197812)
                
                return cell
            }else{
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouritesCell.identifier , for: indexPath) as! FavouritesCell
                
                cell.delegate = self
                
                let image = favSection[indexPath.section - 1].favItems[indexPath.row].image
                let title = favSection[indexPath.section - 1].favItems[indexPath.row].title
                let subtitle = favSection[indexPath.section - 1].favItems[indexPath.row].subtitle
                
                cell.imgView.image = image
                cell.titleLabel.text = title
                cell.subtitleLabel.text = subtitle
                
              //  cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2524197812)
                
                return cell
                
                }
        }
    
  
    
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            
           // header.headerlabel.font = UIFont.boldSystemFont(ofSize: 22)
        //    header.headerlabel.text = "Good evening, PHILIP"
          //  header.backgroundColor = nil
            
            header.headerlabel2.isHidden = true
            
            if(indexPath.section == 0){
                
                header.headerlabel2.isHidden = false
                
                header.headerlabel.text = "FEATURED"
                header.headerlabel.textColor = .white
                
                header.headerlabel2.text = "VIEW ALL"
                header.headerlabel2.textColor = .white
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(HomeVC.tapFunction))
              
                header.headerlabel2.isUserInteractionEnabled = true
                header.headerlabel2.addGestureRecognizer(tap)

            }else{
                header.headerlabel.text = "MY FAVOURITES"
                header.headerlabel.textColor = .black
            }
     
            return header
        default:
            return HeaderCell()
        }
    }
    
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
        let myVC = MerchantsVC()
        
        myVC.VCtitle = "Merchants"
        
        self.navigationController?.pushViewController(myVC, animated: true)
        
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

extension HomeVC: SwipeCollectionViewCellDelegate {
    
    
    func configure(action: SwipeAction, with descriptor: ActionDescriptor) {
        
        switch descriptor {
        case .read:
            return
        case .unread:
            return
        case .more:
            
            buttonDisplayMode = .titleOnly
            
            action.title = descriptor.title(forDisplayMode: buttonDisplayMode)
        case .flag:
            return
        case .trash:
            return
        case .star:
            buttonDisplayMode = .imageOnly
            
            action.title = descriptor.title(forDisplayMode: buttonDisplayMode)
        }
        
       //    action.title = descriptor.title(forDisplayMode: buttonDisplayMode)
        
        
           action.image = descriptor.image(forStyle: buttonStyle, displayMode: buttonDisplayMode)
           
        action.backgroundColor = .orange
        
         /*  switch buttonStyle {
           case .backgroundColor:
               action.backgroundColor = descriptor.color(forStyle: buttonStyle)
           case .circular:
               action.backgroundColor = .clear
               action.textColor = descriptor.color(forStyle: buttonStyle)
               action.font = .systemFont(ofSize: 13)
               action.transitionDelegate = ScaleTransition.default
           }*/
        
       }
    
 /*   func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .selection
        options.transitionStyle = .border
        switch buttonStyle {
                case .backgroundColor:
                    options.buttonSpacing = 11
                case .circular:
                    options.buttonSpacing = 4
               
        }
                
      //  let descriptor: ActionDescriptor = email.unread ? .read : .unread
        //            configure(action: read, with: descriptor)
    
        
        return options
    }*/
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

     /*   let deleteAction = SwipeAction(style: .default, title: "more") { action, indexPath in
            // handle action by updating model with deletion
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "house")
        deleteAction.backgroundColor = .orange
      
      return [deleteAction]
      
      */
        
        let cell = collectionView.cellForItem(at: indexPath) as! FavouritesCell

         let closure: (UIAlertAction) -> Void = { _ in cell.hideSwipe(animated: true) }
         let more = SwipeAction(style: .default, title: nil) { action, indexPath in
             let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
             controller.addAction(UIAlertAction(title: "Reply", style: .default, handler: closure))
             controller.addAction(UIAlertAction(title: "Forward", style: .default, handler: closure))
             controller.addAction(UIAlertAction(title: "Mark...", style: .default, handler: closure))
             controller.addAction(UIAlertAction(title: "Notify Me...", style: .default, handler: closure))
             controller.addAction(UIAlertAction(title: "Move Message...", style: .default, handler: closure))
             controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: closure))
             self.present(controller, animated: true, completion: nil)
         }
         configure(action: more, with: .more)
        
    //    let more = SwipeAction(style: .default, title: nil, handler: nil)
     //   more.hidesWhenSelected = true
        
       //             configure(action: more, with: .more)
                    
                    let delete = SwipeAction(style: .destructive, title: nil) { action, indexPath in
                        //self.emails.remove(at: indexPath.row)
                    }
                    configure(action: delete, with: .star)
                    
                 /*  let cell = collectionView.cellForItem(at: indexPath) as! FavouritesCell
        
                    let closure: (UIAlertAction) -> Void = { _ in cell.hideSwipe(animated: true) }
                    let more = SwipeAction(style: .default, title: nil) { action, indexPath in
                        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                        controller.addAction(UIAlertAction(title: "Reply", style: .default, handler: closure))
                        controller.addAction(UIAlertAction(title: "Forward", style: .default, handler: closure))
                        controller.addAction(UIAlertAction(title: "Mark...", style: .default, handler: closure))
                        controller.addAction(UIAlertAction(title: "Notify Me...", style: .default, handler: closure))
                        controller.addAction(UIAlertAction(title: "Move Message...", style: .default, handler: closure))
                        controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: closure))
                        self.present(controller, animated: true, completion: nil)
                    }
                    configure(action: more, with: .more)*/
                    
                    return [delete, more]
        
        
        

        
    }
}
