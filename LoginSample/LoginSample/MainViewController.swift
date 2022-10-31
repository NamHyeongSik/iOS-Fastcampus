//
//  MainViewController.swift
//  LoginSample
//
//  Created by HYEONG SIK NAM on 2022/05/10.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomeLabel.text = """
환영합니다.
\(email) 님
"""
        
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        
        resetPasswordButton.isHidden = !isEmailSignIn
    }

    @IBAction func logout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error)
        }
        
    }
    
    @IBAction func tabResetPasswordButton(_ sender: UIButton) {
        guard let email = Auth.auth().currentUser?.email else { return }
        
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
}
