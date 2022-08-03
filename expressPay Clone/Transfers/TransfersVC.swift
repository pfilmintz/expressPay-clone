//
//  TransfersVC.swift
//  expressPay Clone
//
//  Created by mac on 02/08/2022.
//

import UIKit

class TransfersVC: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransferItemCell.identifier , for: indexPath) as! TransferItemCell
        
        
        
        let image = items[indexPath.row].image
        let name = items[indexPath.row].title
        
        cell.nameLabel.text = name
        
        cell.imgView.image = image
        
       
        
        return cell
    }
    
    
    
    let layout = UICollectionViewFlowLayout()
    
    
    
    private var collectionview: UICollectionView?
   
    struct ItemData {
        let title: String
        let image: UIImage
    }
    
    var items = [ItemData]()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Where would you like to send the funds to?"
        label.font = UIFont(name: "Avenir", size: 22)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 0, green: 0.6226729155, blue: 1, alpha: 1)
        
        return label
        
    }()
    
  /*  override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.transparentNavigationBar()
        navigationController?.setTintColor(.black)
    }*/

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       /* var navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navBarColor.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.black]*/
        
    //    navigationController?.navigationBar.barTintColor = UIColor.white
        
        
        
        navigationItem.title = "Transfers"
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(titleLabel)
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true

        items.append(ItemData(title: "MTN Mobile Money", image:  #imageLiteral(resourceName: "groceries")))
        items.append(ItemData(title: "Bank Direct", image:  #imageLiteral(resourceName: "groceries")))
        items.append(ItemData(title: "AirtelTigo Money", image:  #imageLiteral(resourceName: "groceries")))
        items.append(ItemData(title: "Vodafone Cash", image:  #imageLiteral(resourceName: "groceries")))
        items.append(ItemData(title: "Visa Card", image:  #imageLiteral(resourceName: "groceries")))
      
        items.append(ItemData(title: "expressCard", image:  #imageLiteral(resourceName: "groceries")))
        items.append(ItemData(title: "myQR", image:  #imageLiteral(resourceName: "groceries")))
        
       // view.backgroundColor = .systemBackground
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 8
        
        let width = (view.frame.size.width/3) - 16
        let height = width
        
        layout.itemSize = CGSize(width: width,
                                 height: height)
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
      
        
      
      
        
        guard let collectionview = collectionview else {
            return
        }

        collectionview.register(TransferItemCell.self, forCellWithReuseIdentifier: TransferItemCell.identifier)
     
        
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
     
        
        view.addSubview(collectionview)
        
        collectionview.backgroundColor = .white
         
        collectionview.translatesAutoresizingMaskIntoConstraints = false
         
         
        collectionview.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        
        collectionview.reloadData()
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

