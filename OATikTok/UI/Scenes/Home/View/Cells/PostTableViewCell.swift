//
//  PostTableViewCell.swift
//  OATikTok
//
//  Created by Davide Montagna on 01/08/22.
//

import UIKit
import AVKit

protocol PostTableViewCellDelegate {
    func followUserTapped(at index: Int)
    func showDetailTapped(at index: Int)
    func showSettingsTapped(at index: Int)
    func shareWithUserTapped(at index: Int)
}

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    // MARK: - Delegate
    
    var delegate: PostTableViewCellDelegate?
    
    // MARK: - Properties
    
    var index: IndexPath!
    var player: AVPlayer!
    
    // MARK: - Public methods
    
    func configure(with delegate: PostTableViewCellDelegate, and post: HomeUIItem, at index: IndexPath) {
        self.index = index
        titleLabel.text = post.title
        if let url = post.videoUrl {
            player = AVPlayer(url: url)
            let layer = AVPlayerLayer(player: player)
            videoView.layer.addSublayer(layer)
            layer.frame = self.bounds
            layer.videoGravity = .resizeAspectFill
        }
        self.delegate = delegate
    }
    
    func playVideo(player: AVPlayer) {
        player.play()
    }
    
    func stopVideo(player: AVPlayer) {
        player.pause()
    }
    
    // MARK: - Actions
    
    @IBAction func buttonAPressed(_ sender: Any) {
        delegate?.followUserTapped(at: index.row)
    }
    
    @IBAction func buttonBPressed(_ sender: Any) {
        delegate?.showDetailTapped(at: index.row)
    }
    
    @IBAction func buttonCPressed(_ sender: Any) {
        delegate?.showSettingsTapped(at: index.row)
    }
    
    @IBAction func buttonDPressed(_ sender: Any) {
        delegate?.shareWithUserTapped(at: index.row)

    }
}
