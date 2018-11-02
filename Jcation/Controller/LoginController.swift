//
//  LoginController.swift
//  Jcation
//
//  Created by Jason Parker on 2018-11-01.
//  Copyright © 2018 Jason Parker. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    let inputsContainerView = UIView()
    
    let loginRegisterButton = UIButton(type: .system)
    
    let nameTextField = UITextField()
    
    let nameSeperatorView = UIView()
    
    let emailAddressTextField = UITextField()
    
    let emailAddressSeperatorView = UIView()
    
    let passwordTextField = UITextField()
    
    let profileImageView = UIImageView()
    
    let loginRegisterSegmentedController: UISegmentedControl = UISegmentedControl(items: ["Login","Register"])
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    var emailAddressTextFieldHeightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(loginRegisterSegmentedController)
        view.addSubview(profileImageView)
        setupInputsContainerView()
        setuploginRegisterButton()
        setuploginRegisterSegmentedController()
        setupprofileImageView()
        NotificationCenter.default.addObserver(self, selector: #selector(viewMoveUp), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(viewMoveDown), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    @objc func viewMoveUp() {
        view.frame.origin.y -= 200
    }
    
    @objc func viewMoveDown() {
        view.frame.origin.y += 200
    }
    
    func setuploginRegisterSegmentedController() {
        loginRegisterSegmentedController.addTarget(self, action: #selector(handleLoginRegisterChange), for: UIControl.Event.valueChanged)
        loginRegisterSegmentedController.tintColor = UIColor(r: 37, g: 160, b: 250)
        loginRegisterSegmentedController.translatesAutoresizingMaskIntoConstraints = false
        loginRegisterSegmentedController.selectedSegmentIndex = 1
        loginRegisterSegmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedController.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedController.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedController.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupInputsContainerView() {
        inputsContainerView.backgroundColor = UIColor.white
        inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
        inputsContainerView.layer.cornerRadius = 5
        inputsContainerView.layer.masksToBounds = true
        
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeperatorView)
        inputsContainerView.addSubview(emailAddressTextField)
        inputsContainerView.addSubview(emailAddressSeperatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        setupnameTextField()
        setupnameSeperatorView()
        setupemailAddressTextField()
        setupemailAddressSeperator()
        setuppasswordTextField()
    }
    
    func setuploginRegisterButton() {
        loginRegisterButton.backgroundColor = UIColor(r: 37, g: 160, b: 250)
        loginRegisterButton.setTitle("Register", for: .normal)
        loginRegisterButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginRegisterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginRegisterButton.layer.cornerRadius = 5
        loginRegisterButton.layer.masksToBounds = true
        loginRegisterButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupnameTextField() {
        nameTextField.placeholder = "Name"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.returnKeyType = UIReturnKeyType.done
        
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
    }
    
    func setupnameSeperatorView() {
        nameSeperatorView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        nameSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupemailAddressTextField() {
        emailAddressTextField.placeholder = "Email Address"
        emailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        emailAddressTextField.returnKeyType = UIReturnKeyType.done
        emailAddressTextField.keyboardType = UIKeyboardType.emailAddress
        
        emailAddressTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailAddressTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailAddressTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailAddressTextFieldHeightAnchor = emailAddressTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        emailAddressTextFieldHeightAnchor?.isActive = true
    }
    
    func setupemailAddressSeperator() {
        emailAddressSeperatorView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        emailAddressSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        
        emailAddressSeperatorView.topAnchor.constraint(equalTo: emailAddressTextField.bottomAnchor).isActive = true
        emailAddressSeperatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailAddressSeperatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailAddressSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setuppasswordTextField() {
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.returnKeyType = UIReturnKeyType.done
        
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailAddressTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    func setupprofileImageView() {
        profileImageView.image = UIImage(named: "ProfileImage")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedController.topAnchor, constant: -60).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        emailAddressTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
}

extension UIColor {
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
