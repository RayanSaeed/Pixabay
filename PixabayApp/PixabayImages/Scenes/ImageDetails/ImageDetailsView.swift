//
//  ImageDetailsView.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import SwiftUI

protocol ImageDetailsDisplayLogic {
	func displayImages(viewModel: ImageDetails.Details.ViewModel)
}

extension ImageDetailsView: ImageDetailsDisplayLogic {
	func displayImages(viewModel: ImageDetails.Details.ViewModel) {
//		imagesDataStore.imageURLs = viewModel.images
	}

	func fetchImages(keyword: String) {
		let request = ImageDetails.Details.Request()
		interactor?.loadImages(request: request)
	}
}


struct ImageDetailsView: View {
	var interactor: ImageDetailsBusinessLogic?

	@State public var image: PixabayImage

    var body: some View {
		GeometryReader { geo in
			VStack {
				AsyncImage(
					url: URL(string: image.largeImageURL)!,
					placeholder: { ProgressView() },
					image: { Image(uiImage: $0).resizable() }
				)
				.aspectRatio(contentMode: .fill)
				.frame(width: geo.size.width, height: geo.size.height / 2)
				.clipped()

				Spacer()
			}
			.navigationBarTitle(Text("Image Details"), displayMode: .inline)
		}
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
		ImageDetailsView(image: PixabayImage.sampleImage)
    }
}
