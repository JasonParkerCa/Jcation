//
//  LoginController+handlers.swift
//  Jcation
//
//  Created by Jason Parker on 2018-11-01.
//  Copyright © 2018 Jason Parker. All rights reserved.
//

import UIKit

extension LoginController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @objc func handleLoginRegisterChange() {
        if loginRegisterSegmentedController.selectedSegmentIndex==0 {
            nameSeperatorView.removeFromSuperview()
        } else {
            view.addSubview(nameSeperatorView)
            setupnameSeperatorView()
        }
        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedController.selectedSegmentIndex==0 ? 100:150
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedController.selectedSegmentIndex==0 ? 0 : 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        emailAddressTextFieldHeightAnchor?.isActive = false
        emailAddressTextFieldHeightAnchor = emailAddressTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedController.selectedSegmentIndex==0 ? 1/2 : 1/3)
        emailAddressTextFieldHeightAnchor?.isActive = true
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedController.selectedSegmentIndex==0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        loginRegisterButton.setTitle(loginRegisterSegmentedController.selectedSegmentIndex==0 ? "Login" : "Register", for: .normal)
    }
    
}
