//
//  AddAlertViewController.swift
//  Drink
//
//  Created by HYEONG SIK NAM on 2022/05/13.
//

import UIKit

class AddAlertViewController: UIViewController {

    var pickerDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        pickerDate?(datePicker.date)
        self.dismiss(animated: true)
    }
    
}
