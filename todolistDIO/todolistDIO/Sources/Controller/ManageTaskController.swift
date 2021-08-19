//
//  ManageTaskController.swift
//  todolistDIO
//
//  Created by Lucas on 18/08/21.
//

import UIKit
import FSCalendar

class ManageTaskController: UITableViewController {
    // MARK: IBOutlets
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var btnHour: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    
    // MARK: Var/Let
    private var hour: String = ""
    private var date: String = ""
    public var task: Task?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.delegate = self
        self.configView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TimePickerController {
            controller.delegate = self
        }
    }
    
    // MARK: IBActions
    @IBAction func openComponent(_ sender: Any) {
        self.performSegue(withIdentifier: "segueHourComponent", sender: nil)
    }

    @IBAction func deleteTask(_ sender: Any) {
        TaskDefaultHelper().deleteTask(task: self.task!)
        self.dismiss(animated: true)
    }

    @IBAction func createTask(_ sender: Any) {
        generateTask()
    }

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: func
    private func configView() {
        self.btnRemove.isHidden = self.task == nil
        guard let taskAux = self.task else { return }
        self.btnHour.setTitle(taskAux.hour, for: .normal)
        self.txtTitle.text = taskAux.title
        self.date = taskAux.date
        self.hour = taskAux.hour
    }

    private func generateTask() {
        if self.task != nil {
            self.task?.date = self.date
            self.task?.title = self.txtTitle.text ?? ""
            self.task?.hour = self.hour
            TaskDefaultHelper().updateTask(task: self.task!)
        } else {
            var list: [Task] = TaskDefaultHelper().getTaskList()
            let task: Task = Task(id: TaskDefaultHelper().getNextID(), title: self.txtTitle.text ?? "", hour: self.hour, date: self.date)
            list.append(task)
            TaskDefaultHelper().saveTaskList(list: list)
        }
        
        self.dismiss(animated: true)
    }
}

extension ManageTaskController: FSCalendarDelegate, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.date = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let dateAux = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil, self.date == dateAux {
            return .green
        }
        
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let dateAux = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil, self.date == dateAux {
            return .black
        }
        
        return nil
    }
}

extension ManageTaskController: TimePickerProtocol {
    func sendHour(hour: String) {
        self.btnHour.setTitle(hour, for: .normal)
        self.hour = hour
    }
}

extension ManageTaskController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}


