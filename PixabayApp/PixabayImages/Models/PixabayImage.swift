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

extension PixabayImage {
	static var sampleImage: PixabayImage { PixabayImage (
		id: 1236875,
		type: "photo",
		tags: "panda, panda bear, sleep",
		webformatURL: "https://pixabay.com/get/g1ed4a8f7dd774e1512a5f443183bee92bf8a02f511c0a1d525b069f018eea1bb894409c89ae54663140312262d142e770a93d45720f4f07292b9a4497f187d9c_640.jpg",
		webformatWidth: 640,
		webformatHeight: 426,
		largeImageURL: "https://pixabay.com/get/g95cb0048aca5fe02492404c2ebbf9ec2cb34f2ef1343842da44852476bcbb32222a935bb082c1b57d94a48dd6cd2f61a2da78303c8e24666e20a3dd73e496136_1280.jpg",
		imageWidth: 3456,
		imageHeight: 2304,
		imageSize: 1684392,
		views: 133409,
		downloads: 71463
	)}
}
