//
//  FeaturedSectionBackgroundDecorationView.swift
//  expressPay Clone
//
//  Created by mac on 01/08/2022.
//

import Foundation
import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {
    
    static let identifier = "SectionBackgroundDecorationView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.7014416827)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



