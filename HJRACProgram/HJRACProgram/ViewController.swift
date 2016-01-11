//
//  ViewController.swift
//  HJRACProgram
//
//  Created by jixuhui on 16/1/11.
//  Copyright © 2016年 Hubbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField = UITextField(frame: CGRect(origin: CGPointZero, size: CGSize(width: 100, height: 40)))
        textField.backgroundColor  = UIColor.lightGrayColor()
        textField.center = self.view.center
        self.view.addSubview(textField)
        
        self.oneSignalSet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func oneSignalSet() {
        textField.rac_textSignal().map({ (text:AnyObject!) -> AnyObject! in
            let value = text as! String
            return Int(value.characters.count)
        }).filter { (text:AnyObject!) -> Bool in
            if let value = text as? Int {
                return value >= 3
            }else {
                return false
            }
            }.subscribeNext { (x:AnyObject!) -> Void in
                print("\(x)")
        }
    }

    func otherSignalSet() {
        let sourceSignal = textField.rac_textSignal()
        let filterSignal = sourceSignal.filter { (text:AnyObject!) -> Bool in
            if let value = text as? String {
                return value.characters.count > 3
            }else {
                return false
            }
        }
        filterSignal.subscribeNext { (x:AnyObject!) -> Void in
            print("\(x)")
        }
    }
}

