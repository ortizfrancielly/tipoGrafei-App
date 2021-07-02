//
//  SecondModalView.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 01/07/21.
//

import Foundation
import UIKit

class SecondModalView: UIView {
    
    lazy var asteticsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Estética pretendida"
        return label
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Qual a ideia que sua fonte quer passar?"
        
        return label
    }()
    
    lazy var chooseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escolhe uma e conta pra gente!"
        
        return label
    }()
    
    lazy var picker: UIPickerView = {
        let picker = UIPickerView(frame: .zero)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        
        return picker
    }()
    
    var families: [String] = ["Cursiva", "Romana", "Gótica", "Egípcia", "Grotesca", "Fantasia"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(asteticsLabel)
        addSubview(questionLabel)
        addSubview(chooseLabel)
        addSubview(picker)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        let asteticsLabelConstraints: [NSLayoutConstraint] = [
            asteticsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            asteticsLabel.bottomAnchor.constraint(equalTo: questionLabel.topAnchor, constant: -16)

        ]
        NSLayoutConstraint.activate(asteticsLabelConstraints)
        
        let questionLabelConstraints: [NSLayoutConstraint] = [
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            questionLabel.bottomAnchor.constraint(equalTo: chooseLabel.topAnchor)
        ]
        NSLayoutConstraint.activate(questionLabelConstraints)
        
        let chooseLabelConstraints: [NSLayoutConstraint] = [
            chooseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            chooseLabel.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: -50)
        ]
        NSLayoutConstraint.activate(chooseLabelConstraints)
        
        let pickerConstraints: [NSLayoutConstraint] = [
            picker.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -80),
            picker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            picker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ]
        NSLayoutConstraint.activate(pickerConstraints)

    }
}

extension SecondModalView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return families.count
    }
}

extension SecondModalView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = families[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let familyString: String = families[row]
        let singleton = FormDataSingleton.shared
        
        switch familyString {
        case "Cursiva":
            singleton.fontFamily = .cursiva
        case "Romana":
            singleton.fontFamily = .romana
        case "Gótica":
            singleton.fontFamily = .gotica
        case "Egípcia":
            singleton.fontFamily = .egipsia
        case "Grotesca":
            singleton.fontFamily = .grotesca
        case "Fantasia":
            singleton.fontFamily = .fantasia
        default:
            singleton.fontFamily = .cursiva
        }
    }
    
}


