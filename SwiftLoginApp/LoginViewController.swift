//
//  LoginViewController.swift
//  SwiftLoginApp
//
//  Created by Natsumo Ikeda on 2016/05/09.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class LoginViewController: UIViewController {
    // User Name
    @IBOutlet weak var userNameTextField: UITextField!
    // Password
    @IBOutlet weak var passwordTextField: UITextField!
    // errorLabel
    @IBOutlet weak var errorLabel: UILabel!
    
    // 画面表示時に実行される
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTextField.secureTextEntry = true
        self.errorLabel.text = ""
    }
    
    // 背景タップするとキーボードを隠す
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // Loginボタン押下時の処理
    @IBAction func loginBtn(sender: UIButton) {
        // キーボードを閉じる
        passwordTextField.resignFirstResponder()
        
        // 入力確認
        if self.userNameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty {
            self.errorLabel.text = "未入力の項目があります"
            return
        }
        
        // ユーザー名とパスワードでログイン
        NCMBUser.logInWithUsernameInBackground(self.userNameTextField.text, password: self.passwordTextField.text, block:{(user: NCMBUser?, error: NSError!) in
            if error != nil {
                self.userNameTextField.text = ""
                self.passwordTextField.text = ""
                
                // ログイン失敗時の処理
                self.errorLabel.text = "ログインに失敗しました:\(error.code)"
                NSLog("ログインに失敗しました:\(error.code)")
                
            }else{
                // ログイン成功時の処理
                self.performSegueWithIdentifier("login", sender: self)
                NSLog("ログインに成功しました:\(user?.objectId)")
                
            }
        })
    }
    
    // SignUp画面へ遷移
    @IBAction func toSignUp(sender: UIButton) {
        // キーボードを閉じる
        passwordTextField.resignFirstResponder()
        
        self.performSegueWithIdentifier("LtoS", sender: self)
    }
}