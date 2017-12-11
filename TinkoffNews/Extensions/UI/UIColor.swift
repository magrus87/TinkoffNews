//
//  UIColor.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 65apps. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(netHex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((netHex >> 16) & 0xff)
        let green = CGFloat((netHex >> 8) & 0xff)
        let blue = CGFloat(netHex & 0xff)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
