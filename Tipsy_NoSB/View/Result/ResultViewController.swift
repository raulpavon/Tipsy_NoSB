//
//  ResultViewController.swift
//  Tipsy_NoSB
//
//  Created by Raúl Pavón on 21/02/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var tip: Tip
    
    private lazy var resultUIView: ResultUIView = {
        let view = ResultUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(tip: Tip) {
        self.tip = tip
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
        setTarget()
    }
    
    private func addComponents() {
        view.addSubview(resultUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            resultUIView.topAnchor.constraint(equalTo: view.topAnchor),
            resultUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setTarget() {
        
    }
}
