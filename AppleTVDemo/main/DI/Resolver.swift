//
//  Resolver.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import Foundation
import Swinject

class Resolver {
    static let shared = Resolver()
    private let container = Container()
    
    init() {
        container.initializeModules()
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        return container.resolve(T.self)!
    }
}
