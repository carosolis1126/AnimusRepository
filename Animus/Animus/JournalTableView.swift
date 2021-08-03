import UIKit
import CoreData

var journalList = [Note]()

class JournalTableView: UITableViewController
{

    var firstLoad = true
    
    func nonDeletedNotes() -> [Note]
    {
        var noDeleteNoteList = [Note]()
        for note in journalList
        {
            if(note.deletedDate == nil)
            {
                noDeleteNoteList.append(note)
            }
            
        }
        
        return noDeleteNoteList
        
    }
    
    override func viewDidLoad() {
        if(firstLoad == true){
            print("FIRST LOAD")
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Journal")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results{
                    let note = result as! Note
                    journalList.append(note)
                }
            } catch {
                print("Fetch Failed")
            }
        }
        else if(firstLoad == false){
            print("FALSE")
        }
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let journalCell = tableView.dequeueReusableCell(withIdentifier: "journalCellID", for: indexPath) as! JournalCell
        
        let thisJournal: Note!
        thisJournal = nonDeletedNotes()[indexPath.row]
        journalCell.titleLabel.text = thisJournal.title
        journalCell.descLabel.text = thisJournal.desc
        
        
        return journalCell
        
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nonDeletedNotes().count
    }
    
    override func viewDidAppear(_ animated: Bool){
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.performSegue(withIdentifier: "editNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "editNote"){
            let indexPath = tableView.indexPathForSelectedRow!
            
            let noteDetail = segue.destination as? ViewController2
            
            let selectedNote : Note!
            selectedNote = nonDeletedNotes()[indexPath.row]
            noteDetail!.selectedNote = selectedNote
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

}
