//
//  UIButtonExtension.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/01.
//

import UIKit

extension UIButton {
    func settingButton() {
        // 角丸
        layer.cornerRadius = 20
        // 影の濃さ
        layer.shadowOpacity = 0.3
        // 影のぼかしの大きさ
        layer.shadowRadius = 3
        // 影の色
        layer.shadowColor = UIColor.black.cgColor
        // 影の方向（width=右方向、height=下方向）
        layer.shadowOffset = CGSize(width: 3, height: 3)
    }
}
