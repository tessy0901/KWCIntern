//
//  PhoneNunberViewController.swift
//  KWCIntern
//
//  Created by 手嶋慧太 on 2020/01/21.
//  Copyright © 2020 手嶋慧太. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class PhoneNunberViewController: UIViewController {
    var docRef: DocumentReference!

    @IBOutlet weak var phoneNumberText: UITextField!
    @IBAction func onButtonTapped(_ sender: Any) {
//        let dataToSave: [String: Any] = ["test1": "test1", "test2": "test2"]
//        docRef.setData(dataToSave) { (error) in
//            if let error = error {
//                print("error")
//            } else {
//                print("saved")
//            }
//        }
        guard let phoneNumber = phoneNumberText.text, !phoneNumber.isEmpty else {return}
        let dataToSave: [String: Any] = ["phone": phoneNumber]
        docRef.setData(dataToSave) { (error) in
            if let error = error {
                print("error")
            } else {
                print("success")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID: String = Auth.auth().currentUser!.uid
        docRef = Firestore.firestore().document("Users/\(userID)")
        
//        docRef = db.Collection("users").addDocument(data: [
//            "firest":"Ada",
//            "last":"Lovelace",
//            "born":1815
//        ]) { err in
//            if let err = err {
//                print("error")
//            } else {
//                print("success")
//            }
//        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
