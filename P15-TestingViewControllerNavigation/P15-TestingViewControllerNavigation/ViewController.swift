//
//  ViewController.swift
//  P15-TestingViewControllerNavigation
//
//  Created by Yuriy Gudimov on 17.01.25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextViewButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

