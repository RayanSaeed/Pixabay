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
		self.images = viewModel.images
	}

	func fetchImages(keyword: String) {
		let request = SearchImages.Search.Request(keyword: keyword)
		interactor?.loadImages(request: request)
	}
}

struct SearchImagesView: View {
	var interactor: SearchImagesBusinessLogic?

	@State private var searchText: String = ""
	@State var images: [Image]?

	var body: some View {
		NavigationView{
			GeometryReader { geo in
				ScrollView {
					LazyVGrid(columns: [
						GridItem(.flexible()),
						GridItem(.flexible()),
						GridItem(.flexible())
					], spacing: 3) {
//						ForEach(images, \.self) { image in
						ForEach(0..<10) { _ in
							Image(systemName: "circle")
							.frame(width: geo.size.width / 3, height: geo.size.width / 3)
							.background(.gray)
						}
					}
				}
			}
			.navigationBarTitle(Text("Pixabay Images"), displayMode: .inline)

		}
		.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
	}
}

struct SearchImagesView_Previews: PreviewProvider {
	static var previews: some View {
		SearchImagesView()
	}
}

