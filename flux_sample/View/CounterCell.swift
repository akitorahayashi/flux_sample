//
//  CounterCell.swift
//  flux_sample
//
//  Created by 林 明虎 on 2025/01/05.
//

import UIKit

class CounterCell: UITableViewCell {
    static let reuseIdentifier = "CounterCell"
    
    private let nameLabel = UILabel()
    private let countLabel = UILabel()
    private let labelStackView = UIStackView()
    
    let incrementButton = UIButton(type: .system)
    let decrementButton = UIButton(type: .system)
    
    var incrementAction: (() -> Void)?
    var decrementAction: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textAlignment = .center
        nameLabel.isHidden = true
        labelStackView.addArrangedSubview(nameLabel)
        
        countLabel.textAlignment = .center
        labelStackView.addArrangedSubview(countLabel)
        
        labelStackView.axis = .vertical
        labelStackView.alignment = .center
        labelStackView.spacing = 4
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelStackView)
        
        incrementButton.setTitle("+", for: .normal)
        incrementButton.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(incrementButton)
        
        decrementButton.setTitle("-", for: .normal)
        decrementButton.addTarget(self, action: #selector(decrementButtonTapped), for: .touchUpInside)
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(decrementButton)
        
        NSLayoutConstraint.activate([
            labelStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            incrementButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            incrementButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            decrementButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            decrementButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func incrementButtonTapped() {
        incrementAction?()
    }
    
    @objc private func decrementButtonTapped() {
        decrementAction?()
    }
    
    func configure(name: String?, count: Int) {
        if let name = name {
            nameLabel.text = name
            nameLabel.isHidden = false
        } else {
            nameLabel.isHidden = true
        }
        countLabel.text = "\(count)"
    }
}
