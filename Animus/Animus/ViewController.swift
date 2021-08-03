//
//  ViewController.swift
//  Peace
//
//  Created by Carolina Solis on 07/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mindfulmoon: UIButton!
    
    @IBOutlet weak var gratitudegrove: UIButton!
    
    @IBOutlet weak var relaxationriver: UIButton!
    
    @IBOutlet weak var imageisle: UIButton!
    
    @IBOutlet weak var positivityprairie: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ":)"
        // Do any additional setup after loading the view.
        mindfulmoon.layer.cornerRadius = 25.0
        gratitudegrove.layer.cornerRadius = 25.0
        relaxationriver.layer.cornerRadius = 25.0
        imageisle.layer.cornerRadius = 25.0
        positivityprairie.layer.cornerRadius = 25.0
    }


}

