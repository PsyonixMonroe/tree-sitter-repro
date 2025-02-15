import XCTest
import SwiftTreeSitter
import TreeSitterRepro

final class TreeSitterReproTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_repro())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Repro grammar")
    }
}
