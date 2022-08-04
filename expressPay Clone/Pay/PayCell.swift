//
//  PayCell.swift
//  expressPay Clone
//
//  Created by mac on 03/08/2022.
//

import UIKit

class PayCell: UITableViewCell {
    
    static let identifier = "PayCell"
    
    var imgView: UIImageView = {
        let image = UIImageView()
        
        
        image.clipsToBounds = true
        
        return image
    }()
    
    var moreImgView: UIImageView = {
        let image = UIImageView()
      
        image.image = UIImage(systemName: "chevron.down")
        image.clipsToBounds = true
        image.tintColor = .lightGray
     //   image.backgroundColor = .red
        
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
    
    var newLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 10)
        label.textAlignment = .center
        label.text = "NEW"
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstrains()
      
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
        contentView.addSubview(imgView)
        contentView.addSubview(moreImgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(newLabel)
        
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        moreImgView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
          
            
            imgView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16),
       //     imgView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 8),
            
            imgView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            imgView.heightAnchor.constraint(equalToConstant: 30),
            imgView.widthAnchor.constraint(equalToConstant: 30),
            
            nameLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            
            
            moreImgView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            moreImgView.heightAnchor.constraint(equalToConstant: 20),
            moreImgView.widthAnchor.constraint(equalToConstant: 20),
            moreImgView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            newLabel.rightAnchor.constraint(equalTo: moreImgView.leftAnchor, constant: -16),
            newLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
            
            ])
        
    }

}
