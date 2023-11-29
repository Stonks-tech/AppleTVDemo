//
//  Container.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import Foundation
import Swinject

extension Container {
    func initializeModules() {
        self.initializeDataModules()
        self.initializeSelectionModules()
        self.initializePlayerModules()
    }
    
    private func initializeSelectionModules() {
        self.register(SelectionViewModel.self) { r in
            SelectionViewModel(showsRepository: self.resolve(ShowsRepository.self)!, showMapper: self.resolve(ShowDataToPresentationMapper.self)!)
        }.inObjectScope(.container)
    }
    
    private func initializeDataModules() {
        self.register(ShowDataToPresentationMapper.self, factory: {r in
            ShowDataToPresentationMapper()
        }).inObjectScope(.container)
        self.register(ShowsRepository.self, factory: {r in
            ShowsRepository()
        }).inObjectScope(.container)
    }
    
    private func initializePlayerModules() {
        self.register(
            PlayerViewModel.self,
            factory: {r in
                PlayerViewModel(
                    showsRepository: self.resolve(ShowsRepository.self)!,
                    showMapper: self.resolve(ShowDataToPresentationMapper.self)!
                )
            }
        )
    }
}
