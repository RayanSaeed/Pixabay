//
//  CombineAPI.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Combine
import Foundation

protocol CombineAPI {
	var session: URLSession { get }
	func execute<T>(_ request: URLRequest,
					decodingType: T.Type,
					qualityOfService: DispatchQoS.QoSClass,
					queue: DispatchQueue,
					decoder: JSONDecoder,
					retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

extension CombineAPI {

	func execute<T>(_ request: URLRequest,
					decodingType: T.Type,
					qualityOfService: DispatchQoS.QoSClass = .default,
					queue: DispatchQueue = .main,
					decoder: JSONDecoder = .init(),
					retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
		return session.dataTaskPublisher(for: request)
			.tryMap {
				guard let response = $0.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
					throw APIError.responseUnsuccessful
				}
				return $0.data
			}
			.subscribe(on: DispatchQueue.global(qos: qualityOfService))
			.receive(on: queue)
			.decode(type: T.self, decoder: decoder)
			.retry(retries)
			.eraseToAnyPublisher()
	}
}
