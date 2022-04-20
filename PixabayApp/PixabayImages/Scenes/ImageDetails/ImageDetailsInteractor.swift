//
//  ImageDetailsInteractor.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 19/04/2022.
//

import Foundation
import Combine

protocol ImageDetailsBusinessLogic { }

final class ImageDetailsInteractor {
	var presenter: ImageDetailsPresentationLogic?
}

extension ImageDetailsInteractor: ImageDetailsBusinessLogic { }
