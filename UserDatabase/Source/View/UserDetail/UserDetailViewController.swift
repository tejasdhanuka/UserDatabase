//
//  UserDetailViewController.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/11.
//

import UIKit

protocol UserDetailViewControllerDelegate: AnyObject {
    func didTapFavoriteButton(for id: Int?, value: Bool)
}

final class UserDetailViewController: UIViewController {

    // MARK: - Properties
    private var userDetailTableView: UITableView!
    private var viewModel: UserDetailViewModel
    weak var delegate: UserDetailViewControllerDelegate?
  
    // MARK: - Init
    
    required init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    // This is also necessary when extending the superclass
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Setup
    
    private func setup() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.title = "User Detail"
        setupViewHierarchy()
    }
    
    private func setupViewHierarchy() {
        userDetailTableView = UITableView()
        view.addSubview(userDetailTableView)
        setupTableView()
    }
    
    private func setupTableView() {
        userDetailTableView.delegate = self
        userDetailTableView.dataSource = self
        userDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        userDetailTableView.alwaysBounceVertical = true
        userDetailTableView.separatorStyle = .none
        userDetailTableView.rowHeight = UITableView.automaticDimension
        userDetailTableView.delaysContentTouches = false
        
        NSLayoutConstraint.activate([
            userDetailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userDetailTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            userDetailTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            userDetailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        userDetailTableView.register(UserDetailCell.self, forCellReuseIdentifier: Constants.userDetailCellReuseIdentifier)
    }
}

// MARK: Tableview data source

extension UserDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userDetailCellReuseIdentifier) as? UserDetailCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.delegate = self
        cell.viewModel = viewModel
        return cell
    }
}

// MARK: Tableview delegate

extension UserDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

// MARK: UserDetailCellDelegate

extension UserDetailViewController: UserDetailCellDelegate {
    func didTapFavoriteButton(for id: Int?) {
        viewModel.isSelected.toggle()
        DispatchQueue.main.async {
            self.userDetailTableView.reloadData()
        }
        delegate?.didTapFavoriteButton(for: id, value: viewModel.isSelected)
    }
}
