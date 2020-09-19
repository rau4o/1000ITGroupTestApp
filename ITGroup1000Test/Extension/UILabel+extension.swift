//
//  UILabel+extension.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/19/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

extension UILabel {
    func addShadowLabel() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
}

