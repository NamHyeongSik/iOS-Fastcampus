//
//  CovidDetailTableViewController.swift
//  COVID19
//
//  Created by HYEONG SIK NAM on 2022/05/09.
//

import UIKit

class CovidDetailTableViewController: UITableViewController {
        
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    var covidOverview: CovidOverview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        guard let covidOverview = covidOverview else { return }
        
        self.title = covidOverview.countryName
        newCaseCell.detailTextLabel?.text = "\(covidOverview.newCase) 명"
        totalCaseCell.detailTextLabel?.text = "\(covidOverview.totalCase) 명"
        recoveredCell.detailTextLabel?.text = "\(covidOverview.recovered) 명"
        deathCell.detailTextLabel?.text = "\(covidOverview.death) 명"
        percentageCell.detailTextLabel?.text = "\(covidOverview.percentage)%"
        overseasInflowCell.detailTextLabel?.text = "\(covidOverview.newFcase) 명"
        regionalOutbreakCell.detailTextLabel?.text = "\(covidOverview.newCcase) 명"
    }
}
