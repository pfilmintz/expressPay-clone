//
//  FeaturedCells.swift
//  expressPay Clone
//
//  Created by mac on 01/08/2022.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    
    static let identifier = "FeaturedCell"
    
    var imgView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        image.layer.cornerRadius =   image.frame.size.width / 2
    //    image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 16)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    var mainView: UIView = {
        let view = UIView()
       
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        
        
        
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
            imgView.heightAnchor.constraint(equalToConstant: 50),
            imgView.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8),
            
            
            ])
    }
    
}
