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
                if(payments[section].subItem == nil){
                return 2
                }else{
                    return payments[section].subItem!.count + 2
                }
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
            
            if(item.isNew){
                cell.newLabel.isHidden = false
            }
        
            if(!item.isNew){
                cell.newLabel.isHidden = true
            }
        cell.imgView.image = item.image
        
        cell.nameLabel.text = item.name
        
        return cell
            
        }else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewPayCell", for: indexPath)
                as! NewPayCell
            cell.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            cell.selectionStyle = .none
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaySubCell", for: indexPath)
                as! PaySubCell
         
            cell.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            cell.selectionStyle = .none
            
            let item = payments[indexPath.section].subItem?[indexPath.row - 2]
            
            cell.imgView.image = item?.image
            
            cell.titleLabel.text = item?.title
            cell.subtitleLabel.text = item?.subtitle
            
            return cell
        }
    }
    
    
    struct payData{
        let name: String
        let image: UIImage
        let isNew: Bool
        var isOpened: Bool
        var subItem: [paySubData]?
    }
    
    struct paySubData{
        let title: String
        let subtitle: String
        let image: UIImage
    }
    
    private let tableview: UITableView = {
        let tableview = UITableView()
      
        tableview.register(PayCell.self, forCellReuseIdentifier: PayCell.identifier)
        tableview.register(NewPayCell.self, forCellReuseIdentifier: NewPayCell.identifier)
        tableview.register(PaySubCell.self, forCellReuseIdentifier: PaySubCell.identifier)
        
        return tableview
        
    }()
    
    var payments = [payData]()
    var searchBar = UISearchBar()
    var coloredIconImages = [UIImage]()

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
        
        let accountImage  = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        
        let newImage = accountImage!.withTintColor(.white)
        
        
        let accountButton = UIBarButtonItem(image: newImage,  style: .plain, target: self, action: #selector(accountBtn(sender:)))
        accountButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        
        navigationItem.leftBarButtonItems = [accountButton]
        
        
        let navBarTitle = UILabel()
        
        let navBarTitleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 20)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        let navBarAttributedString = NSMutableAttributedString(string: "EDIT", attributes: navBarTitleAttributes)
        navBarTitle.attributedText = navBarAttributedString
        navBarTitle.sizeToFit()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(PayVC.editBtnAction))
        navBarTitle.isUserInteractionEnabled = true
        navBarTitle.addGestureRecognizer(tap)
        
     
        
        

        let rightItem = UIBarButtonItem(customView: navBarTitle)
           
            
        navigationItem.rightBarButtonItem = rightItem
        
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
        
        loadIconImages()
        
        let pay1Item = paySubData(title: "My Mtn Prepaid Topup", subtitle: "MTN Prepaid Topup", image: #imageLiteral(resourceName: "mtn"))
        var pay1subItems = [paySubData]()
        pay1subItems.append(pay1Item)
        
        let pay1 = payData(name: "AIRTIME-TOPUP", image: coloredIconImages[0],isNew: false,isOpened: false,subItem: pay1subItems)
        
        let pay2 = payData(name: "INTERNET", image: coloredIconImages[1] ,isNew: false,isOpened: false)
        
        var pay3subItems = [paySubData]()
        let pay3Item = paySubData(title: "My expressCard", subtitle: "expressCard", image: #imageLiteral(resourceName: "expresspay2"))
        let pay3Item2 = paySubData(title: "My Mtn Prepaid Topup", subtitle: "MTN Prepaid Topup", image: #imageLiteral(resourceName: "mtn"))
        
        pay3subItems.append(pay3Item)
        pay3subItems.append(pay3Item2)
        
        let pay3 = payData(name: "SEND MONEY", image:  coloredIconImages[2],isNew: false,isOpened: false,subItem: pay3subItems)
        let pay4 = payData(name: "FUEL", image:  coloredIconImages[3],isNew: false,isOpened: false)
        let pay5 = payData(name: "SCAN2PAY", image:  coloredIconImages[4],isNew: true,isOpened: false)
        let pay6 = payData(name: "TV", image:  coloredIconImages[5],isNew: false,isOpened: false)
        let pay7 = payData(name: "INSURANCE", image:  coloredIconImages[6],isNew: true,isOpened: false)
        let pay8 = payData(name: "UTILITIES", image:  coloredIconImages[7],isNew: true,isOpened: false)
        let pay9 = payData(name: "RESERVATIONS", image:  coloredIconImages[8],isNew: false,isOpened: false)
        let pay11 = payData(name: "FINANCE", image:  coloredIconImages[9],isNew: false,isOpened: false)
        
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
    
    func loadIconImages(){
        
        var iconImages = [UIImage]()
        
        
        let airtimeImage  = UIImage(systemName: "iphone.homebutton")?.withRenderingMode(.alwaysOriginal)
        
        let internetImage  = UIImage(systemName: "wifi")?.withRenderingMode(.alwaysOriginal)
        let moneyImage  = UIImage(systemName: "banknote")?.withRenderingMode(.alwaysOriginal)
        let fuelImage  = UIImage(systemName: "fuelpump")?.withRenderingMode(.alwaysOriginal) ?? UIImage(systemName: "questionmark.square.fill")!.withRenderingMode(.alwaysOriginal)
        let qrCodeImage  = UIImage(systemName: "qrcode")?.withRenderingMode(.alwaysOriginal)
        let tvImage  = UIImage(systemName: "tv")?.withRenderingMode(.alwaysOriginal)
        
        let insuranceImage  = UIImage(systemName: "shield")?.withRenderingMode(.alwaysOriginal)
        let utilitiesImage  = UIImage(systemName: "lightbulb")?.withRenderingMode(.alwaysOriginal)
        
        
        let reservationsImage  = UIImage(systemName: "star.square")?.withRenderingMode(.alwaysOriginal)
        let financeImage  = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal)
      
        
        iconImages.append(airtimeImage!)
        iconImages.append(internetImage!)
        iconImages.append(moneyImage!)
        iconImages.append(fuelImage)
        iconImages.append(qrCodeImage!)
        iconImages.append(tvImage!)
        
        iconImages.append(insuranceImage!)
        iconImages.append(utilitiesImage!)
        iconImages.append(reservationsImage!)
        iconImages.append(financeImage!)
        
        
        for image in iconImages{
            
            coloredIconImages.append(image.withTintColor(.lightGray))
            
        }
    }
    
    func safeSystemImage(_ image: String) -> String {
        let image = "\(image).square.fill"
        
        if UIImage(systemName: image) != nil {
            return image
        } else {
            return "" // ← The image you want in case it doesn't exist.
        }
    }
    
    @objc func accountBtn(sender: AnyObject){
      
        
    }
    
    @objc func editBtnAction(sender: AnyObject){
        print("Test to see if it works")
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
      
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText \(searchBar.text!)")
       // searchName = "\(searchBar.text!)".lowercased()
       
        
  
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
