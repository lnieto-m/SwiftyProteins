//
//  LoginViewController.swift
//  Proteins
//
//  Created by Luis NIETO MUNOZ on 9/5/18.
//  Copyright © 2018 Luis NIETO MUNOZ. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    @IBOutlet weak var Log: UIButton!
    let authentificationContext = LAContext()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if id == "LigandsTableSegue" {
//                self.dismiss(animated: true, completion: nil)
                print("Soon")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var error: NSError?
        
        if !authentificationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            Log.isHidden = true
        }
    }

    func showAlertController(_message: String) {
        let alertController = UIAlertController(title: nil, message: _message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        
        authentificationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Hola", reply:
            {(success, error) in
                if success {
                    print("Success")
                    self.performSegue(withIdentifier: "LigandsTableSegue", sender: nil)
                } else {
                    self.showAlertController(_message: "Login Failed")
                    print("Failed")
                }
            })
        print("hello")
    }
}
