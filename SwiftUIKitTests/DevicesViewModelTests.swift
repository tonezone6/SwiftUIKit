//
//  SwiftUIKitTests.swift
//  SwiftUIKitTests
//
//  Created by Alex Stratu on 22.02.2021.
//


import CombineExpectations
@testable
import SwiftUIKit
import XCTest

class DevicesViewModelTests: XCTestCase {
    
    func test_example_record() throws {
        let publisher = ["foo", "bar", "baz"].publisher
        let recorder = publisher.record()

        let elements = try recorder.elements.get()

        XCTAssertEqual(elements, ["foo", "bar", "baz"])
    }
}
