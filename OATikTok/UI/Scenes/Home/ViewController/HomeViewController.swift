//
//  ViewController.swift
//  OATikTok
//
//  Created by Davide Montagna on 01/08/22.
//

import UIKit

class HomeViewController: UIViewController {
       
    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Adapter
    
    lazy var adapter = HomeAdapter()
    
    // MARK: - ViewModel
    
    lazy var viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell
        tableView.register(cell: PostTableViewCell.self)
        adapter.uiitems = viewModel.uiitems
        adapter.delegate = self
        viewModel.delegate = self
        // Setup TableView
        tableView.delegate = adapter
        tableView.dataSource = adapter
    }
}

// MARK: - Extensions

extension HomeViewController: HomeAdapterDelegate {
    func followUserTapped(at index: Int) {
        print("followUserTapped")
    }
    
    func showDetailTapped(at index: Int) {
        print("showDetailTapped")
    }
    
    func showSettingsTapped(at index: Int) {
        print("showSettingsTapped")
    }
    
    func shareWithUserTapped(at index: Int) {
        print("shareWithUserTapped")
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func onSucces(by useCase: HomeUseCases) {
        switch useCase {
        case .followUser:
            print("User Followed")
        case .displayDetails:
            performSegue(withIdentifier: "show_detail", sender: nil)
        case .displaySetting:
            performSegue(withIdentifier: "show_settings", sender: nil)
        case .shareWithUser:
            print("Shared with user")
        }
        adapter.uiitems = viewModel.uiitems
        tableView.reloadData()
    }
    
    func onFailure() {
        print("error")
    }
}
