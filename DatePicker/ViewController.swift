//
//  ViewController.swift
//  DatePicker
//
//  Created by aziz omar boudi  on 3/9/16.
//  Copyright © 2016 jogabo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var whenLabel: UILabel!
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var viewToMove: UIView!
  @IBOutlet weak var displayedDateLabel: UILabel!

  @IBOutlet weak var centerYConstraintViewToMove: NSLayoutConstraint!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    datePicker.minimumDate = NSDate()

    for con in viewToMove.superview!.constraints {
      print(" -> \(con.description)\n")
    }
  }


  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)


  }


  @IBAction func showActionSheet(sender: AnyObject) {
  UIView.animateWithDuration(Double(0.6), animations: {
    self.centerYConstraintViewToMove.constant -= 200
    self.datePicker.alpha = 1
    self.view.layoutIfNeeded()
    })


  }




// hide date picker
  @IBAction func displayActionSheet(sender: AnyObject) {
    // animate the UIView containing the date picker outside 
    //of the view
  UIView.animateWithDuration(Double(0.6), animations: {
      self.centerYConstraintViewToMove.constant += 200
      self.datePicker.alpha = 0.5
      self.view.layoutIfNeeded()
      })


  }

  @IBAction func segmentedControlAction(sender: AnyObject) {
    if segmentedControl.selectedSegmentIndex == 0{
      whenLabel.text = "Depart"
    } else {
      whenLabel.text = "Arrive"
    }
  }
  @IBAction func getTheDate(sender: UIButton) {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMM d, H:mm a"
    let stringedDate = dateFormatter.stringFromDate(datePicker.date)
    displayedDateLabel.text = stringedDate
  }

  @IBAction func getPresentDate(sender: UIButton) {
    let date = NSDate()
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMM d, H:mm a"
    let stringedDate = dateFormatter.stringFromDate(date)
    displayedDateLabel.text = stringedDate
  }

  // create a function to avoid repeated code 
  // that is in getTheDate and getPresentDate




}

