//
//  UserDetailCell.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/18.
//

import UIKit

protocol UserDetailCellDelegate: AnyObject {
    func didTapFavoriteButton(for id: Int?)
}

final class UserDetailCell: UITableViewCell {
    
    // MARK: - Properties
    
    weak var delegate: UserDetailCellDelegate?
    
    var viewModel: UserDetailViewModel! {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = "Name:\n\(viewModel.name)"
            userNameLabel.text = "\nUsername:\n\(viewModel.userName)"
            addressLabel.text = "\nAddress:\n\(viewModel.address.suite), \(viewModel.address.street),\n\(viewModel.address.city), \(viewModel.address.zipcode)\n Coordinates: \(viewModel.address.geo.lat), \(viewModel.address.geo.lng)"
            companyDetailsLabel.text = "\nCompany:\n\(viewModel.companyDetail.name)\n\(viewModel.companyDetail.catchPhrase)\n\(viewModel.companyDetail.bs)"
            phoneNumberLabel.text = "\nCell:\n\(viewModel.phone)"
            websiteLabel.text = "\nWebsite:\n\(viewModel.website)"
            starButton.setImage(viewModel.isSelected ? UIImage(named: "star-selected") : UIImage(named: "star-unselected"), for: .normal)
            self.id = viewModel.id
        }
    }
    
    private var id: Int?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let companyDetailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let starButton: UIButton = {
        let button = UIButton()
        return button
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
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        companyDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        starButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(companyDetailsLabel)
        containerView.addSubview(phoneNumberLabel)
        containerView.addSubview(websiteLabel)
        containerView.addSubview(starButton)
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            starButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            starButton.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 4.0),
            starButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0),
            starButton.widthAnchor.constraint(equalToConstant: 20.0),
            starButton.heightAnchor.constraint(equalToConstant: 20.0)
        ])
        starButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)

        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8.0),
            userNameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            userNameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8.0),
            addressLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            addressLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            companyDetailsLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8.0),
            companyDetailsLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            companyDetailsLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: companyDetailsLabel.bottomAnchor, constant: 4.0),
            phoneNumberLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            phoneNumberLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0)
        ])
        
        NSLayoutConstraint.activate([
            websiteLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 4.0),
            websiteLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16.0),
            websiteLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16.0),
            websiteLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8.0)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @objc func pressed(sender: UIButton!) {
        delegate?.didTapFavoriteButton(for: id)
    }
}
