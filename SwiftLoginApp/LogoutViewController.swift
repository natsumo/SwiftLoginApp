//
//  LogoutViewController.swift
//  SwiftLoginApp
//
//  Created by Natsumo Ikeda on 2016/04/22.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class LogoutViewController: UIViewController {
    
    // Logoutボタン押下時の処理
    @IBAction func LogoutBtn(sender: UIButton) {
        NCMBUser.logOut()
        self.performSegueWithIdentifier("MtoL", sender: self)
        NSLog("ログアウトしました")
    }
}

