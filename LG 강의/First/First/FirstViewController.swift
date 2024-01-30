//
//  FirstViewController.swift
//  First
//
//  Created by ryu hyunsun on 2023/09/06.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var msgLabel: UILabel!
    
    @IBAction func click() {
        msgLabel.text = "hello"
    }
    
}
