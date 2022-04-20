//
//  SearchImagesPresenterTests.swift
//  PixabayAppTests
//
//  Created by Rayan Saeed on 20/04/2022.
//

import XCTest
@testable import PixabayApp

final class SearchImagePresenterTests: XCTestCase {
	var sut: SearchImagesPresenter!
	var viewSpy: SearchImagesViewSpy!

	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = SearchImagesPresenter()
		viewSpy = SearchImagesViewSpy()
	}

	// MARK: - Test doubles
	final class SearchImagesViewSpy {}

	// MARK: - Tests

	override func tearDownWithError() throws {
		sut = nil
		viewSpy = nil
		try super.tearDownWithError()
	}
}
