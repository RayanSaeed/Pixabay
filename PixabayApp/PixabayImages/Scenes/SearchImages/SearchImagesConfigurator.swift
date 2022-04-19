//
//  SearchImagesConfigurator.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation
import SwiftUI

extension SearchImagesView {

	func configureView() -> some View {
		var view = self
		let interactor = SearchImagesInteractor()
		let router = SearchImagesRouter()
		let presenter = SearchImagesPresenter()
		view.interactor = interactor
		view.router = router
		interactor.presenter = presenter
		presenter.view = view

		return view
	}
}
