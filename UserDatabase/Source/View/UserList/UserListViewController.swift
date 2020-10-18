//
//  UserListViewController.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/10.
//

import UIKit

final class UserListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var userListTableView: UITableView!
    private var viewModel: UserDatabaseViewModel
    
    // MARK: - Init
    
    required init(viewModel: UserDatabaseViewModel) {
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
        loadData()
    }
    
    // MARK: - Setup
    
    private func setup() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.title = "User List"
        setupViewHierarchy()
    }
    
    private func setupViewHierarchy() {
        userListTableView = UITableView()
        view.addSubview(userListTableView)
        setupTableView()
    }
    
    private func setupTableView() {
        userListTableView.delegate = self
        userListTableView.dataSource = self
        userListTableView.translatesAutoresizingMaskIntoConstraints = false
        userListTableView.alwaysBounceVertical = true
        userListTableView.separatorStyle = .singleLine
        userListTableView.rowHeight = UITableView.automaticDimension
        userListTableView.delaysContentTouches = false
        
        NSLayoutConstraint.activate([
            userListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userListTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            userListTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            userListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        userListTableView.register(UserListCell.self, forCellReuseIdentifier: Constants.userListCellReuseIdentifier)
    }
    
    // MARK: - load data
    
    private func loadData() {
        viewModel.reloadData(completion: { success in
            DispatchQueue.main.async {
                self.userListTableView.reloadData()
            }
        })
    }
}

// MARK: Tableview data source

extension UserListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userListCellReuseIdentifier) as? UserListCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.viewModel = viewModel.cellViewModel(for: indexPath)
        return cell
    }
}

// MARK: Tableview delegate

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UserDetailViewController(viewModel: viewModel.detailViewModel(for: indexPath))
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
