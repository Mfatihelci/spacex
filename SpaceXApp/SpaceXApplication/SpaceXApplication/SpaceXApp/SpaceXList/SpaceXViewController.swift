//
//  SpaceXViewController.swift
//  SpaceXApplication
//
//  Created by fatih on 16.07.2022.
//

import UIKit
import SnapKit
import PanModal

class SpaceXViewController: UIViewController, tableViewProviderDelegate {
  
     
    private let TableViewSpace: UITableView = UITableView()
    private let TableView: TableViewProvider = TableViewProvider()
    var sortedlist: [WelcomeElement] = []
    var filtrelist: [WelcomeElement] = []
    var isfiltre = false

 
    var viewModel: SpaceListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.delegate = self
        
        viewModel?.load()
        
        initService()
        
        initDelegate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.load()
    }
    
    private func initDelegate(){
        TableViewSpace.register(SpaceXTableViewCell.self, forCellReuseIdentifier: SpaceXTableViewCell.Identifier.ID.rawValue)
        TableViewSpace.delegate = TableView
        TableViewSpace.dataSource = TableView
        TableView.delegate = self
    }
    private func initService() {
        configure()
        drawDesing()
    }
    
    private func configure() {
        view.addSubview(TableViewSpace)
        makeTableViewSpace()
    }
    
    private func drawDesing() {
        TableViewSpace.backgroundColor = .white
        let doneItem = UIBarButtonItem(barButtonSystemItem: .action , target: self, action: #selector(selectorName))
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = doneItem
        view.backgroundColor = .white
        self.title = "SpaceX Rockets"
    }
    
    @objc func selectorName() {
        print("asdasd")
        navigationController?.presentPanModal(FilterBottomBuilder.make(value: sortedlist))
        
    }
    
    func onSelected(value: WelcomeElement) {
        let viewController = SpaceDetailBuilder.make(value: value)
        show(viewController, sender: nil)
    }
    
    func azalanArtan(data: [WelcomeElement], isfiltre: Bool) {
        self.isfiltre = isfiltre
        TableView.removo()
        TableView.update(value: data)
        TableViewSpace.reloadData()
    }
    
    func artanAzalan(data: [WelcomeElement], isfiltre: Bool) {
        self.isfiltre = isfiltre
        TableView.removo()
        TableView.update(value: data)
        TableViewSpace.reloadData()
    }
    
    func siralamaYeniden(value: Bool){
     
        if value {
            let sorted = self.sortedlist.sorted { (first, second) -> Bool in
                first.launchYear ?? "" > second.launchYear ?? ""
            }
            TableView.update(value: sorted)
            self.TableViewSpace.reloadData()
        }else {
            TableView.update(value: sortedlist)
            TableViewSpace.reloadData()
        }
    }
}

extension SpaceXViewController: SpaceListViewModelDelegate {
    func handleViewModelOutput(_ output: SpaceViewModelOutput) {
        switch output {
        case .showSpaceList(let list):
//            TableView.update(value: list)
//            TableViewSpace.reloadData()
            if isfiltre == false {
                TableView.update(value: list)
                TableViewSpace.reloadData()
            }
        }
    }
}

extension SpaceXViewController {
    private func makeTableViewSpace() {
        TableViewSpace.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
