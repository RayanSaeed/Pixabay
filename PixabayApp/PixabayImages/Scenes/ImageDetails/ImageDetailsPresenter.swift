//
//  ImageDetailsPresenter.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 19/04/2022.
//

import Foundation

protocol ImageDetailsPresentationLogic {
	func presentImageDetails(response: ImageDetails.Details.Response)
}

class ImageDetailsPresenter {
	var view: ImageDetailsDisplayLogic?
}

extension ImageDetailsPresenter: ImageDetailsPresentationLogic {
	func presentImageDetails(response: ImageDetails.Details.Response) { }
}
