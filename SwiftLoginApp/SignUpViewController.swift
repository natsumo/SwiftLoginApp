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
    
    @IBOutlet weak var UserNameTextField2: UITextField! // User Name
    @IBOutlet weak var PasswordTextField2: UITextField! // Password
    @IBOutlet weak var errorLabel2: UILabel! // errorLabel
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PasswordTextField2.secureTextEntry = true
        errorLabel2.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpBtn(sender: UIButton) { // SignUpボタン押下時の距離
        // 入力確認
        if self.UserNameTextField2.text!.isEmpty || self.PasswordTextField2.text!.isEmpty {
            self.errorLabel2.text = "未入力の項目があります"
            return
        }
        //NCMBUserのインスタンスを作成
        let user = NCMBUser()
        //ユーザー名を設定
        user.userName = self.UserNameTextField2.text
        //パスワードを設定
        user.password = self.PasswordTextField2.text
        //会員の登録を行う
        user.signUpInBackgroundWithBlock({(error: NSError!) in
            if (error != nil){
                // 新規登録失敗時の処理
                self.errorLabel2.text = "ログインに失敗しました:\(error.code)"
                NSLog("ログインに失敗しました:\(error.code)")
                self.UserNameTextField2.text = ""
                self.PasswordTextField2.text = ""
            }else{
                // 新規登録成功時の処理
                self.performSegueWithIdentifier("signUp", sender: self)
                NSLog("ログインに成功しました:\(user.objectId)")
            }
        })
    }
    
}