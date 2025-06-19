//
//  SignInViewController.swift
//  Exakt.
//
//  Created by mac on 26/11/24.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var signInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        appleView.layer.cornerRadius = 28
        facebookView.layer.cornerRadius = 28
        googleView.layer.cornerRadius = 28

        appleView.layer.borderColor = UIColor.black.cgColor
        appleView.layer.borderWidth = 0.1

        facebookView.layer.borderColor = UIColor.black.cgColor
        facebookView.layer.borderWidth = 0.1

        googleView.layer.borderColor = UIColor.black.cgColor
        googleView.layer.borderWidth = 0.2
        signInView.layer.cornerRadius = 15
        emailTextField.layer.cornerRadius = 15
        passwordTxtField.layer.cornerRadius = 15
        
   
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        print("opressed")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")as! SignUpViewController
        navigationController?.pushViewController(vc, animated: true)
    }


}
