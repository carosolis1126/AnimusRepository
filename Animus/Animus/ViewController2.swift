//
//  ViewController2.swift
//  Peace
//
//  Created by Carolina Solis on 07/21/21.
//

//import Foundation
import UIKit
import CoreData

extension UIViewController{
    func HideKeyboard(){
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
        }
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}

class ViewController2: UIViewController {

    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descTV: UITextView!
    
    var selectedNote: Note? = nil
    
    let date = Date()
    let dateFormatter = DateFormatter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        // Do any additional setup after loading the view.
        
        if(selectedNote != nil)
        {
            titleTF.text = selectedNote?.title
            descTV.text = selectedNote?.desc
        }
    }

    
    @IBAction func saveAction(_ sender: Any) {
        dateFormatter.dateFormat = "MM/dd/YY"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedNote == nil){
            let entity = NSEntityDescription.entity(forEntityName: "Journal", in: context)
            let newJournal = Note(entity: entity!, insertInto: context)
            newJournal.id = journalList.count as NSNumber
            newJournal.title = dateFormatter.string(from: date)
            newJournal.desc = descTV.text
            
            
            do
            {
                try context.save()
                journalList.append(newJournal)
                navigationController?.popViewController(animated:true)
            }
            catch
            {
                print("context save error")
            }
        }
        else //edit
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Journal")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results{
                    let note = result as! Note
                    if(note == selectedNote)
                    {
                        note.title = titleTF.text
                        note.desc = descTV.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            } catch {
                print("Fetch Failed")
            }
        }
        
    }
    
    
    @IBAction func deleteNote(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Journal")
        do {
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results{
                let note = result as! Note
                if(note == selectedNote)
                {
                    note.deletedDate = Date()
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }
            }
        } catch {
            print("Fetch Failed")
        }
    }
    
}


