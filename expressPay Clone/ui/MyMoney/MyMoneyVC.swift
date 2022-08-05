//
//  MyMoneyVC.swift
//  expressPay Clone
//
//  Created by mac on 03/08/2022.
//

import UIKit

class MyMoneyVC: UIViewController {
    
    var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.8395580772)
        
        
     /*   view.layer.shadowColor = UIColor.black.cgColor
     
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 1*/
        
        view.layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        
        return view
        
        
    }()
    
    var creditLabel: UILabel = {
        let label = UILabel()
        label.text = "CREDIT LIMIT"
        label.font = UIFont(name: "Avenir", size: 10)
        label.textColor = .white
        
        return label
    }()
    
    var creditLabelValue: UILabel = {
        let label = UILabel()
        label.text = "0.00"
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor = .white
        
        return label
    }()
    
    var amountDueLabel: UILabel = {
        let label = UILabel()
        label.text = "AMOUNT DUE"
        label.font = UIFont(name: "Avenir", size: 10)
        label.textColor = .white
        
        return label
    }()
    
    var amountDueValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0.00"
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor = .white
        
        return label
    }()
    
    var dueDateLabel: UILabel = {
        let label = UILabel()
        label.text = "DUE DATE"
        label.font = UIFont(name: "Avenir", size: 10)
        label.textColor = .white
        
        return label
    }()
    
    var metalCardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = #colorLiteral(red: 0.6457074655, green: 0.828722124, blue: 0.9137255549, alpha: 1)
        return view
        
        
    }()
    
   var divider1: UIView = {
        let view = UIView()
       view.backgroundColor = .white
        return view
        
        
    }()
    
    var divider2: UIView = {
         let view = UIView()
        view.backgroundColor = .white
         return view
         
         
     }()
    
    
    
    var expressPayImg: UIImageView = {
        let imgview = UIImageView()
        imgview.clipsToBounds = true
        imgview.layer.cornerRadius = 16
        
        imgview.image =  #imageLiteral(resourceName: "expresspay")
        return imgview
        
        
    }()
    
    var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "GHS 0.00"
        label.font = UIFont(name: "Avenir", size: 35)
        label.textColor = .white
        
        return label
    }()
    
    var btnsStack: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fillProportionally
        stackview.spacing = 16
        
        
      //  stackview.clipsToBounds = true

        
        return stackview
        
    }()
    
    var stackDivider: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 10, height: 30)
        view.backgroundColor = .red
        
        
        return view
        
        
    }()
    
    var addFundsBtn: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        let titleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 12)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        
        let attributedString = NSMutableAttributedString(string: "ADD FUNDS", attributes: titleAttributes)
        
        
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            
            let titleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 12)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
            
            let attributedString = NSMutableAttributedString(string: "ADD FUNDS", attributes: titleAttributes)
            
          
            
            configuration.attributedTitle = AttributedString(attributedString)
            
           
            
            configuration.titlePadding = 10
         //   configuration.imagePlacement = .trailing
            configuration.imagePadding = 10
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
         
            configuration.baseForegroundColor = .black
            configuration.baseBackgroundColor = .white
            
            
            
            let imageOnButton = UIImage(systemName: "plus",withConfiguration: UIImage.SymbolConfiguration(scale: .small))

           // configuration.image?.withTintColor(.orange)
            configuration.image = imageOnButton?.withTintColor(.orange)
            
            button = UIButton(configuration: configuration, primaryAction: nil)
        } else {
            // Fallback on earlier versions
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        }
        
        
        return button
    }()
    
    var payBtn: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle("PAY AMOUNT DUE", for: .normal)
        
        let titleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 12)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        
        let attributedString = NSMutableAttributedString(string: "PAY AMOUNT DUE", attributes: titleAttributes)
        
        
        button.setAttributedTitle(attributedString, for: .normal)
       
        button.titleLabel?.font =  UIFont(name: "Avenir", size: 15)
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            let titleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 12)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
            
            let attributedString = NSMutableAttributedString(string: "PAY AMOUNT DUE", attributes: titleAttributes)
            
          
            
            configuration.attributedTitle = AttributedString(attributedString)
            
            let imageOnButton = UIImage(systemName: "plus",withConfiguration: UIImage.SymbolConfiguration(scale: .small))

            
            configuration.image = imageOnButton
            configuration.titlePadding = 10
         //   configuration.imagePlacement = .trailing
            configuration.imagePadding = 10
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            configuration.baseForegroundColor = .black
            configuration.baseBackgroundColor = .white
            button = UIButton(configuration: configuration, primaryAction: nil)
        } else {
            // Fallback on earlier versions
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        }
        
        return button
    }()
    
    
    
    func addViewsToBtnStack(){
        btnsStack.addArrangedSubview(addFundsBtn)
        btnsStack.addArrangedSubview(stackDivider)
        btnsStack.addArrangedSubview(payBtn)

    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "myMoney"
        
        let accountImage  = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        
        let newImage = accountImage!.withTintColor( #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        
        let accountButton = UIBarButtonItem(image: newImage,  style: .plain, target: self, action: #selector(accountBtn(sender:)))
        accountButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        
        navigationItem.leftBarButtonItems = [accountButton]
        
        
        let navBarTitle = UILabel()
        
        let navBarTitleAttributes : [NSAttributedString.Key: Any] = [.font: UIFont(name:"Avenir", size: 18)!,NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
        let navBarAttributedString = NSMutableAttributedString(string: "NEW+", attributes: navBarTitleAttributes)
        navBarTitle.attributedText = navBarAttributedString
        navBarTitle.sizeToFit()

            let rightItem = UIBarButtonItem(customView: navBarTitle)
           
            
        navigationItem.rightBarButtonItem = rightItem
      
        
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        setupConstrainsts()
        
    }
    
    @objc func accountBtn(sender: AnyObject){
        
        
    }
    
    func setupConstrainsts(){
        view.addSubview(cardView)
        cardView.addSubview(metalCardView)
        cardView.addSubview(expressPayImg)
        cardView.addSubview(creditLabelValue)
        cardView.addSubview(creditLabel)
        cardView.addSubview(divider1)
        cardView.addSubview(divider2)
        cardView.addSubview(amountDueLabel)
        cardView.addSubview(amountDueValueLabel)
        cardView.addSubview(dueDateLabel)
        cardView.addSubview(amountLabel)
        view.addSubview(btnsStack)
        
        addViewsToBtnStack()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        expressPayImg.translatesAutoresizingMaskIntoConstraints = false
        metalCardView.translatesAutoresizingMaskIntoConstraints = false
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider2.translatesAutoresizingMaskIntoConstraints = false
        creditLabel.translatesAutoresizingMaskIntoConstraints = false
        creditLabelValue.translatesAutoresizingMaskIntoConstraints = false
        amountDueLabel.translatesAutoresizingMaskIntoConstraints = false
        amountDueValueLabel.translatesAutoresizingMaskIntoConstraints = false
        dueDateLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        btnsStack.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        cardView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        cardView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        
        cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 2/4).isActive = true
        
        
        metalCardView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 16).isActive = true
        metalCardView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        
        metalCardView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        metalCardView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        amountDueValueLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        amountDueValueLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16).isActive = true
        
        amountDueLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        amountDueLabel.bottomAnchor.constraint(equalTo: amountDueValueLabel.topAnchor, constant: -8).isActive = true
        
        divider1.widthAnchor.constraint(equalToConstant: 1).isActive = true
     //   divider1.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1/3).isActive = true
        divider1.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16).isActive = true
        
        divider1.rightAnchor.constraint(equalTo: amountDueLabel.leftAnchor, constant: -16).isActive = true
        divider1.topAnchor.constraint(equalTo: amountDueLabel.topAnchor).isActive = true
        
        divider2.widthAnchor.constraint(equalToConstant: 1).isActive = true
     
        divider2.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16).isActive = true
        
        divider2.leftAnchor.constraint(equalTo: amountDueLabel.rightAnchor, constant: 16).isActive = true
        divider2.topAnchor.constraint(equalTo: amountDueLabel.topAnchor).isActive = true
        
        
        dueDateLabel.leftAnchor.constraint(equalTo: divider2.rightAnchor, constant: 16).isActive = true
        dueDateLabel.topAnchor.constraint(equalTo: amountDueLabel.topAnchor).isActive = true
        
        creditLabel.rightAnchor.constraint(equalTo: divider1.leftAnchor, constant: -16).isActive = true
        creditLabel.topAnchor.constraint(equalTo: amountDueLabel.topAnchor).isActive = true
        
        creditLabelValue.topAnchor.constraint(equalTo: amountDueValueLabel.topAnchor).isActive = true
        creditLabelValue.centerXAnchor.constraint(equalTo: creditLabel.centerXAnchor).isActive = true
        
      
        amountLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        amountLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        
        expressPayImg.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        
        expressPayImg.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -16).isActive = true
        expressPayImg.heightAnchor.constraint(equalToConstant: 32).isActive = true
        expressPayImg.leftAnchor.constraint(equalTo: divider2.rightAnchor).isActive = true
        
        btnsStack.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 16).isActive = true
        btnsStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        btnsStack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        btnsStack.heightAnchor.constraint(equalToConstant: 44).isActive = true
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
