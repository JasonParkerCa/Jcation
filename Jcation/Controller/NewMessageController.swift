//
//  NewMessageController.swift
//  Jcation
//
//  Created by Jason Parker on 2018-11-01.
//  Copyright © 2018 Jason Parker. All rights reserved.
//

import UIKit

class NewMessageController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
    }
    
}
