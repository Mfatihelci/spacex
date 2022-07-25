//
//  FilterButtonViewModel.swift
//  SpaceXApplication
//
//  Created by fatih on 24.07.2022.
//

import Foundation

final class FilterBottomViewModel: FilterBottomViewModelProtocol {
    
    var view: FilterBottomViewModelDelegate?
    var space: [WelcomeElement] = []
    
    init(view: FilterBottomViewModelDelegate,space: [WelcomeElement]){
        self.view = view
        self.space = space
    }
    func load() {
        view?.update(value: space)
    }
}
