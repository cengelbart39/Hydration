//
//  MonthTests.swift
//  LiquidusTests
//
//  Created by Christopher Engelbart on 5/27/22.
//

import XCTest
@testable import Liquidus

class MonthTests: XCTestCase {

    var month: Month!
    
    override func setUp() {
        self.month = Month(date: Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 8))!)
    }

    override func tearDown() {
        self.month = nil
    }
    
    func testDateConstructor() {
        let expected = Month()
        expected.data = april2022()
        expected.description = "Apr 2022"
        expected.accessibilityDescription = "April 2022"
        
        XCTAssertEqual(self.month, expected)
    }
    
    func testFirstDay() {
        let result = month.firstDay()
        
        let expected = Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 1))!
        
        XCTAssertEqual(result, expected)
    }
    
    func testLastDay() {
        let result = month.lastDay()
        
        let expected = Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 30))!
        
        XCTAssertEqual(result, expected)
    }
    
    func testPrevMonth() {
        let expected = Month()
        expected.data = march2022()
        expected.description = "Mar 2022"
        expected.accessibilityDescription = "March 2022"
        
        month.prevMonth()
        
        XCTAssertEqual(self.month, expected)
    }
    
    func testNextMonth() {
        let expected = Month()
        expected.data = may2022()
        expected.description = "May 2022"
        expected.accessibilityDescription = "May 2022"
        
        month.nextMonth()
        
        XCTAssertEqual(self.month, expected)
    }
    
    func testIsNextMonth() {
        XCTAssertTrue(Month().isNextMonth())
        
        XCTAssertFalse(self.month.isNextMonth())
    }
    
    func testEqutable() {
        let month1 = self.month!
        let month2 = self.month!
        XCTAssertTrue(month1 == month2)
        
        let month3 = Month()
        XCTAssertFalse(month1 == month3)
        XCTAssertFalse(month2 == month3)
    }
    
    private func march2022() -> [Date] {
        return [
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 1))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 2))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 3))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 4))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 5))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 6))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 7))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 8))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 9))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 10))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 11))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 12))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 13))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 14))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 15))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 16))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 17))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 18))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 19))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 20))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 21))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 22))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 23))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 24))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 25))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 26))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 27))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 28))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 29))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 30))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 3, day: 31))!
        ]
    }
    
    private func april2022() -> [Date] {
        return [
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 1))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 2))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 3))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 4))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 5))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 6))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 7))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 8))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 9))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 10))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 11))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 12))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 13))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 14))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 15))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 16))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 17))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 18))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 19))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 20))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 21))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 22))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 23))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 24))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 25))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 26))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 27))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 28))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 29))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 30))!
        ]
    }

    private func may2022() -> [Date] {
        return [
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 1))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 2))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 3))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 4))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 5))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 6))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 7))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 8))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 9))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 10))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 11))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 12))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 13))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 14))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 15))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 16))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 17))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 18))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 19))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 20))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 21))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 22))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 23))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 24))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 25))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 26))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 27))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 28))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 29))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 30))!,
            Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 31))!
        ]
    }
}
