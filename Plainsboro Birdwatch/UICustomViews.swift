//
//  UICustomViews.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 2/3/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import Foundation
import UIKit

let monthColors: [String: UIColor] = [
    "January" : UIColor(displayP3Red: 0.898, green: 0.988, blue: 1, alpha: 1),
    "February": UIColor(displayP3Red: 1, green: 0.91, blue: 0.91, alpha: 1),
    "March": UIColor(displayP3Red: 0.843, green: 1, blue: 0.839, alpha: 1),
    "April": UIColor(displayP3Red: 0.976, green: 0.918, blue: 1, alpha: 1),
    "May": UIColor(displayP3Red: 0.733, green: 0.82, blue: 0.686, alpha: 1),
    "June": UIColor(displayP3Red: 1, green: 0.996, blue: 0.776, alpha: 1),
    "July": UIColor(displayP3Red: 0.757, green: 0.839, blue: 0.957, alpha: 1),
    "August": UIColor(displayP3Red: 0.847, green: 0.584, blue: 0.584, alpha: 1),
    "September": UIColor(displayP3Red: 0.549, green: 0.549, blue: 0.549, alpha: 1),
    "October": UIColor(displayP3Red: 1, green: 0.769, blue: 0.486, alpha: 1),
    "November": UIColor(displayP3Red: 0.839, green: 0.757, blue: 0.635, alpha: 1),
    "December": UIColor(displayP3Red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
]

class MenuButton: UITabBarItem {
    public weak var actionPageView: UIView!;
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
