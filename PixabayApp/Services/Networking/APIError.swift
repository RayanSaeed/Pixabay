//
//  APIError.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation

enum APIError: Error {
	case requestFailed
	case invalidData
	case responseUnsuccessful
	case jsonParsingFailure
	case jsonConversionFailure

	var localizedDescription: String {
		switch self {
			case .requestFailed: return "Request Failed"
			case .invalidData: return "Invalid Data"
			case .responseUnsuccessful: return "Response Unsuccessful"
			case .jsonParsingFailure: return "JSON Parsing Failure"
			case .jsonConversionFailure: return "JSON Conversion Failure"
		}
	}
}
