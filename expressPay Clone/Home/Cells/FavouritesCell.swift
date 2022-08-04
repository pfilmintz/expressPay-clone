//
//  FavouritesCell.swift
//  expressPay Clone
//
//  Created by mac on 01/08/2022.
//

import UIKit
import SwipeCellKit

class FavouritesCell: SwipeCollectionViewCell {
    
    static let identifier = "FavouritesCell"
    
    
    var imgView: UIImageView = {
        let image = UIImageView()
        
        image.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        image.layer.cornerRadius =   image.frame.size.width / 2
        image.clipsToBounds = true
        
        return image
    }()
    
    var menuImgView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "line.horizontal.3")
        image.tintColor = .lightGray
        image.clipsToBounds = true
        
        return image
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir", size: 16)
        //label.font = UIFont.boldSystemFont(ofSize: 16)
      //  label.textAlignment = .center
        
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 16)
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
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        
        contentView.addSubview(mainView)
        mainView.addSubview(imgView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(subtitleLabel)
        mainView.addSubview(menuImgView)
        

        
        
        setupConstrains()
        
    }
    
    func setupConstrains(){
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        menuImgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
          
            
            mainView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            imgView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 8),
            imgView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
           // imgView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 40),
            imgView.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 8),
            
            subtitleLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 8),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            
            menuImgView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -8),
            
          //  imgView.heightAnchor.constraint(equalToConstant: 40),
          //  imgView.widthAnchor.constraint(equalToConstant: 40),
            
            menuImgView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
            
            
            
            
            ])
    }
    
    
}
