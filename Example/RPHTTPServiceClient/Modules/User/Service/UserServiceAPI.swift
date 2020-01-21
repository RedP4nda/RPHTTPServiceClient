//
//  UserServiceAPI.swift
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
import Moya

// Github public API
enum UserServiceAPI {
    case getUserInfos(username: String)
    case getUserRepos(username: String)
    case getEmojis
    case getAuthUser
}

// MARK: - TargetType Protocol Implementation
extension UserServiceAPI : TargetType {
    var headers: [String : String]? {
        switch self {
        case .getUserInfos(_), .getUserRepos(_), .getEmojis, .getAuthUser:
            return nil
        }

    }
    

    var baseURL: URL { return URL(string: "https://api.github.com")! }
    var path: String {
        switch self {
        case .getUserInfos(let username):
            return "/users/\(username)"
        case .getUserRepos(let username):
            return "/users/\(username)/repos"
        case .getEmojis:
            return "/emojis"
        case .getAuthUser:
            return "/user"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getUserInfos, .getUserRepos, .getEmojis, .getAuthUser:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getUserInfos, .getUserRepos, .getEmojis, .getAuthUser:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getUserInfos, .getUserRepos, .getEmojis, .getAuthUser:
            return URLEncoding()
        }
    }

    var sampleData: Data {
        switch self {
        case .getUserInfos, .getUserRepos, .getEmojis, .getAuthUser:
            return "".data(using: .utf8)!
        }
    }

    var task: Task {
        switch self {
        case .getUserInfos, .getUserRepos, .getEmojis, .getAuthUser:
            return .requestPlain
        }
    }


    var multipartBody: [MultipartFormData]? {
        switch self {
        case .getUserInfos, .getUserRepos, .getEmojis, .getAuthUser:
            return nil
        }
    }
}
