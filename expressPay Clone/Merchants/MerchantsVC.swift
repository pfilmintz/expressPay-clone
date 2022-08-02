//
//  MerchantsVC.swift
//  expressPay Clone
//
//  Created by mac on 02/08/2022.
//

import UIKit

class MerchantsVC: UIViewController,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return merchantSections[section].merchants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.identifier , for: indexPath) as! FeaturedCell
        
        let image = featuredSection[indexPath.section].featuredItems[indexPath.row].image
        let name = featuredSection[indexPath.section].featuredItems[indexPath.row].name
        
        cell.imgView.image = image
        cell.nameLabel.text = name
        
      //  cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2524197812)
        
        return cell
    }
    
    func numberOfSections (in collectionview: UICollectionView) -> Int {
        return merchantSections.count
        
    }
    
    
    struct Merchant{
        let title: String
        let image: UIImage
        
    }
    
    var merchants = [Merchant]()
  
    
    struct MerchantSection{
        let title: String
        let merchants: [Merchant]
    }
    
    var merchantSections = [MerchantSection]()
    
    var searchBar = UISearchBar()
    var collectionview: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var merchant1 = Merchant(title: "AirtelTigo Prepaid TopUp", image: #imageLiteral(resourceName: "groceries"))
        var merchant2 = Merchant(title: "MTN Prepaid TopUp", image: #imageLiteral(resourceName: "groceries"))
        var merchant3 = Merchant(title: "Glo Prepaid TopUp", image: #imageLiteral(resourceName: "groceries"))
        var merchant4 = Merchant(title: "Vodafone Prepaid TopUp", image: #imageLiteral(resourceName: "groceries"))
        
        merchants.append(merchant1)
        merchants.append(merchant2)
        merchants.append(merchant3)
        merchants.append(merchant4)
        
        let merchantSection = MerchantSection(title: "AIRTIME-TOPUP", merchants: merchants)
        
        merchantSections.append(merchantSection)
        
        
        
        
        
        setupConstrainsts()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.cancelsTouchesInView = false
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        collectionview!.addGestureRecognizer(recognizer)
        
    }
    
    @objc func dismissOnTapOutside(){
                self.dismiss(animated: true, completion: nil)
             }
    
    @objc func touch() {
        //print("Touches")
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText \(searchBar.text!)")
       // searchName = "\(searchBar.text!)".lowercased()
        let searchName = "\(searchBar.text!)".lowercased()
        
  
        
        
    }
    
    func setupConstrainsts(){
        
        view.addSubview(searchBar)
         
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        searchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        
        
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
        
        
        collectionview.reloadData()
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout{
       let layout = UICollectionViewCompositionalLayout{[weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {return nil}
            
            
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.333), heightDimension: .absolute(100)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                
               
                
                section.decorationItems = [NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.identifier)]
                
                //scroll behavior/direction
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 15, bottom: 10, trailing: 10)
                
              
                
                //prevent header from following padding insets of main cell
                section.supplementariesFollowContentInsets = false
                
                let headerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                             heightDimension: .estimated(50))
                    
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerHeaderSize,elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                
                
                    
                section.boundarySupplementaryItems = [sectionHeader]
                
               
                
                
                
                return section
                
            
            
        }
        
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: SectionBackgroundDecorationView.identifier)
        return layout
        
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
