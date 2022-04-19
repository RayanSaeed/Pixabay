//
//  SearchImagesRouter.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 19/04/2022.
//

import Foundation
import SwiftUI

protocol SearchImagesRoutingLogic {
	associatedtype V: View
	func makeImageDetailsView(with pixabayImage: PixabayImage) -> V
}

class SearchImagesRouter: SearchImagesRoutingLogic {

	func makeImageDetailsView(with pixabayImage: PixabayImage) -> some View {
		let detailsView = ImageDetailsView(image: pixabayImage).configureView()
		return detailsView
	}
}
