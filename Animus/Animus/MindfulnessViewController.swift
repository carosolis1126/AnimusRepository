//
//  MindfulnessViewController.swift
//  Peace
//
//  Created by Carolina Solis on 07/11/21.
//

import UIKit

class MindfulnessViewController: UIViewController {

    var fileArray = [""]
    

    @IBOutlet weak var mindfulText: UITextView!
    
    func printLine(inputArray: Array<String>) -> Array<String> {
        let filePath = Bundle.main.path(forResource: "MindfulnessMoon", ofType: "txt")!
        var myCounter: Int
        var newArray = inputArray
        newArray.remove(at: 0)//removes initial empty space value from array
        do {
            let contents = try String(contentsOfFile: filePath)
            let lines = contents.split(separator:"\n")
            myCounter = lines.count //number of lines
            
            for n in 0...(myCounter - 1){
                newArray.append(String(lines[n]))
            }
        } catch {
            //return(error.localizedDescription)
        }
        return newArray //array with data in .txt file. Each line is a new item
    }
    
    @IBAction func mindfulbutton(_ sender: Any) {
        let filedata = printLine(inputArray: fileArray)
        print(filedata)
        let length = filedata.count
        let randomnumber = Int.random(in: 0...length-1) //generate random number
        let textphrase = String(filedata[randomnumber])
        mindfulText.text = textphrase
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mindful Moon"
        mindfulText.text = ""

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
