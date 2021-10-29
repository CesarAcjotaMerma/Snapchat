//
//  ViewController.swift
//  Snapchat
//
//  Created by Cesar Augusto Acjota Merma on 10/27/21.
//  Copyright © 2021 deah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTExtField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var iniciarSesionButton: UIButton!
    
    @IBOutlet weak var btnGoogle: GIDSignInButton!
    
    //let config = GIDConfiguration(clientID: clientID)
    
    let signInConfig = GIDConfiguration.init(clientID:
    "371985792821-ri0lslkridtkr5v42g6a0fnb6tolcsl1.apps.googleusercontent.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        iniciarSesionButton.layer.cornerRadius = 10.0
        
        if GIDSignIn.sharedInstance.currentUser != nil {
            print("ERROR DE AUTH")
        }else{
            
            GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
               guard error == nil
                else {
                return
                }
            }
        }
        
       // GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }
    
    @IBAction func IniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTExtField.text!, password: passwordTextField.text!){ (user, error) in
            print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error: \(String(describing: error))")
            }else{
                print("Inicio de sesion exitoso")
            }
        }
    }
    
    @IBAction func googleTapped(_ sender: Any) {
        //371985792821-ri0lslkridtkr5v42g6a0fnb6tolcsl1.apps.googleusercontent.com
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
           guard error == nil
            else {
            return
            }
        }
    }
    
//    func sign(_ signIn: GIDSignIn!, didSignFor user: GIDGoogleUser!, withError error: Error!){
//        if error != nil &&
//            print("User Email: \(user.profile!.email)")
//    }
    
}
