//
//  TransferItemCell.swift
//  expressPay Clone
//
//  Created by mac on 03/08/2022.
//

import UIKit

class TransferItemCell: UICollectionViewCell {
    
    static let identifier = "TransferItemCell"
    
    var imgView: UIImageView = {
        let image = UIImageView()
        
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        image.layer.cornerRadius =   image.frame.size.width / 2
        image.clipsToBounds = true
        
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.clipsToBounds = false
        
        contentView.addSubview(imgView)
  
        contentView.addSubview(nameLabel)
        

        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imgView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            imgView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            imgView.heightAnchor.constraint(equalToConstant: 50),
            imgView.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 8),
            nameLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8)
            
            
            ])
    }
}
