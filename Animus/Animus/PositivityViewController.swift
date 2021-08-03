//
//  PositivityViewController.swift
//  Peace
//
//  Created by Carolina Solis on 07/12/21.
//

import UIKit

class PositivityViewController: UIViewController {

    var fileArray = [""]
    

    @IBOutlet weak var positivityText: UITextView!
    @IBOutlet weak var positivitybutton: UIButton!
    @IBOutlet weak var goalsbutton: UIButton!
    
    
    //read affirmations txt file
    func readaffirmations(inputArray: Array<String>) -> Array<String> {
        let filePath = Bundle.main.path(forResource: "PositivityPraireAffirmations", ofType: "txt")!
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
    
    //read goals txt file
    func readgoals(inputArray: Array<String>) -> Array<String> {
        let filePath = Bundle.main.path(forResource: "PositivityPraireGoals", ofType: "txt")!
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
    
    //button for affirmations
    @IBAction func affirmations(_ sender: Any) {
        let filedata = readaffirmations(inputArray: fileArray)
        print(filedata)
        let length = filedata.count
        let randomnumber = Int.random(in: 0...length-1) //generate random number
        let textphrase = String(filedata[randomnumber])
        positivityText.text = textphrase
    }
    
    
    //button for goals
    @IBAction func goals(_ sender: Any) {
        let filedata = readgoals(inputArray: fileArray)
        print(filedata)
        let length = filedata.count
        let randomnumber = Int.random(in: 0...length-1) //generate random number
        let textphrase = String(filedata[randomnumber])
        positivityText.text = textphrase
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Positivity Prairie"
        positivityText.text = ""
        
        positivitybutton.layer.cornerRadius = 25.0
        goalsbutton.layer.cornerRadius = 25.0
        
        //make buttons round
        

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
