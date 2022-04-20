//
//  ImageDetailsPresenter.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 19/04/2022.
//

import Foundation

protocol ImageDetailsPresentationLogic { }

final class ImageDetailsPresenter {
	var view: ImageDetailsDisplayLogic?
}

extension ImageDetailsPresenter: ImageDetailsPresentationLogic { }
