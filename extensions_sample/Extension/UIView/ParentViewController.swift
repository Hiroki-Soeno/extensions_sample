//
//  ParentViewController.swift
//  extensions_sample
//
//  Created by 及川ひな on 2018/10/18.
//  Copyright © 2018年 pippi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /* 使う場面: 親のViewControllerを取得したい時
     * let testView: UIView!
     * testView.parentViewController
     */
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }
}
