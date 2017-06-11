//
//  ErrorResult.swift
//
// Copyright (c) 2017 Florian PETIT <florianp37@me.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation
import ObjectMapper

/**
    This structure is used to wrap errors into ObjectMapper's Mappable objects
 */
public struct ErrorResult: Mappable {
    /// A String that identifies the type of error that occured
    public var error: String?

    /// An Int that identifies the code of error that occured
    public var code: Int?

    /// A String that identifies the description of error that occured
    public var description: String {
        if let code = code, let error = error {
            return "Error: \(error) Code: \(code)"
        } else if let error = error {
            return "Error: \(error)"
        } else if let code = code {
            return "Unknown error. Code: \(code)"
        } else {
            return "Unknown error"
        }
    }

    /**
     ObjectMapper's Mappable initializer.
     - parameter map: mapping
     */
    public init?(map: Map) { }

    /**
     ObjectMapper's BaseMappable mapping magic.
     - parameter map: mapping
     */
    public mutating func mapping(map: Map) {
        error <- map[Keys.error]
        code <- map[Keys.code]
    }

    /**
     Checks if the error is correctly formed. (i.e: with a code and error)
     - returns: Wether the error is valid or not.
     */
    public func isValidError() -> Bool {
        if let _ = code, let _ = error {
            return true
        }
        return false
    }
}

/**
 This extension is used to wrap static json keys to be mapped into the errors
 */
extension ErrorResult {
    struct Keys {
        static let error = "error"
        static let code = "code"
    }
}
