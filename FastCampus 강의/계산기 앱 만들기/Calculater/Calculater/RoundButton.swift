//
//  RoundButton.swift
//  Calculater
//
//  Created by ryu hyunsun on 2022/06/30.
//

import UIKit


@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound == true {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
