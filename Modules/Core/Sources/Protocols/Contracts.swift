//
//  Contracts.swift
//  
//
//  Created by Miguel Angel on 08-05-21.
//

import SwiftUI

public protocol Router {
    func route(to destination: Destination) -> AnyView
}

public protocol ViewModel: ObservableObject {
    var router: Router { get }
}
