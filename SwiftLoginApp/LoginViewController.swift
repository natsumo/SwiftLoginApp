//
//  LoginViewController.swift
//  SwiftLoginApp
//
//  Created by Natsumo Ikeda on 2016/04/22.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UserNameTextField: UITextField! // User Name
    @IBOutlet weak var PasswordTextField: UITextField! // Password
    @IBOutlet weak var errorLabel: UILabel! // errorLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PasswordTextField.secureTextEntry = true
        errorLabel.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginBtn(sender: UIButton) { // Loginボタン押下時の処理
        // 入力確認
        if self.UserNameTextField.text!.isEmpty || self.PasswordTextField.text!.isEmpty {
            self.errorLabel.text = "未入力の項目があります"
            return
        }
        // ユーザー名とパスワードでログイン
        NCMBUser.logInWithUsernameInBackground(self.UserNameTextField.text, password: self.PasswordTextField.text, block:({(user: NCMBUser?, error: NSError!) in
            if (error != nil){
                // ログイン失敗時の処理
                self.errorLabel.text = "ログインに失敗しました:\(error.code)"
                NSLog("ログインに失敗しました:\(error.code)")
                self.UserNameTextField.text = ""
                self.PasswordTextField.text = ""
            }else{
                // ログイン成功時の処理
                self.performSegueWithIdentifier("login", sender: self)
                NSLog("ログインに成功しました:\(user?.objectId)")
                
            }
        }))
    }
    @IBAction func toSignUp(sender: UIButton) { // SignUp画面へ遷移
        self.performSegueWithIdentifier("LtoS", sender: self)
    }
}