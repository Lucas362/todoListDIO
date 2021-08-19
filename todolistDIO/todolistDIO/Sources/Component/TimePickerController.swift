//
//  TimePickerController.swift
//  todolistDIO
//
//  Created by Lucas on 19/08/21.
//

import UIKit

protocol TimePickerProtocol {
    func sendHour(hour: String)
}

class TimePickerController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!

    // MARK: Var/Lets
    public var delegate: TimePickerProtocol?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction
    @IBAction func close(_ sender: UIButton) {
        if sender == self.btnOK {
            self.dismiss(animated: true, completion: {
                guard let delegate = self.delegate else {return}
                let datePickerSelect: Date = self.datePicker.date
                let dateStr: String = Date().convertDateToString(date: datePickerSelect, dateFormatter: "HH:mm")
                delegate.sendHour(hour: dateStr)
            })
        } else {
            self.dismiss(animated: true)
        }
    }
}
