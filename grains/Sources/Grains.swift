//Solution goes in Sources

import Foundation

enum GrainsError: Error {
    case inputTooLow(  message: String )
    case inputTooHigh( message: String )
}

func square( _ selector: Int ) throws -> UInt64 {
    switch selector {
        case 2...64:
            return Array( repeating: 2, count: selector - 1 ).reduce( 1, * )
        case ...0:
            throw GrainsError.inputTooLow(  message: errorMessage( forSelector: selector ) )
        case 65...:
            throw GrainsError.inputTooHigh( message: errorMessage( forSelector: selector ) )
        default:
            return 1
    }
}

func errorMessage( forSelector selector: Int ) -> String {
    return "Input[\(selector)] invalid. Input should be between 1 and 64 (inclusive)"
}

var total: UInt64 {
    return ( 1...64 ).map{ try! square( $0 ) }.reduce( 0, + )
}
