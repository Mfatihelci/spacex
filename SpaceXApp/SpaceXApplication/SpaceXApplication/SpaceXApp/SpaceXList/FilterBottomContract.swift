//
//  FilterBottomContract.swift
//  SpaceXApplication
//
//  Created by fatih on 24.07.2022.
//

import Foundation

protocol FilterBottomViewModelProtocol {
    func load()
}

protocol FilterBottomViewModelDelegate {
    func update(value: [WelcomeElement])
}

//protocol FilterBottomViewModelProtocol {
//    var delegate: SpaceListViewModelDelegate? { get set }
//    func load()
//}
//
//enum FilterBottomViewModelOutput {
//    case showSpaceList([WelcomeElement])
//}
//
//protocol FilterBottomViewModelDelegate {
//    func handleViewModelOutput(_ output: SpaceViewModelOutput)
//}
