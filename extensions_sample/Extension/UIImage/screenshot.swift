//
//  screenshot.swift
//  extensions_sample
//
//  Created by 添野紘生 on 2018/10/22.
//  Copyright © 2018 pippi. All rights reserved.
//

import UIKit

extension UIImage {
    // 指定したviewをUIImageとして取得することができます。
    static func screenshot(of view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.layer.frame.size, false, 0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return capturedImage
    }
}
