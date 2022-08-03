//
//  NewPayCell.swift
//  expressPay Clone
//
//  Created by mac on 03/08/2022.
//

import UIKit

class NewPayCell: UITableViewCell {
    
    static let identifier = "NewPayCell"
    
    let mainView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8
        return view
        
    }()
    
    let namelabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.text = "+Pay for a new account"
        label.textColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        
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
        
        contentView.addSubview(mainView)
        mainView.addSubview(namelabel)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            mainView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            mainView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            mainView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            mainView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            namelabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            namelabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
            
            ])
        
    }

}
