//
//  ImageCircle.swift
//  extensions_sample
//
//  Created by 及川ひな on 2018/10/22.
//  Copyright © 2018年 pippi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    /* 使う場面: 画像を丸くしたい時
     * let imageView: UIImageView!
     * imageView.circle()
     */
    func circle() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.size.height / 2
            self.clipsToBounds = true
        }
    }
}
