//
//  UITextFieldExtension.swift
//  UITextFieldExtension
//
//  Created by naoki-mrnk on 2021/09/01.
//

import UIKit

extension UITextField {
    func setUnderLine() {
        borderStyle = .none
        let border = UIView()
        border.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 0.5)
        border.backgroundColor = .lightGray
        addSubview(border)
        bringSubviewToFront(border)
    }
}
