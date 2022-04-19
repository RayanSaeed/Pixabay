//
//  ImageDetailsConfigurator.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 19/04/2022.
//

import Foundation
import SwiftUI

extension ImageDetailsView {

	func configureView() -> some View {
		var view = self
		let interactor = ImageDetailsInteractor()
		let presenter = ImageDetailsPresenter()
		view.interactor = interactor
		interactor.presenter = presenter
		presenter.view = view

		return view
	}
}
