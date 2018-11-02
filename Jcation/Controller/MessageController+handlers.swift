//
//  MessageController+handlers.swift
//  Jcation
//
//  Created by Jason Parker on 2018-11-01.
//  Copyright © 2018 Jason Parker. All rights reserved.
//

import UIKit

extension MessageController {
    
    @objc func handleLogout() {
        let login = LoginController()
        present(login, animated: true, completion: nil)
    }
    
    @objc func toNewMessageController() {
        let newMessage = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessage)
        present(navController, animated: true, completion: nil)
    }
    
}
