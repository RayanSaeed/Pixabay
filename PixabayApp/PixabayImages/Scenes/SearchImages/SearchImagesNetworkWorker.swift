//
//  SearchImagesNetworkWorker.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation
import Combine

final class SearchImagesNetworkWorker: CombineAPI {

	let session: URLSession

	init(configuration: URLSessionConfiguration) {
		self.session = URLSession(configuration: configuration)
	}

	convenience init() {
		self.init(configuration: .default)
	}

	func getImages(_ requestEndpoint: PixabayImagesEndpoint) -> AnyPublisher<[PixabayImage], Error> {
		execute(requestEndpoint.request, decodingType: [PixabayImage].self, retries: 2)
	}
}

enum PixabayImagesEndpoint {
	case search(_ keyword: String)
}

extension PixabayImagesEndpoint: Endpoint {

	var base: String { "https://pixabay.com/api/" }

	var path: String {
		switch self {
			case .search(let keyword):
				return "&q=\(keyword)"
			// we can add more switch cases here as needed
			// ...
		}
	}

	var apiKey: String {
		return "api_key=34a92f7d77a168fdcd9a46ee1863edf1"
	}
}
