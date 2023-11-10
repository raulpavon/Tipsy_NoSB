//
//  ResultUIView.swift
//  Tipsy_NoSB
//
//  Created by Raúl Pavón on 21/02/23.
//

import UIKit

class ResultUIView: UIView {

    enum ResultUIViewConstraints {
        
    }

    private lazy var mainContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var totalContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hex: "D7F9EB")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lbTotalTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Total per person"
        label.textColor = UIColor(hex: "959A99")
        return label
    }()
    
    private lazy var lbTotal: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        label.text = "56.32"
        label.textColor = UIColor(hex: "00B06B")
        return label
    }()
    
    private lazy var btRecalculate: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recalculate", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.setTitleColor(UIColor(hex: "F8FFFD"), for: .normal)
        button.backgroundColor = UIColor(hex: "00B06B")
        return button
    }()
    
    private lazy var lbMessage: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between 2 people, with 10% tip."
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(hex: "959A99")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(totalContainer)
        totalContainer.addSubview(lbTotalTitle)
        totalContainer.addSubview(lbTotal)
        mainContainer.addSubview(lbMessage)
        mainContainer.addSubview(btRecalculate)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            totalContainer.topAnchor.constraint(equalTo: topAnchor),
            totalContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalContainer.bottomAnchor.constraint(equalTo: lbMessage.topAnchor, constant: -5),
            
            lbTotalTitle.centerYAnchor.constraint(equalTo: totalContainer.centerYAnchor),
            lbTotalTitle.leadingAnchor.constraint(equalTo: totalContainer.leadingAnchor),
            lbTotalTitle.trailingAnchor.constraint(equalTo: totalContainer.trailingAnchor),
            lbTotalTitle.heightAnchor.constraint(equalToConstant: 36),
            lbTotalTitle.bottomAnchor.constraint(equalTo: lbTotal.topAnchor),
            
            lbTotal.topAnchor.constraint(equalTo: lbTotalTitle.bottomAnchor),
            lbTotal.leadingAnchor.constraint(equalTo: totalContainer.leadingAnchor),
            lbTotal.trailingAnchor.constraint(equalTo: totalContainer.trailingAnchor),
            lbTotal.heightAnchor.constraint(equalToConstant: 100),
            
            lbMessage.topAnchor.constraint(equalTo: totalContainer.bottomAnchor, constant: 5),
            lbMessage.leadingAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            lbMessage.trailingAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            lbMessage.heightAnchor.constraint(equalToConstant: 117),
            
            btRecalculate.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor),
            btRecalculate.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor),
            btRecalculate.widthAnchor.constraint(equalToConstant: 200),
            btRecalculate.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
}
