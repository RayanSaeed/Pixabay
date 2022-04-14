//
//  SearchImagesConfigurator.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation

extension SearchImagesView {
	  func configureView() -> some View {
			var view = self
			let interactor = SearchImagesInteractor()
			let presenter = SearchImagesPresenter()
			view.interactor = interactor
			interactor.presenter = presenter
			presenter.view = view

			return view
	  }
}
