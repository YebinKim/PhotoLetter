//
//  Color.swift
//  PhotoLetter
//
//  Created by Yebin Kim on 2019/11/05.
//  Copyright © 2019 김예빈. All rights reserved.
//

import UIKit

enum UseColor {
    case backgroundUp
    case backgroundDown
    case shadow
}

extension UseColor {
    var value: UIColor {
        get {
            switch self {
            case .backgroundUp:
                return UIColor(red: 234/255, green: 236/255, blue: 237/255, alpha: 0.5)
            case .backgroundDown:
                return UIColor(red: 203/255, green: 204/255, blue: 205/255, alpha: 0.5)
            case .shadow:
                return UIColor(red: 73/255, green: 73/255, blue: 73/255, alpha: 1)
            }
        }
    }
}
