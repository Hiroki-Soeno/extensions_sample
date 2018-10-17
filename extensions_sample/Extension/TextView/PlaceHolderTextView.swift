//
//  PlaceHolderTextView.swift
//  extensions_sample
//
//  Created by 及川ひな on 2018/10/16.
//  Copyright © 2018年 pippi. All rights reserved.
//

import Foundation
import UIKit

/* 使う場面: TextViewにPlaceHolderを表示させたい
 * StoryboardからTextViewのcustom_classに「PlaceHolderTextView」を設定
 * @IBOutlet weak var textView: PlaceHolderTextView!
 * textView.placeHolderLabel.text = "hogehoge"
 */
@IBDesignable class PlaceHolderTextView: UITextView {
    private lazy var placeHolderLabel: UILabel = UILabel()

    private func configurePlaceHolder() {
        self.placeHolderLabel.lineBreakMode = .byWordWrapping
        self.placeHolderLabel.font = self.font
        self.placeHolderLabel.textColor = UIColor(red: 0.0,
                                                  green: 0.0,
                                                  blue: 0.0980392,
                                                  alpha: 0.22)
        self.placeHolderLabel.backgroundColor = .clear
        self.placeHolderLabel.numberOfLines = 0
        self.placeHolderLabel.adjustsFontSizeToFitWidth = true

        self.addSubview(self.placeHolderLabel)

        self.setPlaceHolderConstraints()
    }

    private func setPlaceHolderConstraints() {
        let constantMargin: CGFloat = 8.0

        var topTargetAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>
        var leftTargetAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>
        var rightTargetAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>

        if #available(iOS 11.0, *) {
            topTargetAnchor = self.safeAreaLayoutGuide.topAnchor
            leftTargetAnchor = self.safeAreaLayoutGuide.leftAnchor
            rightTargetAnchor = self.safeAreaLayoutGuide.rightAnchor
        } else {
            topTargetAnchor = self.topAnchor
            leftTargetAnchor = self.leftAnchor
            rightTargetAnchor = self.rightAnchor
        }

        self.placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.placeHolderLabel.topAnchor.constraint(equalTo: topTargetAnchor, constant: constantMargin).isActive = true
        self.placeHolderLabel.leftAnchor.constraint(equalTo: leftTargetAnchor, constant: constantMargin).isActive = true
        self.placeHolderLabel.rightAnchor.constraint(equalTo: rightTargetAnchor, constant: -constantMargin).isActive = true
    }

    func configureBorder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    }

    private func changeVisiblePlaceHolder() {
        if !self.text.isEmpty {
            self.placeHolderLabel.alpha = 0.0
        } else {
            self.placeHolderLabel.alpha = 1.0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.configurePlaceHolder()
        self.changeVisiblePlaceHolder()
        self.configureBorder()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.textChanged),
                                               name: UITextView.textDidChangeNotification,
                                               object: nil)
    }

    @objc private func textChanged(notification: NSNotification?) {
        self.changeVisiblePlaceHolder()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @IBInspectable var placeHolder: String = "" {
        didSet {
            self.placeHolderLabel.text = self.placeHolder
        }
    }
}

