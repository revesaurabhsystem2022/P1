//
//  HomeViewController.swift
//  P1
//
//  Created by reveantivirus on 17/01/26.
//

import Foundation
import UIKit


class HomeViewController : UIViewController {
    
    @IBOutlet weak var welcomeLabel : UILabel!
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = viewModel.welcomeText
    }
    
    @IBAction func logoutTapped(_ sender: UIButton) {
        AuthManager.shared.logout()
    }
    
}
