//
//  PayVC.swift
//  expressPay Clone
//
//  Created by mac on 02/08/2022.
//

import UIKit

class PayVC: UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return payments.count
        
       
            if(payments[section].isOpened == true){
                return 2
            }else{
                return 1
            
    }
    }
    
    func numberOfSections(in tableView: UITableView ) -> Int {
        
        return payments.count
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
            
          var i = 0
            //close all sections opened if new section is clicked
            for item in payments{
                if(item.isOpened == true){
                    //let section close if its already opened and its clicked again
                    //prevent its isOpened param for bn set to false
                    //it bn set to false makes when its opened means itll remain opened when its clicked
                    if(i != indexPath.section){
                    payments[i].isOpened = false
                    let sections = IndexSet.init(integer: i)
                    tableView.reloadSections(sections, with: .none)
                    }
                }
                i = i + 1
            }
            
            if(payments[indexPath.section].isOpened == true){
                
                payments[indexPath.section].isOpened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
            }else{
                
                
                payments[indexPath.section].isOpened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PayCell", for: indexPath) as! PayCell
            
            cell.selectionStyle = .none
            
            cell.backgroundColor = .white
        
        let item = payments[indexPath.section]
        
        cell.imgView.image = item.image
        
        cell.nameLabel.text = item.name
        
        return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewPayCell", for: indexPath)
                as! NewPayCell
            cell.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    
    struct payData{
        let name: String
        let image: UIImage
        let isNew: Bool
        var isOpened: Bool
    }
    
    private let tableview: UITableView = {
        let tableview = UITableView()
      
        tableview.register(PayCell.self, forCellReuseIdentifier: PayCell.identifier)
        tableview.register(NewPayCell.self, forCellReuseIdentifier: NewPayCell.identifier)
        
        return tableview
        
    }()
    
    var payments = [payData]()
    var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        let lblTitle = UILabel()
        
        let titleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 20)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
        let attributedString = NSMutableAttributedString(string: "Pay", attributes: titleAttributes)
        lblTitle.attributedText = attributedString
        lblTitle.sizeToFit()
        navigationItem.titleView = lblTitle
        
       // navigationItem.title = "Pay"
        
        view.addSubview(searchBar)
        
        searchBar.delegate = self
         
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.placeholder = "Search Accounts"
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        searchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        
        tableview.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        tableview.backgroundColor = .white
        
        let pay1 = payData(name: "AIRTIME-TOPUP", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay2 = payData(name: "INTERNET", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay3 = payData(name: "SEND MONEY", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay4 = payData(name: "FUEL", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay5 = payData(name: "SCAN2PAY", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay6 = payData(name: "TV", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay7 = payData(name: "INSURANCE", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay8 = payData(name: "UTILITIES", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay9 = payData(name: "RESERVATIONS", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        let pay11 = payData(name: "FINANCE", image:  #imageLiteral(resourceName: "groceries"),isNew: true,isOpened: false)
        
        payments.append(pay1)
        payments.append(pay2)
        payments.append(pay3)
        payments.append(pay4)
        payments.append(pay5)
        payments.append(pay6)
        payments.append(pay7)
        payments.append(pay8)
        payments.append(pay9)
        payments.append(pay11)
        
        tableview.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
      
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText \(searchBar.text!)")
       // searchName = "\(searchBar.text!)".lowercased()
        let searchName = "\(searchBar.text!)".lowercased()
        
  
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
