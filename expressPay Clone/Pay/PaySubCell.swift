//
//  PaySubCell.swift
//  expressPay Clone
//
//  Created by mac on 05/08/2022.
//

import UIKit

class PaySubCell: UITableViewCell {
    
    static let identifier = "PaySubCell"
    
    
    var imgView: UIImageView = {
        let image = UIImageView()
        
        image.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        image.layer.cornerRadius =   image.frame.size.width / 2
        image.clipsToBounds = true
        
        return image
    }()
    
  
    
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir", size: 14)
        //label.font = UIFont.boldSystemFont(ofSize: 16)
      //  label.textAlignment = .center
        
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .lightGray
        
        return label
    
    }()
    
    var mainView: UIView = {
        let view = UIView()
       
        //view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
     
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.1
        
        
        
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainView)
        mainView.addSubview(imgView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(subtitleLabel)
        
        
        setupConstrains()
      
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
          
            
            mainView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            mainView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            mainView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            mainView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            imgView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 8),
            imgView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
           // imgView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 40),
            imgView.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 8),
            
            subtitleLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 8),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2)
            
       
            
            
            ])
    }

}
