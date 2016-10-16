//
//  CLLabel.swift
//  PaketQ
//
//  Created by Joni Cong on 10/16/16.
//  Copyright © 2016 JoniceLAB. All rights reserved.
//

import UIKit

class CLLabel: UILabel {
    
    public var edgeInsets =  UIEdgeInsetsMake(0, 0, 0, 0) // default edge insets
    
    override func layoutSubviews() {
        if self.numberOfLines == 0 {
            let w = self.frame.width - edgeInsets.left - edgeInsets.right
            self.preferredMaxLayoutWidth = w
        }
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func drawText(in rect: CGRect) {
        return super.drawText(in: UIEdgeInsetsInsetRect(rect, edgeInsets))
    }
    
    override public var intrinsicContentSize: CGSize {
        
        if self.text?.characters.count == 0 || self.text == nil {
            self.isHidden = true
            return CGSize.zero
        }
        
        self.isHidden = false
        
        var size = super.intrinsicContentSize
        
        size.width += edgeInsets.left + edgeInsets.right;
        size.height += edgeInsets.top + edgeInsets.bottom
        
        return size
    }
}
