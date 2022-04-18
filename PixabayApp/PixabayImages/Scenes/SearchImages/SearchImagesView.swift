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
		imagesDataStore.imageURLs = viewModel.images
	}

	func fetchImages(keyword: String) {
		let request = SearchImages.Search.Request(keyword: keyword)
		interactor?.loadImages(request: request)
	}
}

struct SearchImagesView: View {
	var interactor: SearchImagesBusinessLogic?

	@State private var searchText: String = ""
	@ObservedObject var imagesDataStore = ImagesDataStore()

	let gridSpacing = 3.0
	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]

	var body: some View {
		NavigationView{
			GeometryReader { geo in
				ScrollView {
					LazyVGrid(columns: columns, spacing: gridSpacing) {
						ForEach(imagesDataStore.imageURLs, id: \.self) { url in
							AsyncImage(
							   url: url,
							   placeholder: { Text("Loading ...") },
							   image: { Image(uiImage: $0).resizable() }
							)
							.frame(width: geo.size.width / 3, height: geo.size.width / 3)
							.background(.gray)
						}
					}
				}
			}
			.navigationBarTitle(Text("Pixabay Images"), displayMode: .inline)

		}
		.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
		.onSubmit(of: .search) {
			fetchImages(keyword: searchText)
		}
	}
}

struct SearchImagesView_Previews: PreviewProvider {
	static var previews: some View {
		SearchImagesView()
	}
}

