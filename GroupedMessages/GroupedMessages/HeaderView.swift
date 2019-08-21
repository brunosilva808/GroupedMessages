//
//  HeaderView.swift
//  GroupedMessages
//
//  Created by Bruno Silva on 21/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.boldSystemFont(ofSize: 14)
        textAlignment = .center
        backgroundColor = .red
    }
    
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
}

class HeaderView: UIView {
    
    fileprivate let label = DateHeaderLabel()
    var dateString: String! {
        didSet {
            label.text = dateString
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
