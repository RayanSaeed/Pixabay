//
//  PixabayApp.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import SwiftUI

@main
struct PixabayApp: App {
    var body: some Scene {
        WindowGroup {
			SearchImagesView().configureView()
        }
    }
}
