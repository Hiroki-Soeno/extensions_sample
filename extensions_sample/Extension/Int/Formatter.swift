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
        let kilo: Int = 1_000
        let mega: Int = 1_000_000

        switch self {
        case (0..<kilo):    return String(format: "%d", self)
        case (kilo..<mega): return String(format: "%.1fk", Double(self) / Double(kilo))
        default:            return String(format: "%.1fm", Double(self) / Double(mega))
        }
    }
}
