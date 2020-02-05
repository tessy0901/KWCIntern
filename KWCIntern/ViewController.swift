//
//  ViewController.swift
//  KWCIntern
//
//  Created by 手嶋慧太 on 2020/01/20.
//  Copyright © 2020 手嶋慧太. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle!
    @IBOutlet weak var inputMailText: UITextField!
    @IBOutlet weak var inputPassText: UITextField!
    @IBAction func inputMailText(_ sender: UITextField) {
        inputMailText.text = sender.text
        print(inputMailText.text as Any)
    }
    @IBAction func inputPassText(_ sender: UITextField) {
        inputPassText.text = sender.text
        print(inputPassText.text as Any)
    }
    @IBAction func onButtonTappedSignIn(_ sender: Any) {
        guard let email = inputMailText.text, let pass = inputPassText.text else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if (user != nil && error == nil) {
                print("signIn successed")
                let storyboard: UIStoryboard = UIStoryboard(name: "PhoneNunber", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController()
                self.present(viewController!, animated: true, completion: nil)
            } else {
                print("user not found")
            }
        }
    }
    @IBAction func onButtonTappedSignUp(_ sender: Any) {
        guard let email = inputMailText.text, let pass = inputPassText.text else {
            return
        }

        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            if (user != nil && error == nil) {
                print("signUp successed")
                self.inputMailText.text = ""
                self.inputPassText.text = ""
            } else {
                print("signUp failed")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputMailText.delegate = self as? UITextFieldDelegate
        self.inputPassText.delegate = self as? UITextFieldDelegate
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(true)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}

