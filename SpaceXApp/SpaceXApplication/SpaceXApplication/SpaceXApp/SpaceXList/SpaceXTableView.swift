//
//  SpaceXTableView.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import UIKit
import Alamofire

final class TableViewProvider: NSObject {
    
    private var spaceList: [WelcomeElement] = []
    var delegate: tableViewProviderDelegate?
    private var detail: [WelcomeElement] = []
    
    func removo() {
        spaceList.removeAll()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let space = spaceList[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpaceXTableViewCell.Identifier.ID.rawValue) as? SpaceXTableViewCell else {
            return UITableViewCell()
        }
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.red.cgColor
        cell.saveModel(data: space)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = spaceList[indexPath.row]
        delegate?.onSelected(value: data)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}

extension TableViewProvider: UITableViewDelegate,UITableViewDataSource { }

extension TableViewProvider: tableViewProviderProtocol {
    func update(value: [WelcomeElement]) {
        self.spaceList = value
    }
}
