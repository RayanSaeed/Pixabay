//
//  PixabayImage.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation

struct PixabayImageSearchResponse: Decodable {
	let total: Int
	let totalHits: Int
	let hits: [PixabayImage]
}

struct PixabayImage: Codable {

	/// Unique ID of the Pixabay Image
	let id: Int

	/// Photo type: Possible values = {"photo", "illustration", "vector"}
	let type: String

	/// Photo tags: e.g "sunflower, flower, plant",
	let tags: String

	/// The url for webformat image
	let webformatURL: String

	/// Image dimensions for webformat
	let webformatWidth, webformatHeight: Int

	/// The url for large size image
	let largeImageURL: String

	/// Image dimensions for large image
	let imageWidth, imageHeight: Int

	/// Image download size in bytes
	let imageSize: Int

	/// Number of views the image has
	let views: Int

	/// Number of times the image was downloaded
	let downloads: Int
}
