//
//  SignUpViewController.swift
//  SwiftLoginApp
//
//  Created by Natsumo Ikeda on 2016/04/22.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class SignUpViewController: UIViewController {
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
    // SignUpボタン押下時の距離
    @IBAction func signUpBtn(sender: UIButton) {
        // 入力確認
        if self.userNameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty {
            self.errorLabel.text = "未入力の項目があります"
            return
        }
        //NCMBUserのインスタンスを作成
        let user = NCMBUser()
        //ユーザー名を設定
        user.userName = self.userNameTextField.text
        //パスワードを設定
        user.password = self.passwordTextField.text
        //会員の登録を行う
        user.signUpInBackgroundWithBlock{(error: NSError!) in
            if error != nil {
                // 新規登録失敗時の処理
                self.errorLabel.text = "ログインに失敗しました:\(error.code)"
                NSLog("ログインに失敗しました:\(error.code)")
                self.userNameTextField.text = ""
                self.passwordTextField.text = ""
            }else{
                // 新規登録成功時の処理
                self.performSegueWithIdentifier("signUp", sender: self)
                NSLog("ログインに成功しました:\(user.objectId)")
            }
        }
    }
}