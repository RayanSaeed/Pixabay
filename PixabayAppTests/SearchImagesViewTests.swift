//
//  SearchImagesViewTests.swift
//  PixabayAppTests
//
//  Created by Rayan Saeed on 20/04/2022.
//

import XCTest
@testable import PixabayApp

class SearchImageViewTests: XCTestCase {
	var sut: SearchImagesView!
	var interactorSpy: SearchImagesInteractorSpy!

	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = SearchImagesView()
		interactorSpy = SearchImagesInteractorSpy()
	}

	// MARK: - Test doubles
	class SearchImagesInteractorSpy: SearchImagesBusinessLogic {
		var loadImagesCalled = false

		func loadImages(request: SearchImages.Search.Request) {
			loadImagesCalled = true
		}
	}

	// MARK: - Tests
	func testShouldLoadImagesOnSearchButtonTapped() {
		// Given
		sut.interactor = interactorSpy

		// When
		sut.fetchImages(keyword: "panda")

		// Then
		XCTAssertTrue(
			interactorSpy.loadImagesCalled,
			"fetchImages() should ask the interactor to load the images"
		)
	}

	override func tearDownWithError() throws {
		sut = nil
		interactorSpy = nil
		try super.tearDownWithError()
	}
}
