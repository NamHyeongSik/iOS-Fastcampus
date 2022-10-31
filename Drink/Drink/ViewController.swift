//
//  ViewController.swift
//  Drink
//
//  Created by HYEONG SIK NAM on 2022/05/13.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var alertTableView: UITableView!
    
    var alerts = [Alert]()
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        alertTableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
        
        alertTableView.delegate = self
        alertTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alerts = getAlertList()
    }

    @IBAction func tabAddAlertButton(_ sender: UIButton) {
        guard let addAlertVC = storyboard?.instantiateViewController(withIdentifier: "AddAlertViewController") as? AddAlertViewController else { return }

        addAlertVC.pickerDate = { [weak self] date in
            guard let self = self else { return }

            var alertList = self.getAlertList()
            let newAlert = Alert(date: date, isOn: true)
            
            alertList.append(newAlert)
            alertList.sort{ $0.date < $1.date }
            
            self.alerts = alertList
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.userNotificationCenter.addNotificationRequest(by: newAlert)
            
            self.alertTableView.reloadData()
        }
        
        self.present(addAlertVC, animated: true)
    }
    
    func getAlertList() -> [Alert] {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return [] }
        return alerts
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as! AlertListCell
        
        cell.alertSwitch.isOn = alerts[indexPath.row].isOn
        cell.tiemLabel.text = alerts[indexPath.row].time
        cell.meridiemLabel.text = alerts[indexPath.row].merdiem
        cell.alertSwitch.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "물 마실시간"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[indexPath.row].id])
            self.alerts.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.alertTableView.reloadData()
        default:
            break
        }
    }
    
}
