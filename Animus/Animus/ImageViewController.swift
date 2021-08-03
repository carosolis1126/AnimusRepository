//
//  ImageViewController.swift
//  Peace
//
//  Created by Carolina Solis on 07/12/21.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var picturegenerated: UIImageView!
    
    @IBAction func generatepic(_ sender: Any) {
        
        let randomnumber = Int.random(in: 1...3) //generate random number between 2 and 14 inclusive
        
        //update image views
        picturegenerated.image = UIImage(named: "pic\(randomnumber)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
