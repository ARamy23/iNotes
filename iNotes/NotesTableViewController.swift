//
//  NotesTableViewController.swift
//  iNotes
//
//  Created by Ahmed Ramy on 2/6/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

struct NotesModel
{
    var titleString : String?
    var bodyString : String?
    var bgColor : UIColor?
}

class NotesTableViewController: UITableViewController {
    //Outlets
    @IBOutlet var notesTableView: UITableView!
    //Variables
    var notes : [NotesModel] = [NotesModel]()
    var titleStringRecieved : String?
    var bodyStringRecieved : String?
    var bgColorRecieved : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        if let newTitleStringRecieved = titleStringRecieved , let newBodyStringRecieved = bodyStringRecieved ,let newBGColorRecieved = bgColorRecieved
        {
            let newNote = NotesModel(titleString: newTitleStringRecieved, bodyString: newBodyStringRecieved, bgColor: newBGColorRecieved)
            notes.append(newNote)
            notesTableView.insertRows(
                            at:[IndexPath(row: notes.count - 1, section: 0)],
                            with: UITableViewRowAnimation.automatic)
        }
    }
    
    func initData()
    {
        notesTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteTableViewCell")
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as! NoteTableViewCell
        cell.setModel(model: notes[indexPath.row])
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
