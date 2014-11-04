//
//  ProductCollectionViewCell.swift
//  SwiftApp
//
//  Created by Israel Roth on 11/2/14.
//  Copyright (c) 2014 Israel Roth. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purpleColor()
        let textFrame = CGRect(x: 0, y: 32, width: frame.size.width, height: frame.size.height/3)
        textLabel = UILabel(frame: textFrame)
        textLabel.font = UIFont.boldSystemFontOfSize(18.0)
        textLabel.textColor = UIColor.whiteColor()
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
    }

}
