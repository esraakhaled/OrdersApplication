//
//  ViewController.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 22/09/2022.
//

import UIKit

class OrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var current: UIButton!
    var section1Expanded = false
    var section2Expanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupButtonAppearance()       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .brandPrimary
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    func configureTableView() {
        tableView.register(UINib(nibName: "ItemsCell", bundle: nil), forCellReuseIdentifier: "ItemsCell")
        tableView.register(UINib(nibName: "ProgressCell", bundle: nil), forCellReuseIdentifier: "ProgressCell")
        tableView.register(UINib(nibName: "SheetTableViewCell", bundle: nil), forCellReuseIdentifier: "SheetTableViewCell")
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    func setupButtonAppearance() {
        previous.layer.cornerRadius = 30
        current.layer.cornerRadius = 30
        previous.layer.borderWidth = 1.0
        previous.tintColor = UIColor.brandPrimary
        previous.layer.borderColor = UIColor.brandPrimary?.cgColor
        previous.backgroundColor = UIColor.white
        current.layer.borderWidth = 1.0
        current.tintColor = UIColor.brandPrimary
        current.layer.borderColor = UIColor.brandPrimary?.cgColor
        current.backgroundColor = UIColor.white
        
    }
    @IBAction func currentOrdersAction(_ sender: UIButton) {
        
        previous.isSelected = false
        current.isSelected = false
        sender.isSelected = true
        previous.setTitleColor(UIColor.white, for: .selected)
        current.setTitleColor(UIColor.white, for: .selected)
        if previous == sender {
            previous.backgroundColor = .brandPrimary
            previous.layer.borderColor = UIColor.white.cgColor
            previous.layer.borderWidth = 1.0
        } else {
            previous.backgroundColor = .white
            previous.layer.borderColor = UIColor.brandPrimary?.cgColor
            previous.layer.borderWidth = 1.0
            
        }
        if current == sender {
            current.backgroundColor = .brandPrimary
            current.layer.borderColor = UIColor.white.cgColor
            current.layer.borderWidth = 1.0
        } else {
            current.backgroundColor = .white
            current.layer.borderColor = UIColor.brandPrimary?.cgColor
            current.layer.borderWidth = 1.0
        }
        
    }
}

