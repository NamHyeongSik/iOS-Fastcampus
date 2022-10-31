//
//  Event.swift
//  Cafe
//
//  Created by HYEONG SIK NAM on 2022/08/09.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let description: String
}
