//
//  NoteTableViewCell.swift
//  iNotes
//
//  Created by Ahmed Ramy on 2/6/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setModel(model : NotesModel)
    {
        titleLbl.text = model.titleString
        bodyLbl.text = model.bodyString
        cellBackground.backgroundColor = model.bgColor
    }
    
    
}
