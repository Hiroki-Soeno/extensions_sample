//
//  tableView.swift
//  extensions_sample
//
//  Created by 及川ひな on 2018/10/19.
//  Copyright © 2018年 pippi. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {


    /// 代入される変数に設定した型のセルを返す。
    /// cellに設定したidentifierがCellの型名と同じ場合に使用できる。
    ///
    /// - parameter indexPath: NSIndexPath
    /// - returns: <T: UITableViewCell>
    ///
    func dequeueReusableCellWithType<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
    }

    func dequeueReusableCellWithType<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: "\(T.self)") as! T
    }


    /// 代入される変数に設定した型のセルを返す。
    /// cellに設定したidentifierがCellの型名と同じ場合に使用できる。
    ///
    /// - parameter indexPath: NSIndexPath
    /// - returns: <T: UITableViewCell>
    ///
    func cellForRowAtIndexPath<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        return cellForRow(at: indexPath) as! T
    }


    /// 指定した型のセルを登録する。
    /// cellに設定したidentifierがCellの型名と同じ場合に使用できる。
    ///
    /// - parameter type: <T: UITableViewCell>
    ///
    func registerNibWithType<T: UITableViewCell>(_ type: T.Type) {
        let name = "\(type.self)"
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
}
