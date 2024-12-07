//
//  myStatusViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 10/27/24.
//

import UIKit

class myStatusViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Outlets for UI elements
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    @IBOutlet weak var activityTypePicker: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var distanceTextField: UITextField!
    // Activity types for the picker view
    let activityTypes = ["Run", "Group Run", "Challenge run"]
    var selectedActivityType: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set up activity type picker view
            activityTypePicker.delegate = self
            activityTypePicker.dataSource = self
        }
        
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // Fetch values from the input fields
        let selectedDate = datePicker.date
        let startTime = startTimePicker.date
        let endTime = endTimePicker.date
        
        // Check if end time is later than start time
        if endTime <= startTime {
            showErrorAlert(message: "Error: End time cannot be earlier than or equal to start time")
            return
        }
        
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        
        // Check if distance is a valid Double
        guard let distanceText = distanceTextField.text, let distance = Double(distanceText) else {
            showErrorAlert(message: "Error: Please enter a valid distance value")
            return
        }
        
        // Print values to console
        print("Date: \(selectedDate)")
        print("Start Time: \(startTime)")
        print("End Time: \(endTime)")
        print("Activity Type: \(selectedActivityType ?? "Not selected")")
        print("Title: \(title)")
        print("Description: \(description)")
        print("Distance: \(distance)")
    }
    
    // MARK: - UIPickerView Data Source & Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activityTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedActivityType = activityTypes[row]
    }
    
    // MARK: - Helper Methods
    
    // 显示错误警告
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Input Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
