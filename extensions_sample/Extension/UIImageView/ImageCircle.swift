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
  
    // 自分の環境だとメインスレッドでcornerRadiusを当てようとすると、過去に、一瞬表示がガチャつくことがありました。
    // もしそういった事象が発生する場合はimageView自体のサイズの確定を待たずに丸くしたimageを作成し
    // それを当てる以下のコードがお役にたつかもしれません。
    func applyRoundImage() {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        if imageView.frame.size.height > imageView.frame.size.width {
            imageView.frame.size.height = imageView.frame.size.width
        } else {
            imageView.frame.size.width = imageView.frame.size.height
        }
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        image = UIImage.screenshot(of: imageView)
    }
}
