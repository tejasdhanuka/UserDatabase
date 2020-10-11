//
//  UserListCell.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/10.
//

import UIKit

final class UserListCell: UITableViewCell {
    
    
    // MARK: - Properties
    
    var viewModel: UserListCellViewModel! {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            phoneNumberLabel.text = "Cell: \(viewModel.phone)"
            websiteLabel.text = viewModel.website
            companyNameLabel.text = "Company: \(viewModel.companyName)"
        }
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textAlignment = .left
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    private let companyNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(phoneNumberLabel)
        containerView.addSubview(websiteLabel)
        containerView.addSubview(companyNameLabel)
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4.0),
            phoneNumberLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            phoneNumberLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            websiteLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor),
            websiteLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            websiteLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            companyNameLabel.topAnchor.constraint(equalTo: websiteLabel.bottomAnchor, constant: 4.0),
            companyNameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            companyNameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0),
            companyNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8.0)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
