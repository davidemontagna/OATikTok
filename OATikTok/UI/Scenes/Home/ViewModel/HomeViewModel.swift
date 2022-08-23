//
//  HomeViewModel.swift
//  OATikTok
//
//  Created by Davide Montagna on 01/08/22.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate{
    func onSucces(by useCase: HomeUseCases)
    func onFailure()
}

class HomeViewModel: NSObject {
    
    var delegate: HomeViewModelDelegate?
    
    // MARK: - Properties
    
    var uiitems: [HomeUIItem] {
        [HomeUIItem(title: "Cell 1", videoUrl: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")),
         HomeUIItem(title: "Cell 2", videoUrl: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")),
         HomeUIItem(title: "Cell 3", videoUrl: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"))]
    }
}
