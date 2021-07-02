//
//  FirstModalView.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 01/07/21.
//

import Foundation
import UIKit

class FirstModalView: UIView {
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Com serifa ou sem serifa?"
        return label
    }()
    
    lazy var briefTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Pensa direitinho pra sua fonte ficar do jeitinho que deseja! :)"
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    lazy var serifContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22;
        view.layer.masksToBounds = true;
        
        
        
        return view
    }()
    
    lazy var noSerifContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22;
        view.layer.masksToBounds = true;
        
        
        
        return view
    }()
    
    lazy var serifLetterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A"
        label.font = UIFont(name: "Baskerville", size: 48)
        label.textColor = .tipoGrafeiRed
        
        return label
    }()
    
    lazy var noSerifLetterLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 48)
        label.textColor = .tipoGrafeiRed
        
        return label
    }()
    
    var formData = FormDataSingleton.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(questionLabel)
        addSubview(briefTextView)
        addSubview(serifContainerView)
        serifContainerView.addSubview(serifLetterLabel)
        addSubview(noSerifContainerView)
        noSerifContainerView.addSubview(noSerifLetterLabel)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapEventDetected(gesture:)))
        serifContainerView.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(tapEventDetected2(gesture:)))
        noSerifContainerView.addGestureRecognizer(gesture2)
        
        serifContainerView.backgroundColor = .tipoGrafeiRed
        serifLetterLabel.textColor = .white
        noSerifContainerView.backgroundColor = .white
        noSerifLetterLabel.textColor = .tipoGrafeiRed
        formData.hasSerif = true

        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        
        let questionLabelConstraints: [NSLayoutConstraint] = [
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            questionLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(questionLabelConstraints)
        
        let briefTextViewConstraints: [NSLayoutConstraint] = [
            briefTextView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 16),
            briefTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            briefTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            briefTextView.heightAnchor.constraint(equalToConstant: 64)
        ]
        NSLayoutConstraint.activate(briefTextViewConstraints)
        
        let serifContainerViewConstraints: [NSLayoutConstraint] = [
            serifContainerView.topAnchor.constraint(equalTo: briefTextView.bottomAnchor, constant: 48),
            serifContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -80),
            serifContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            serifContainerView.widthAnchor.constraint(equalToConstant: 160),
            serifContainerView.heightAnchor.constraint(equalToConstant:160)
        ]
        NSLayoutConstraint.activate(serifContainerViewConstraints)

        let noSerifContainerViewConstraints: [NSLayoutConstraint] = [
            noSerifContainerView.topAnchor.constraint(equalTo: briefTextView.bottomAnchor, constant: 48),
            noSerifContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -80),
            noSerifContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            noSerifContainerView.widthAnchor.constraint(equalToConstant: 160),
            noSerifContainerView.heightAnchor.constraint(equalToConstant: 160)
        ]
        NSLayoutConstraint.activate(noSerifContainerViewConstraints)
        
        let serifLetterLabelConstraints: [NSLayoutConstraint] = [
            serifLetterLabel.centerXAnchor.constraint(equalTo: serifContainerView.centerXAnchor),
            serifLetterLabel.centerYAnchor.constraint(equalTo: serifContainerView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(serifLetterLabelConstraints)
        
        let noSerifLetterLabelConstraints: [NSLayoutConstraint] = [
            noSerifLetterLabel.centerXAnchor.constraint(equalTo: noSerifContainerView.centerXAnchor),
            noSerifLetterLabel.centerYAnchor.constraint(equalTo: noSerifContainerView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(noSerifLetterLabelConstraints)

    }
    
    @objc func tapEventDetected(gesture:UITapGestureRecognizer) {
        
        if gesture.state == .ended{
            serifContainerView.backgroundColor = .tipoGrafeiRed
            serifLetterLabel.textColor = .white
            noSerifContainerView.backgroundColor = .white
            noSerifLetterLabel.textColor = .tipoGrafeiRed
            formData.hasSerif = true
        }
    }
    
    @objc func tapEventDetected2(gesture:UITapGestureRecognizer){
        
        
        if gesture.state == .ended{
            
            serifContainerView.backgroundColor = .white
            serifLetterLabel.textColor = .tipoGrafeiRed
            noSerifContainerView.backgroundColor = .tipoGrafeiRed
            noSerifLetterLabel.textColor = .white
            formData.hasSerif = false
        }
    }
}
