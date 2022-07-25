//
//  FilterBottomBuilder.swift
//  SpaceXApplication
//
//  Created by fatih on 24.07.2022.
//

import Foundation

final class FilterBottomBuilder {
    static func make(value: [WelcomeElement]) -> FiltreBottomViewController {
        let vc = FiltreBottomViewController()
        let viewModel = FilterBottomViewModel(view: vc, space: value)
        vc.viewModel = viewModel
        return vc
    }
}
