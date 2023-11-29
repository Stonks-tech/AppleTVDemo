//
//  PlayerViewModel.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import Foundation

class PlayerViewModel: ObservableObject {
    @Published private(set) var state: PlayerState = PlayerState(show: nil)
    private let showsRepository: ShowsRepository
    private let showMapper: ShowDataToPresentationMapper
    
    init(showsRepository: ShowsRepository, showMapper: ShowDataToPresentationMapper) {
        self.showsRepository = showsRepository
        self.showMapper = showMapper
    }
    
    func loadData(id: String) {
        state = PlayerState(show: showMapper.map(showsRepository.get(id: id)))
    }
}
