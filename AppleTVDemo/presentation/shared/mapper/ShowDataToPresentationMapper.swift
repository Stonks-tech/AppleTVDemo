//
//  ShowDataToPresentationMapper.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import Foundation

class ShowDataToPresentationMapper {
    func map(_ show: ShowDataModel) -> ShowPresentationModel {
        return ShowPresentationModel(id: show.id, title: show.title, imageUrl: show.imageUrl, videoUrl: show.videoUrl)
    }
}
