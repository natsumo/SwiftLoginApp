//
//  ViewController.swift
//  SwiftLoginApp
//
//  Created by Natsumo Ikeda on 2016/04/22.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LogoutBtn(sender: UIButton) { // Logoutボタン押下時の処理
        NCMBUser.logOut()
        self.performSegueWithIdentifier("MtoL", sender: self)
        NSLog("ログアウトしました")
        
    }

}

