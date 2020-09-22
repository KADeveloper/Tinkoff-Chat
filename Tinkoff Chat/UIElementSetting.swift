//
//  UIElementSetting.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 20.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

extension UILabel {
    func labelSettings(textAlignment: NSTextAlignment, font: UIFont, textColor: UIColor, numberOfLines: Int, text: String, cornerRadius: CGFloat) {
        self.textAlignment = textAlignment
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.text = text
        self.layer.cornerRadius = cornerRadius
    }
}

extension UIButton {
    func buttonSettings(title: String, textAlignment: NSTextAlignment, titleType: UIControl.State, textColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, clipsToBounds: Bool) {
        self.setTitle(title, for: titleType)
        self.titleLabel?.textAlignment = textAlignment
        self.titleLabel?.textColor = textColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }
}

extension UIImageView {
    func imageViewSettings(cornerRadius: CGFloat, contentMode: UIView.ContentMode, backgroundColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.backgroundColor = backgroundColor
    }
}
