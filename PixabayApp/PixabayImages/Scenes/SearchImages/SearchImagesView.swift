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
		imagesDataStore.images = viewModel.images
	}

	func fetchImages(keyword: String) {
		let request = SearchImages.Search.Request(keyword: keyword)
		interactor?.loadImages(request: request)
	}
}

extension SearchImagesView {
	func linkBuilder<Content: View>(
		for image: PixabayImage,
		@ViewBuilder content: () -> Content
	) -> some View {
		NavigationLink(
			destination: router?.makeImageDetailsView(with: image)) {
				content()
			}
	}
}

struct SearchImagesView: View {
	var interactor: SearchImagesBusinessLogic?
	var router: SearchImagesRouter?

	@State private var searchText: String = ""
	@ObservedObject var imagesDataStore = ImagesDataStore()

	let gridSpacing = 3.0
	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]

	var body: some View {
		NavigationView {
			GeometryReader { geo in
				ScrollView {
					LazyVGrid(columns: columns, spacing: gridSpacing) {
						ForEach(imagesDataStore.images, id: \.id) { image in
							linkBuilder(for: image, content: {
								AsyncImage(
									url: URL(string: image.webformatURL)!,
									placeholder: { ProgressView() },
									image: { Image(uiImage: $0).resizable() }
								)
								.aspectRatio(contentMode: .fill)
								.frame(width: geo.size.width / 3, height: geo.size.width / 3)
								.clipped()
							})
						}
					}
				}
				.gesture(DragGesture().onChanged{ _ in hideKeyboard() })
			}
			.navigationBarTitle(Text("Pixabay Images"), displayMode: .automatic)

		}
		.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
		.onSubmit(of: .search) {
			fetchImages(keyword: searchText)
		}
	}
}

struct SearchImagesView_Previews: PreviewProvider {
	static var previews: some View {
		SearchImagesView().configureView()
	}
}
