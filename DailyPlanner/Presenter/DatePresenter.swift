//
//  DatePresenter.swift
//  DailyPlanner
//
//  Created by Admin on 07.01.2021.
//  Copyright © 2021 Admin. All rights reserved.
//

import Foundation

protocol DatePresenterProtocol {
    var actualTasks: [Task] { get }
        init (view: DateViewProtocol)
     func viewDidLoad()
        func didSelectDate(_ date: Date)
           func getTasksForRow(withIndex: Int) -> Task?
}

class DatePresenter: DatePresenterProtocol {

    var actualTasks: [Task] = []
      private var allTasks: [Task] = []
        private let view: DateViewProtocol
          private let parser = TasksProvider()
            private var selectedDate: Date? {
         didSet {actualTasks = allTasks.filter{
             $0.dateStart == selectedDate
        }
    view.listOfTasksUpdated()
        }
    }
    
func getTasksForRow(withIndex: Int) -> Task? {
    let calendar = Calendar.current
       return actualTasks.first {tasks in
         let hour = calendar.component(.hour, from: tasks.dateStart)
           return hour == (withIndex + 1)}
    }
    
         required init(view: DateViewProtocol) {
           self.view = view
    }
    
func viewDidLoad() {
    allTasks = parser.parseTasks()
    didSelectDate (Date())
    }
    
func didSelectDate(_ date: Date) {
    selectedDate = date
    }
}
	
