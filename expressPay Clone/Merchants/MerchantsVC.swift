//
//  MerchantsVC.swift
//  expressPay Clone
//
//  Created by mac on 02/08/2022.
//

import UIKit

class MerchantsVC: UIViewController,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMerchantSections[section].merchants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MerchantCell.identifier , for: indexPath) as! MerchantCell
        
        let image = filteredMerchantSections[indexPath.section].merchants[indexPath.row].image
        let name = filteredMerchantSections[indexPath.section].merchants[indexPath.row].title
        
        cell.imgView.image = image
        cell.nameLabel.text = name
        
      //  cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2524197812)
        
        return cell
    }
    
    func numberOfSections (in collectionview: UICollectionView) -> Int {
        return filteredMerchantSections.count
        
    }
    
    
    struct Merchant{
        let title: String
        let section: String
        let image: UIImage
        
    }
    
    var merchants = [Merchant]()
    var sortedmerchants = [Merchant]()
    var filteredmerchants = [Merchant]()
  
    
    struct MerchantSection{
        let title: String
        let merchants: [Merchant]
    }
    
    var merchantSections = [MerchantSection]()
    var filteredMerchantSections = [MerchantSection]()
    
    var searchBar = UISearchBar()
    var collectionview: UICollectionView?
    
    var VCtitle = ""
    
    var initLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = VCtitle
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        
        var merchant1 = Merchant(title: "AirtelTigo Prepaid TopUp",section: "AIRTIME-TOPUP", image: #imageLiteral(resourceName: "groceries"))
        var merchant2 = Merchant(title: "MTN Prepaid TopUp",section: "AIRTIME-TOPUP", image: #imageLiteral(resourceName: "groceries"))
        var merchant3 = Merchant(title: "Glo Prepaid TopUp",section: "AIRTIME-TOPUP", image: #imageLiteral(resourceName: "groceries"))
        var merchant4 = Merchant(title: "Vodafone Prepaid TopUp",section: "AIRTIME-TOPUP", image: #imageLiteral(resourceName: "groceries"))
        
        var merchant5 = Merchant(title: "MTN Fiber",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        var merchant6 = Merchant(title: "MTN 4G Data",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        var merchant7 = Merchant(title: "Glo Data",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        var merchant8 = Merchant(title: "Vodafone Broadband",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        
        var merchant9 = Merchant(title: "Blue Data Plan",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        var merchant11 = Merchant(title: "Blue Refill",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        var merchant12 = Merchant(title: "Busy 4G Data",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        var merchant13 = Merchant(title: "Surfline Data Bundles",section: "INTERNET", image: #imageLiteral(resourceName: "groceries"))
        
        merchants.append(merchant1)
        merchants.append(merchant2)
        merchants.append(merchant3)
        merchants.append(merchant4)
        merchants.append(merchant5)
        merchants.append(merchant6)
        merchants.append(merchant7)
        merchants.append(merchant8)
        
        merchants.append(merchant9)
        merchants.append(merchant11)
        merchants.append(merchant12)
        merchants.append(merchant13)
        
        filteredmerchants = merchants

        
        
        
        
        setupConstrainsts()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.cancelsTouchesInView = false
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        collectionview!.addGestureRecognizer(recognizer)
        
        sortMerchants()
        
    }
    
    @objc func dismissOnTapOutside(){
                self.dismiss(animated: true, completion: nil)
             }
    
    @objc func touch() {
        //print("Touches")
        self.view.endEditing(true)
    }
    
    func sortMerchants(){
        
        filteredMerchantSections.removeAll()
        
        let sections = ["AIRTIME-TOPUP","INTERNET"]
        
        //using dates to sort transactions in date
        for section in sections {

            for item in filteredmerchants {
                if(section == item.section){
                    
                    //appending transaction with particular date in group
                    sortedmerchants.append(item)
                    
                    
            }
            }
            //appending group transactions into transaction section
           // transactionSections.append(TransactionSection(date: date, transactions: newtransactions))
            
            let merchantSection = MerchantSection(title: section, merchants: sortedmerchants)
            
            filteredMerchantSections.append(merchantSection)
            
            if(initLoad){
                
            merchantSections = filteredMerchantSections
            }
            
            //clearing group transaction for new date
            sortedmerchants.removeAll()
            
        }
        
        if let collectionview = collectionview {
             initLoad = false
            collectionview.reloadData()
        }
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        
        filteredmerchants = merchants
        filteredMerchantSections = merchantSections
        
        filteredmerchants = merchants.filter { $0.title.starts(with: searchText)  }
        
        
        
        sortMerchants()
        
    
        
      
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText \(searchBar.text!)")
       // searchName = "\(searchBar.text!)".lowercased()
        let searchName = "\(searchBar.text!)".lowercased()
        
  
    }
    
    func setupConstrainsts(){
        
        view.addSubview(searchBar)
        
        searchBar.delegate = self
         
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        searchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        guard let collectionview = collectionview else {
            return
        }
        
        
      

        collectionview.register(MerchantCell.self, forCellWithReuseIdentifier: MerchantCell.identifier)
        
    
        
        
       
     
      
        
        collectionview.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        view.addSubview(collectionview)
         
        collectionview.translatesAutoresizingMaskIntoConstraints = false
         
         
        collectionview.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
            
        collectionview.backgroundColor = .white
        
        
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout{
       let layout = UICollectionViewCompositionalLayout{[weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {return nil}
            
            
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
           
           item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 5)
                //group
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120)), subitem: item, count: 3)
                //section
                let section = NSCollectionLayoutSection(group: group)
                
               
                
            //    section.decorationItems = [NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.identifier)]
                
                //scroll behavior/direction
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 0
                section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
                
              
                
                //prevent header from following padding insets of main cell
                section.supplementariesFollowContentInsets = false
                
                let headerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                             heightDimension: .estimated(40))
                    
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerHeaderSize,elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                
           // for sticky header
           sectionHeader.pinToVisibleBounds = true
                
                    
                section.boundarySupplementaryItems = [sectionHeader]
                
               
                
                
                
                return section
                
            
            
        }
        
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: SectionBackgroundDecorationView.identifier)
        return layout
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            header.headerlabel2.isHidden = true
            header.headerlabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8470588235)
            header.headerlabel.font = UIFont(name: "Avenir", size: 14)
            header.headerlabel.text = filteredMerchantSections[indexPath.section].title
            header.backgroundColor = #colorLiteral(red: 0.7019608021, green: 0.8431372643, blue: 1, alpha: 1)
            
            
          
            
            
     
            return header
        default:
            return HeaderCell()
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
