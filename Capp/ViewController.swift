//
//  ViewController.swift
//  Capp
//
//  Created by COFFEE on 2016/10/29.
//  Copyright © 2016年 COFFEE. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController,MainBridgeDelegate {
    
    var bridge:MainBridge!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bridge = MainBridge(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClick(_ sender: Any) {
        bridge.onClick()
    }
    
    public func dismiss() {
        print(#function)
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showDiarog(){
        print(#function)
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func connect(_ callback: MainBridgeDelegateConnectCallback!) {
        print(#function)
        callback()
    }
 
    
    func playSound(){
        print(#function)

    }

}

