//
//  FiltreBottomViewController.swift
//  SpaceXApplication
//
//  Created by fatih on 20.07.2022.
//

import UIKit
import PanModal
import SnapKit

class FiltreBottomViewController: UIViewController, PanModalPresentable {
    var panScrollable: UIScrollView?
    let arttirButton: UIButton = UIButton()
    let azaltButton: UIButton = UIButton()
    let siralama: SpaceXViewController = SpaceXViewController()
    var viewModel: FilterBottomViewModel?
    var siraalama: [WelcomeElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        configure()
        drawDesing()
    }
    
    func configure(){
        view.addSubview(arttirButton)
        view.addSubview(azaltButton)
        makeArttirButton()
        makeAzaltButton()
        ArttirClickButton()
        AzaltClickButton()
    }

    func drawDesing(){
        arttirButton.setTitle("Yeniden Eskiye", for: .normal)
        arttirButton.setTitleColor(UIColor.black , for: .normal)
        arttirButton.layer.cornerCurve = .continuous
        arttirButton.clipsToBounds = true
        arttirButton.backgroundColor = UIColor.red
        arttirButton.layer.cornerRadius = 10
        view.backgroundColor = .systemBlue
        azaltButton.setTitle("Eskiden Yeniye", for: .normal)
        azaltButton.setTitleColor(UIColor.black , for: .normal)
        azaltButton.layer.cornerCurve = .continuous
        azaltButton.clipsToBounds = true
        azaltButton.backgroundColor = UIColor.white
        azaltButton.layer.cornerRadius = 10
}
    var longFormHeight: PanModalHeight{
        return .contentHeight(250)
    }
    
    func ArttirClickButton(){
        arttirButton.addTarget(self, action: #selector(click1), for: .touchUpInside)
    }
    
    @objc func click1(){
        self.dismiss(animated: true)
        //self.navigationController?.pushViewController(siralama, animated: true)
        let sorted = self.siraalama.sorted { (first, second) -> Bool in
            first.launchYear ?? "" > second.launchYear ?? ""
        }
        siralama.artanAzalan(data: sorted, isfiltre: true)
       // siralama.siralamaYeniden(value: true)
        
    }
    
    func AzaltClickButton(){
        azaltButton.addTarget(self, action: #selector(click2), for: .touchUpInside)
    }
    
     @objc func click2(){
         self.dismiss(animated: true)
//         self.navigationController?.pushViewController(<#UIViewController#>, animated: true)
         //self.navigationController?.pushViewController(siralama, animated: true)
         siralama.azalanArtan(data: siraalama, isfiltre: false)
         //siralama.siralamaYeniden(value: false)

    }
}

extension FiltreBottomViewController: FilterBottomViewModelDelegate {
    func update(value: [WelcomeElement]) {
        self.siraalama = value
    }
}

extension FiltreBottomViewController {
    func makeArttirButton(){
        arttirButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
    }
    
    func makeAzaltButton(){
        azaltButton.snp.makeConstraints { make in
            make.top.equalTo(arttirButton.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
    }
}
