//
//  AddNewNoteViewController.swift
//  iNotes
//
//  Created by Ahmed Ramy on 2/6/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class AddNewNoteViewController: UIViewController , UITextViewDelegate {

    //outlets
    @IBOutlet weak var noteTitleTF: UITextField!
    @IBOutlet weak var noteTextTV: UITextView!
    @IBOutlet weak var colorsContainerView: UIView!
    @IBOutlet weak var blackColorBtn: UIButton!
    @IBOutlet weak var whiteColorBtn: UIButton!
    @IBOutlet weak var yellowColorBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    //variables
    var titleTextAcquired : String = ""
    var noteTextAcquired : String = ""
    var noteBGColor : UIColor = UIColor.white
    //objects
    let homeVC = NotesTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    @IBAction func DidFinishTypingInTF(_ sender: UITextField)
    {
        titleTextAcquired = noteTitleTF.text!
    }
    
    @IBAction func didChooseColor(_ sender: UIButton) {
        if(sender.tag == 1 || sender.tag == 2 || sender.tag == 3)
        {
            noteBGColor = sender.backgroundColor!
            noteTextTV.backgroundColor = noteBGColor
            noteTitleTF.backgroundColor = noteBGColor
            if(sender.tag == 1)
            {
                noteTextTV.textColor = UIColor.white
                noteTitleTF.textColor = UIColor.white
            }else
            {
                noteTextTV.textColor = UIColor.black
                noteTitleTF.textColor = UIColor.black
            }
        }
    }
    
    
    @IBAction func didTapSaveBtn(_ sender: UIButton)
    {
        noteTextAcquired = noteTextTV.text!
        
            
//            homeVC = navVC?.viewControllers.first as! NotesTableViewController
//            let newNote = NotesModel(titleString: titleTextAcquired, bodyString: noteTextAcquired, bgColor: noteBGColor)
//            homeVC.notes.append(newNote)
//            homeVC.notesTableView.insertRows(
//                at:[IndexPath(row: homeVC.notes.count - 1, section: 0)],
//                with: UITableViewRowAnimation.automatic)
        
        performSegue(withIdentifier: "gotohome", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NotesTableViewController
        {
            destination.titleStringRecieved = noteTitleTF.text
            destination.bodyStringRecieved = noteTextAcquired
            destination.bgColorRecieved = noteBGColor
        }
        
    }
    func updateUI()
    {
        noteTextTV.layer.cornerRadius = 5
        noteTextTV.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        noteTextTV.layer.borderWidth = 0.5
        noteTextTV.clipsToBounds = true
        
        colorsContainerView.layer.cornerRadius = 5
        
        blackColorBtn.layer.cornerRadius = blackColorBtn.frame.height / 2
        blackColorBtn.layer.cornerRadius = blackColorBtn.frame.height / 2
        whiteColorBtn.layer.cornerRadius = whiteColorBtn.frame.height / 2
        yellowColorBtn.layer.cornerRadius = yellowColorBtn.frame.height / 2
        
        saveBtn.layer.cornerRadius = 5
        

        noteTextTV.delegate = self
        noteTextTV.text = "Just a Placeholder text don't mind me , write your garbage here *E7m* , i mean , your notes here ..."
        noteTextTV.textColor = .lightGray
        textViewDidEndEditing(noteTextTV)
        textViewDidBeginEditing(noteTextTV)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == "Just a Placeholder text don't mind me , write your garbage here *E7m* , i mean , your notes here ...")
        {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder() //Optional
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text == "")
        {
            textView.text = "Just a Placeholder text don't mind me , write your garbage here *E7m* , i mean , your notes here ..."
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}





