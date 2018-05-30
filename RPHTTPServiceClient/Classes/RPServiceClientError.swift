//
//  RPServiceClientError.swift
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

/// this enum represents the errors that can occur using the NetworkClient
public enum RPServiceClientError: Swift.Error {
    /**
     JSON Parsing error.
     - parameter cause: cause of the error
     */
    case JSONParsing(cause: Swift.Error)

    /**
     Invalid Mapping error.
     - parameter json: the json the mapping intended to use
     */
    case InvalidMapping(json: Any)

    /**
     Request error, occurring when the API is returning a statusCode of 4xx
     - parameter cause: HTTP response status code
     - parameter json: the json wrapped error
     */
    case RequestError(statusCode: Int, json: Any)

    /**
     Request failure, occurring when the API is returning an error
     - parameter cause: HTTP response status code, if any
     - parameter cause: cause of the error
     */
    case RequestFailure(statusCode: Int?, cause: Swift.Error)
}
