//
//  TaskTableCell.swift
//  todolistDIO
//
//  Created by Lucas on 18/08/21.
//

import UIKit

class TaskTableCell: UITableViewCell {
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbHour: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setTitle(title: String) {
        self.lbTitle.text = title
    }
    
    public func setDate(date: String) {
        self.lbDate.text  = date
    }
    
    public func setHour(hour: String) {
        self.lbHour.text  = hour
    }

}
