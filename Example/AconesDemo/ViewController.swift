//
//  ViewController.swift
//  AconesDemo
//
//  Created by Andy Shaw on 2024/8/6.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var icon: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        Acones.shared.fetchIcon(named: "ic:baseline-attractions") { [weak self] image in
            self?.icon?.image = image
        }
    }


}

