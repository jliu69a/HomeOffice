//
//  FI_HomeViewController.swift
//  MyHomeOffice
//
//  Created by Johnson Liu on 10/25/21.
//

import UIKit

class FI_HomeViewController: UIViewController {
    
    let helper = FI_Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        
        self.title = "Face ID"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //print("> device check : \(helper.checkBioMetricTypes()) ")
        
        helper.authenticationWithFaceID(vc: self) { (status: Bool) in
            print("> ")
            print("> is login success? \(status) ")
            print("> ")
        }
    }
}
