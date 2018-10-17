//
//  Hexadecimal.swift
//  extensions_sample
//
//  Created by 及川ひな on 2018/10/17.
//  Copyright © 2018年 pippi. All rights reserved.
//

import Foundation
import UIKit

/* 使う場面: UIColorを16進数カラーコードで初期化する
 * hogeView.layer.backgroundColor = UIColor(hex: "FF00FF", alpha: 0.7)
 * hogeView.layer.backgroundColor = UIColor(hex: "FF00FF")
 */
extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        if hex.count == 6 {
            let rawValue: Int = Int(hex, radix: 16) ?? 0
            let B255: Int = rawValue % 256
            let G255: Int = ((rawValue - B255) / 256) % 256
            let R255: Int = ((rawValue - B255) / 256 - G255) / 256

            self.init(red: CGFloat(R255) / 255, green: CGFloat(G255) / 255, blue: CGFloat(B255) / 255, alpha: alpha)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
        }
    }
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
