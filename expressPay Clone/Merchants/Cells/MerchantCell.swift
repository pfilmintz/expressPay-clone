//
//  MerchantCell.swift
//  expressPay Clone
//
//  Created by mac on 02/08/2022.
//

import UIKit

class MerchantCell: UICollectionViewCell {
    static let identifier = "MerchantCell"
    
    var imgView: UIImageView = {
        let image = UIImageView()
        
        
        image.clipsToBounds = true
        
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 12)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8470588235)
        
        return label
    }()
    
    var mainView: UIView = {
        let view = UIView()
       
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
     
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.1
        
        
        
        return view
    }()
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.clipsToBounds = false
        
        contentView.addSubview(mainView)
        mainView.addSubview(imgView)
        mainView.addSubview(nameLabel)
        

        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
          
            
            mainView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            imgView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            imgView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            imgView.heightAnchor.constraint(equalToConstant: 40),
            imgView.widthAnchor.constraint(equalToConstant: 40),
            
            nameLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8),
            
            nameLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -2),
            nameLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 2)
            
            
            ])
    }
}
