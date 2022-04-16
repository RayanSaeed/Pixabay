//
//  Endpoint.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation

protocol Endpoint {
	var base: String { get }
	var path: String { get }
}

extension Endpoint {
	var urlComponents: URLComponents {
		var components = URLComponents(string: base)!
		components.path = path
		components.query = apiKey
		return components
	}

	var request: URLRequest {
		let url = urlComponents.url!
		return URLRequest(url: url)
	}
}