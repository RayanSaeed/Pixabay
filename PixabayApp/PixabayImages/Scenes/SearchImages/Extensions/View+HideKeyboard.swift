//
//  View+HideKeyboard.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 19/04/2022.
//

import SwiftUI

extension View {
	func hideKeyboard() {
		let resign = #selector(UIResponder.resignFirstResponder)
		UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
	}
}
