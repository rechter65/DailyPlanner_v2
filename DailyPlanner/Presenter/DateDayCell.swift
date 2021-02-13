//
//  DateDayCell.swift
//  DailyPlanner
//
//  Created by Admin on 07.01.2021.
//  Copyright © 2021 Admin. All rights reserved.
//

import UIKit

class DateDayCell: UITableViewCell {

    @IBOutlet var timePeriod: UILabel!
    @IBOutlet var taskView: UILabel!

    func setData(task: Task, hour: Int) {
        timePeriod.text = "\(hour):00"
        taskView.text = "\(task.dateStart) \(task.name)"
    }
    
}
