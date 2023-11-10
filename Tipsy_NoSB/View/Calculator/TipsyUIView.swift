//
//  TipsyUIView.swift
//  Tipsy_NoSB
//
//  Created by Raúl Pavón on 17/02/22.
//

import UIKit

class TipsyUIView: UIView {
    enum CalculatorUIViewConstraints {
        
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackTotal: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 26
        stack.alignment = .center
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        return stack
    }()
    
    private let lbBillTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.text = "Enter bill total"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let tfBill: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 40)
        textField.textColor = UIColor(hex: "00B06B")
        textField.placeholder = "e.g. 123.56"
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var viewContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(hex: "D7F9EB")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 28
        stack.alignment = .center
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        return stack
    }()
    
    private let lbTip: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.text = "Select tip"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var stackPercent: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var btZeroPercent: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0%", for: .normal)
        button.tag = 0
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var btTenPercent: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10%", for: .normal)
        button.tag = 10
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var btTwentyPercent: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("20%", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.tag = 20
        button.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private let lbSplit: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.text = "Choose Split"
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var stackSplit: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 27
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        return stack
    }()
    
    private let lbSplitValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = UIColor(hex: "00B06B")
        label.textAlignment = .center
        label.text = "2"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let stSplit: UIStepper = {
        let stepper = UIStepper(frame: .zero)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 2
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.stepValue = 1
        return stepper
    }()
    
    private lazy var btCalculate: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = UIColor(hex: "00B06B")
        button.setTitleColor(UIColor(hex: "F8FFFD"), for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    var totalPerPerson: Float = 0.0
    
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
        mainContainer.addSubview(stackTotal)
        stackTotal.addArrangedSubview(lbBillTitle)
        stackTotal.addArrangedSubview(tfBill)
        mainContainer.addSubview(viewContainer)
        viewContainer.addSubview(stackContainer)
        stackContainer.addArrangedSubview(lbTip)
        stackContainer.addArrangedSubview(stackPercent)
        stackPercent.addArrangedSubview(btZeroPercent)
        stackPercent.addArrangedSubview(btTenPercent)
        stackPercent.addArrangedSubview(btTwentyPercent)
        stackContainer.addArrangedSubview(lbSplit)
        stackContainer.addArrangedSubview(stackSplit)
        stackSplit.addArrangedSubview(lbSplitValue)
        stackSplit.addArrangedSubview(stSplit)
        mainContainer.addSubview(btCalculate)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackTotal.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stackTotal.bottomAnchor.constraint(equalTo: viewContainer.topAnchor, constant: -40),
            stackTotal.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            stackTotal.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            
            lbBillTitle.leadingAnchor.constraint(equalTo: stackTotal.leadingAnchor, constant: 50),
            lbBillTitle.trailingAnchor.constraint(equalTo: stackTotal.trailingAnchor, constant: -50),
            lbBillTitle.heightAnchor.constraint(equalToConstant: 30),
            
            tfBill.leadingAnchor.constraint(equalTo: stackTotal.leadingAnchor),
            tfBill.trailingAnchor.constraint(equalTo: stackTotal.trailingAnchor),
            tfBill.heightAnchor.constraint(equalToConstant: 48),
            
            viewContainer.topAnchor.constraint(equalTo: stackTotal.bottomAnchor, constant: 40),
            viewContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            
            stackContainer.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 20),
            stackContainer.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 20),
            stackContainer.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -20),
            
            lbTip.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor, constant: 30),
            lbTip.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor, constant: -30),
            lbTip.heightAnchor.constraint(equalToConstant: 30),
            
            stackPercent.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor),
            stackPercent.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor),
            
            btZeroPercent.heightAnchor.constraint(equalToConstant: 54),
            
            btTenPercent.heightAnchor.constraint(equalToConstant: 54),
            
            btTwentyPercent.heightAnchor.constraint(equalToConstant: 54),
            
            lbSplit.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor, constant: 30),
            lbSplit.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor, constant: -30),
            lbSplit.heightAnchor.constraint(equalToConstant: 30),
            
            stackSplit.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor, constant: 80),
            stackSplit.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor, constant: -80),
            
            lbSplitValue.heightAnchor.constraint(equalToConstant: 29),
            
            stSplit.heightAnchor.constraint(equalToConstant: 29),
            
            btCalculate.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            btCalculate.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor),
            btCalculate.heightAnchor.constraint(equalToConstant: 54),
            btCalculate.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func setPercentageTarget(target: Any?, action: Selector) {
        btZeroPercent.addTarget(target, action: action, for: .touchUpInside)
        btTenPercent.addTarget(target, action: action, for: .touchUpInside)
        btTwentyPercent.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setStepperTarget(target: Any?, action: Selector) {
        stSplit.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setCalculateTarget(target: Any?, action: Selector) {
        btCalculate.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func tipChanged(sender: UIButton) {
        tfBill.endEditing(true)
        
        switch sender.tag {
        case 0:
            btZeroPercent.backgroundColor = UIColor(hex: "00B06B")
            btZeroPercent.setTitleColor(.white, for: .normal)
            btZeroPercent.isSelected = true
            btTenPercent.backgroundColor = .clear
            btTenPercent.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
            btTwentyPercent.backgroundColor = .clear
            btTwentyPercent.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
        case 10:
            btTenPercent.backgroundColor = UIColor(hex: "00B06B")
            btTenPercent.setTitleColor(.white, for: .normal)
            btTenPercent.isSelected = true
            btZeroPercent.backgroundColor = .clear
            btZeroPercent.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
            btTwentyPercent.backgroundColor = .clear
            btTwentyPercent.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
        case 20:
            btTwentyPercent.backgroundColor = UIColor(hex: "00B06B")
            btTwentyPercent.setTitleColor(.white, for: .normal)
            btTwentyPercent.isSelected = true
            btZeroPercent.backgroundColor = .clear
            btZeroPercent.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
            btTenPercent.backgroundColor = .clear
            btTenPercent.setTitleColor(UIColor(hex: "00B06B"), for: .normal)
        default:
            break
        }
    }
    
    func stepperValueChanged(sender: UIStepper) {
        lbSplitValue.text = String(format: "%.0f", sender.value)
    }
    
    func calculate() {
        let bill = Float(tfBill.text ?? "") ?? 0.0
        let splitNumber = Float(lbSplitValue.text ?? "") ?? 0.0
        
        if btZeroPercent.isSelected {
            totalPerPerson = bill / splitNumber
        } else if btTenPercent.isSelected {
            totalPerPerson = (bill * 1.1) / splitNumber
        } else {
            totalPerPerson = (bill * 1.2) / splitNumber
        }
    }
}
