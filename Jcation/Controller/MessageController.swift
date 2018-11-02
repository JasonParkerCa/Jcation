//
//  ViewController.swift
//  Jcation
//
//  Created by Jason Parker on 2018-11-01.
//  Copyright © 2018 Jason Parker. All rights reserved.
//

import UIKit

class MessageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        let navigationRightButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(toNewMessageController))
        navigationItem.rightBarButtonItem = navigationRightButton
    }
    
}

