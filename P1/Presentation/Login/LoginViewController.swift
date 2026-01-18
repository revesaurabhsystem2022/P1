//
//  LoginViewController.swift
//  P1
//
//  Created by reveantivirus on 17/01/26.
//

import Foundation
import UIKit



final class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    private let viewModel = LoginViewModel(authService: AuthService(),secureStorage: KeychainService.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        
        
        viewModel.onLoginSuccess = { [weak self] user in
            guard let self = self else {return}
            
            let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
            sceneDelegate?.setHomeAsRoot(user: user)
        }
        
        viewModel.onLoginFailure = { error in
            print("Login Failed = \(error)")
        }
        
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        viewModel.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    private func navigateToHome(user: User) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        homeVC.viewModel = HomeViewModel(user: user)
        let navController = UINavigationController(rootViewController: homeVC)
        
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    deinit {
        print("Login View Controller is Deallocated - No memory leaks")
    }
    
}


