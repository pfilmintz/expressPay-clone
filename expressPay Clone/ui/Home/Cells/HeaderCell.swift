//
//  HeaderCell.swift
//  expressPay Clone
//
//  Created by mac on 01/08/2022.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    static let identifier = "HeaderCell"
    
    var headerlabel: UILabel = {
        
        let headerlabel = UILabel()
        
        headerlabel.font = UIFont(name:"Avenir",size:15)
       // headerlabel.font = headerlabel.font.withSize(15)
        return headerlabel
        
    }()
    
    var headerlabel2: UILabel = {
        
        let headerlabel = UILabel()
        
        headerlabel.font = UIFont(name:"Avenir",size:15)
       // headerlabel.font = headerlabel.font.withSize(15)
        return headerlabel
        
    }()
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.addSubview(headerlabel)
        contentView.addSubview(headerlabel2)
        
        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        
       
        
        headerlabel.translatesAutoresizingMaskIntoConstraints = false
        headerlabel2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        
            headerlabel.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 15),
            headerlabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            headerlabel2.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            headerlabel2.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
            
            
        ])
        
        
        
    }
}
