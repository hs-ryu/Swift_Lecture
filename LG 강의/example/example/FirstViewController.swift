//
//  FirstViewController.swift
//  example
//
//  Created by ryu hyunsun on 2023/09/14.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var txtfield: UITextField!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func click1(_ sender: Any) {
        label.text = txtfield.text
    }
    
    @IBAction func click2(_ sender: Any) {
        let rc = UIScreen.main.bounds
        
        imgView1.center.x = rc.width
        
        UIView.animate(withDuration: 1, animations: { self.imgView1.center.x = 0 })
    }
    
    @IBAction func click3(_ sender: Any) {
        self.view.addSubview(imgView2)
        
        let rc = UIScreen.main.bounds

        imgView2.center.y = rc.height/2 + 200
        imgView2.center.x = rc.width
        
        UIView.animate(withDuration: 1, animations: { self.imgView2.center.x = 0 }, completion: { _ in self.imgView2.removeFromSuperview()})
        
        // () -> Void : { }
        // ((Bool) -> Void) : {(finish:Bool) -> Void in }
        // ((Bool) -> Void) : { _ in }
        
        
        
    }
    
    @IBAction func click4(_ sender: Any) {
        let img = UIImage(systemName: "pencil")
        let imgView3 = UIImageView(image: img)
        imgView3.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        self.view.addSubview(imgView3)
        
        let rc = UIScreen.main.bounds

        imgView3.center.y = rc.height/2 + 200
        imgView3.center.x = rc.width
        
        UIView.animate(withDuration: 1, animations: { imgView3.center.x = 0 }, completion: { _ in imgView3.removeFromSuperview()})
    }
    
    
}
