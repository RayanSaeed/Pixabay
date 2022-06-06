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

	func getImages(_ requestEndpoint: PixabayImagesEndpoint) -> AnyPublisher<PixabayImageSearchResponse, Error> {
		execute(requestEndpoint.request, decodingType: PixabayImageSearchResponse.self, retries: 2)
	}
}

enum PixabayImagesEndpoint {
	case search(_ keyword: String)
}

extension PixabayImagesEndpoint: Endpoint {
	// example URL = https://pixabay.com/api/?key=26793717-02a1bcbc5523b161a6fc54f55&q=panda

	var apiKey: String { "26793717-02a1bcbc5523b161a6fc54f55" }

	var baseUrl: String { "https://pixabay.com" }

	var path: String { "/api" }

	var quertyItems: [URLQueryItem] {
		switch self {
			case .search(let keyword):
				return [
					.init(name: "key", value: apiKey),
					.init(name: "q", value: keyword)
				]
		}
	}
}
