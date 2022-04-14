//
//  SearchImagesView.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import SwiftUI

protocol SearchImagesDisplayLogic {
	func displayImages(viewModel: SearchImages.Search.ViewModel)
}

extension SearchImagesView: SearchImagesDisplayLogic {
	func displayImages(viewModel: SearchImages.Search.ViewModel) {
		// self.images = viewModel.images
	}

	func fetchImages(keyword: String) {
		let request = SearchImages.Search.Request(keyword: keyword)
		interactor?.loadImages(request: request)
	}
}

struct SearchImagesView: View {
	var interactor: SearchImagesBusinessLogic?

    var body: some View {
		VStack {
			Text("Hello, World!")
		}
    }
}

struct SearchImagesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchImagesView()
    }
}
