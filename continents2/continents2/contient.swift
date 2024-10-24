//
//  contient.swift
//  continents2
//
//  Created by Taksh Joshi on 23/10/24.
//

import Foundation
struct State {
    var state: String
}
struct Nation {
    var nation: String
    var states: [State]
}
struct Contient {
    var continent: String
    var nations: [Nation]
    
}
