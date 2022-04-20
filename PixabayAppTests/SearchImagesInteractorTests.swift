//
//  SearchImagesInteractorTests.swift
//  PixabayAppTests
//
//  Created by Rayan Saeed on 20/04/2022.
//

import XCTest
@testable import PixabayApp

final class SearchImagesInteractorTests: XCTestCase {
	var sut: SearchImagesInteractorSpy!
	var presenterSpy: SearchImagesPresenterSpy!

	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = SearchImagesInteractorSpy()
		presenterSpy = SearchImagesPresenterSpy()
	}

	// MARK: - Test doubles
	class SearchImagesPresenterSpy: SearchImagesPresentationLogic {
		var images: [PixabayImage]?
		var presentImagesCalled = false

		func presentImages(response: SearchImages.Search.Response) {
			presentImagesCalled = true
			images = response.images
		}
	}

	class SearchImagesInteractorSpy: SearchImagesBusinessLogic {
		var presenter: SearchImagesPresenterSpy?

		func loadImages(request: SearchImages.Search.Request) {
			presenter?.presentImagesCalled = true
		}
	}

	// MARK: - Tests
	func testLoadImagesCallsPresenterToPresentImages() {
		// Given
		sut.presenter = presenterSpy

		// When
		let request = SearchImages.Search.Request(keyword: "panda")
		sut.loadImages(request: request)

		// Then
		XCTAssertTrue(
			self.presenterSpy.presentImagesCalled,
			"loadImages(request:) should ask the presenter to present the images that it loaded"
		)
	}

	override func tearDownWithError() throws {
		sut = nil
		presenterSpy = nil
		try super.tearDownWithError()
	}
}
