//
//  Inject.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import Foundation
import SwiftUI

@propertyWrapper
struct ViewModelInject<Component>: DynamicProperty where Component: ObservableObject {
    
    @ObservedObject
    private var viewModel: Component
    
    var wrappedValue: Component {
        get {
            return self.viewModel
        }
    }
    
    public var projectedValue: ObservedObject<Component>.Wrapper {
        return self.$viewModel
    }
    
    init() {
        self.viewModel = Resolver.shared.resolve(Component.self)
    }
}

@propertyWrapper
struct Inject<Component> {
    
    let wrappedValue: Component
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}
