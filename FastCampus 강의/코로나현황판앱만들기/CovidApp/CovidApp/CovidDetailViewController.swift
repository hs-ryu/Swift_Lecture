//
//  CovidDetailViewController.swift
//  CovidApp
//
//  Created by ryu hyunsun on 2024/01/07.
//

import UIKit

class CovidDetailViewController: UITableViewController {
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    var covidOverView: CovidOverView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        guard let covidOverView = covidOverView else { return }
        self.title = covidOverView.countryName
        newCaseCell.detailTextLabel?.text = "\(covidOverView.newCase)명"
        totalCaseCell.detailTextLabel?.text = "\(covidOverView.totalCase)명"
        recoveredCell.detailTextLabel?.text = "\(covidOverView.recovered)명"
        deathCell.detailTextLabel?.text = "\(covidOverView.death)명"
        percentageCell.detailTextLabel?.text = "\(covidOverView.percentage)%"
        overseasInflowCell.detailTextLabel?.text = "\(covidOverView.newFcase)명"
        regionalOutbreakCell.detailTextLabel?.text = "\(covidOverView.newCcase)명"
    }
}
