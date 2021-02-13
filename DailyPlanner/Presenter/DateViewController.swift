//
//  DateViewController.swift
//  DailyPlanner
//
//  Created by Admin on 07.01.2021.
//  Copyright © 2021 Admin. All rights reserved.
//

import UIKit

protocol DateViewProtocol {
    func listOfTasksUpdated()
}

class DateViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 24
    }
   
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var tableView: UITableView!
    @IBAction func didSelectDate(_ sender: Any) {
        presenter.didSelectDate(datePicker.date)
    }
    
    var presenter: DatePresenterProtocol!

    override func viewDidLoad() {
    super.viewDidLoad()
        presenter = DatePresenter(view:self)
        tableView.dataSource = self
        tableView.register(DateDayCell.self, forCellReuseIdentifier: "DateDayCell")
        
        presenter.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
             guard let cell = tableView.dequeueReusableCell(withIdentifier: "DateDayCell") as?  DateDayCell,
             let task = presenter.getTasksForRow(withIndex:indexPath.row) else {
                   return UITableViewCell()
        }
        cell.setData(task: task, hour: indexPath.row + 1)
        return cell
    }

}

extension DateViewController: DateViewProtocol {
    func listOfTasksUpdated() {
        tableView.reloadData()
    }
}

