//
//  SearchImagesModel.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation
import SwiftUI

enum SearchImages {
	enum Search {
		struct Request {
			var keyword: String
		}

		struct Response {
			var images: [PixabayImage]
		}

		struct ViewModel {
			var images: [Image]
		}
	}
}

