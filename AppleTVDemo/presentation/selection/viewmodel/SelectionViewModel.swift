//
//  SelectionViewModel.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import Foundation

class SelectionViewModel: ObservableObject {
    @Published private(set) var state: SelectionState = SelectionState(shows: [], movies: [])
    private let _showsRepository: ShowsRepository
    private let _showMapper: ShowDataToPresentationMapper
    
    init(showsRepository: ShowsRepository, showMapper: ShowDataToPresentationMapper) {
        self._showsRepository = showsRepository
        self._showMapper = showMapper
    }
    
    func loadData() {
        state = SelectionState(
            shows: _showsRepository.getShows().map{ show in return _showMapper.map(show)},
            movies: _showsRepository.getMovies().map{ show in return _showMapper.map(show)}
        )
    }
}
