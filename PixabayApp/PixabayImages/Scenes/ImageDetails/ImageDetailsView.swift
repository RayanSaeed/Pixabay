//
//  ImageDetailsView.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import SwiftUI

protocol ImageDetailsDisplayLogic { }

extension ImageDetailsView: ImageDetailsDisplayLogic { }

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

				VStack(alignment: .leading) {
					HStack {
						Text("Views:")
							.titleStyle()
						Spacer()
						Text("Downloads:")
							.titleStyle()
						Spacer()
						Text("Image Size:")
							.titleStyle()
					}

					HStack {
						Text("\(image.views)")
						Spacer()
						Text("\(image.downloads)")
						Spacer()
						Text("\(self.getSizeInMegaBytes(image.imageSize)) MB")
					}

					VStack(alignment: .leading) {
						Text("Tags:")
							.titleStyle()
						Text(image.tags)
					}
					.padding(.top)

					Spacer()
				}
				.padding(.horizontal)

				Spacer()
			}
			.navigationBarTitle(Text("Image Details"), displayMode: .inline)
		}
    }

	private func getSizeInMegaBytes(_ sizeInBytes: Int) -> String {
		String(format: "%.2f", Double(sizeInBytes) / 1_000_000.0)
	}
}

extension ImageDetailsView {
	struct Title: ViewModifier {
		func body(content: Content) -> some View {
			content
				.font(.title3.weight(.bold))
				.multilineTextAlignment(.leading)
		}
	}
}

extension View {
	func titleStyle() -> some View {
		modifier(ImageDetailsView.Title())
	}
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
		ImageDetailsView(image: PixabayImage.sampleImage)
    }
}
