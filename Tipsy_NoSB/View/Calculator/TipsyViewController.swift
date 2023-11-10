//
//  TipsyViewController.swift
//  Tipsy_NoSB
//
//  Created by Raúl Pavón on 17/02/23.
//

import UIKit

class TipsyViewController: UIViewController {

    weak var tipsyCoordinator: TipsyCoordinator?
    private let factory: TipsyFactory
    
    var totalPerPerson: Float = 0.0
    
    private lazy var tipsyUIView: TipsyUIView = {
        let view = TipsyUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(factory: TipsyFactory, tipsyCoordinator: TipsyCoordinator) {
        self.tipsyCoordinator = tipsyCoordinator
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func initComponents() {
        addComponents()
        setAutolayout()
        setTargets()
    }
    
    private func addComponents() {
        view.addSubview(tipsyUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            tipsyUIView.topAnchor.constraint(equalTo: view.topAnchor),
            tipsyUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tipsyUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tipsyUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setTargets() {
        tipsyUIView.setPercentageTarget(target: self, action: #selector(tipChanged(sender: )))
        tipsyUIView.setStepperTarget(target: self, action: #selector(stepperValueChanged(sender: )))
        tipsyUIView.setCalculateTarget(target: self, action: #selector(calculate))
    }
    
    @objc private func tipChanged(sender: UIButton) {
        tipsyUIView.tipChanged(sender: sender)
    }
    
    @objc private func stepperValueChanged(sender: UIStepper) {
        tipsyUIView.stepperValueChanged(sender: sender)
    }
    
    @objc private func calculate() {
        tipsyUIView.calculate()
    }
}
