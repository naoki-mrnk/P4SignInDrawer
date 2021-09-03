//
//  SplitViewController.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/03.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(RealmManager.shared.load(User.self))
    }
}
