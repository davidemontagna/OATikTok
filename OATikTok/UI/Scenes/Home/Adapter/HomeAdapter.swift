//
//  HomeAdapter.swift
//  OATikTok
//
//  Created by Davide Montagna on 01/08/22.
//

import Foundation
import UIKit
import AVKit

protocol HomeAdapterDelegate {
    func followUserTapped(at index: Int)
    func showDetailTapped(at index: Int)
    func showSettingsTapped(at index: Int)
    func shareWithUserTapped(at index: Int)
}

class HomeAdapter: NSObject {
    
    // MARK: - Delegate

    var delegate: HomeAdapterDelegate?
    
    // MARK: - Properties
    
    var uiitems: [HomeUIItem] = []
}

// MARK: - Extensions

extension HomeAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(for: PostTableViewCell.self, for: indexPath)
        let data = uiitems[indexPath.item]
        cell.configure(with: self, and: data, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let postCell = cell as? PostTableViewCell else { return }
        postCell.playVideo(player: postCell.player)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let postCell = cell as? PostTableViewCell else { return }
        postCell.stopVideo(player: postCell.player)
    }
}

extension HomeAdapter: UITableViewDelegate {
}

extension HomeAdapter: PostTableViewCellDelegate {    
    func followUserTapped(at index: Int) {
        delegate?.followUserTapped(at: index)
    }
    
    func showDetailTapped(at index: Int) {
        delegate?.showDetailTapped(at: index)
    }
    
    func showSettingsTapped(at index: Int) {
        delegate?.showSettingsTapped(at: index)
    }
    
    func shareWithUserTapped(at index: Int) {
        delegate?.shareWithUserTapped(at: index)
    }
}
