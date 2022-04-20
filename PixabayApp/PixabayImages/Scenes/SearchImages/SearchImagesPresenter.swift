//
//  SearchImagesPresenter.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation

protocol SearchImagesPresentationLogic {
	func presentImages(response: SearchImages.Search.Response)
}

final class SearchImagesPresenter {
	var view: SearchImagesDisplayLogic?
}

extension SearchImagesPresenter: SearchImagesPresentationLogic {
	func presentImages(response: SearchImages.Search.Response) {
		let viewModel = SearchImages.Search.ViewModel(images: response.images)
		view?.displayImages(viewModel: viewModel)
	}
}
