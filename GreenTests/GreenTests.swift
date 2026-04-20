//
//  GreenTests.swift
//  GreenTests
//
//  Created by Teyit Ajimamatov on 20/4/26.
//

import Testing
import Foundation
@testable import Green

struct GreenTests {

    // Test 1: Item initializes with correct timestamp
    @Test func itemInitializesWithTimestamp() async throws {
        let date = Date()
        let item = Item(timestamp: date)
        #expect(item.timestamp == date)
    }

    // Test 2: Two items with same timestamp value match
    @Test func twoItemsWithSameTimestamp() async throws {
        let date = Date(timeIntervalSince1970: 1000)
        let item1 = Item(timestamp: date)
        let item2 = Item(timestamp: date)
        #expect(item1.timestamp == item2.timestamp)
    }

    // Test 3: Item timestamp can be updated
    @Test func itemTimestampCanBeUpdated() async throws {
        let item = Item(timestamp: Date(timeIntervalSince1970: 0))
        let newDate = Date(timeIntervalSince1970: 9999)
        item.timestamp = newDate
        #expect(item.timestamp == newDate)
    }

    // Test 4: Item timestamp is not epoch when given now
    @Test func itemTimestampIsNotEpoch() async throws {
        let item = Item(timestamp: Date())
        #expect(item.timestamp.timeIntervalSince1970 > 0)
    }

    // Test 5: Past date is before now
    @Test func pastDateIsBeforeNow() async throws {
        let past = Date(timeIntervalSinceNow: -3600)
        let item = Item(timestamp: past)
        #expect(item.timestamp < Date())
    }

    // Test 6: Future date is after now
    @Test func futureDateIsAfterNow() async throws {
        let future = Date(timeIntervalSinceNow: 3600)
        let item = Item(timestamp: future)
        #expect(item.timestamp > Date())
    }

    // Test 7: Timestamp interval since epoch is positive for recent dates
    @Test func timestampIntervalIsPositive() async throws {
        let item = Item(timestamp: Date())
        #expect(item.timestamp.timeIntervalSince1970 > 0)
    }

    // Test 8: Two different dates are not equal
    @Test func twoDifferentDatesAreNotEqual() async throws {
        let item1 = Item(timestamp: Date(timeIntervalSince1970: 1000))
        let item2 = Item(timestamp: Date(timeIntervalSince1970: 2000))
        #expect(item1.timestamp != item2.timestamp)
    }

    // Test 9: Timestamp formatted string is not empty
    @Test func timestampFormattedStringIsNotEmpty() async throws {
        let item = Item(timestamp: Date())
        let formatted = item.timestamp.formatted()
        #expect(!formatted.isEmpty)
    }

    // Test 10: Timestamp advanced by one hour is greater than original
    @Test func timestampAdvancedByOneHour() async throws {
        let now = Date()
        let item = Item(timestamp: now)
        let advanced = item.timestamp.addingTimeInterval(3600)
        #expect(advanced > item.timestamp)
    }
}
