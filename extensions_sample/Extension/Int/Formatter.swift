//
//  Formatter.swift
//  extensions_sample
//
//  Created by 及川ひな on 2018/10/15.
//  Copyright © 2018年 pippi. All rights reserved.
//

import Foundation
extension Int {
    /* 使う場面: いいねや再生数を「K」や「M」で表示したい時
     * let number: Int = 150000
     * number.shortValue
    */
    var shortValue: String {
        let k: Double = 1000
        let m: Double = 1000000
        let value = Double(self)

        if value >= k && value < m {
            let double = (value/k).rounded(toPlaces: 1)
            return  String(format:"%g", double) + "k"
        } else if value >= m {
            let double = (value/m).rounded(toPlaces: 1)
            return String(format:"%g", double) + "m"
        }
        return "\(self)"
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
