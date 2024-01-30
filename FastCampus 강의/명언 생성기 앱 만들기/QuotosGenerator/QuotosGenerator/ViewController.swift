//
//  ViewController.swift
//  QuotosGenerator
//
//  Created by ryu hyunsun on 2022/05/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var portLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let quotes = [
        Quote(contents: "쉽다 쉬워", name: "류현선"),
        Quote(contents: "별거 아냐", name: "류현선"),
        Quote(contents: "할 수 있어", name: "류현선"),
        Quote(contents: "재밌네 이거", name: "류현선")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TapButtonGenerator(_ sender: Any) {
        let random = Int(arc4random_uniform(4)) // 0~3 사이의 난수 생성
        let quote = quotes[random]
        self.portLabel.text = quote.name
        self.nameLabel.text = quote.contents
    }
    
}

