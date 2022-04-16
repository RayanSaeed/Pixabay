//
//  SearchImagesInteractor.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation

protocol SearchImagesBusinessLogic {
	func loadImages(request: SearchImages.Search.Request)
}

class SearchImagesInteractor {
	var presenter: SearchImagesPresentationLogic?

//	let networkWorker = PixabaySearchAPI()
}

extension SearchImagesInteractor: SearchImagesBusinessLogic {
	func loadImages(request: SearchImages.Search.Request) {
		// Create
		let images: [PixabayImage]// = networkWorker.searchImages(with)
		let response = SearchImages.Search.Response(images: images)
		presenter?.presentImages(response: response)
	}
}

//final class MoviesProvider: ObservableObject {
//
//	// MARK:- Subscribers
//	private var cancellable: AnyCancellable?
//
//	// MARK:- Publishers
//	@Published var images: [MovieViewModel] = []
//
//	// MARK:- Private properties
//	private let client = MovieClient()
//
//	init() {
//		cancellable = client.getFeed(.nowPlaying)
//			.sink(receiveCompletion: { _ in }, receiveValue: {
//				self.movies = $0.results.map { MovieViewModel(movie: $0) }
//			})
//	}
//}
