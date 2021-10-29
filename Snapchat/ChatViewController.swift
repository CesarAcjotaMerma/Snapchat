//
//  ChatViewController.swift
//  Snapchat
//
//  Created by Cesar Augusto Acjota Merma on 10/28/21.
//  Copyright © 2021 deah. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChatViewController: UIViewController {

    @IBOutlet weak var MessageField: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    @IBAction func btnSendTab(_ sender: Any) {
        let datos = ["idc1": ["title": "soccer", "topics" :["idt1": true,"idt2":true]], "idc2" :["title": "Moon", "topics": ["idt2": true]]];
        //ref.child("categories").setValue(["title" : self.MessageField.text])
        ref.child("categories").setValue(datos)
    }
    
//    private func messageObserver(){
//        ref.child("categories").observe(.childChanged){(snapshot) in if let value = snapshot.value as }
//        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
