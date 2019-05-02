//
//  UserService.swift
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

import RPHTTPServiceClient
import Moya
import Result

class UserService: RPServiceClient<UserServiceAPI> {

    init() {
        let provider = MoyaProvider<UserServiceAPI>()
        super.init(provider: provider)
    }

    func fetchUser(username: String, success: @escaping (User) -> Void, error: (Swift.Error) -> Void) -> Cancellable {

        let target = UserServiceAPI.getUserInfos(username: username)
        return super.requestObject(target: target, success: success) { (error) in
            print(error)
        }
    }

    func fetchUserRepos(username: String, result: @escaping (Result<[Repo], RPServiceClientError>) -> Void) -> Cancellable {

        let target = UserServiceAPI.getUserRepos(username: username)
        return super.requestArray(target: target, result: result)
    }
    
    func fetchEmojis(success: @escaping (Any) -> Void, error: (RPServiceClientError) -> Void) -> Cancellable {
        
        let target = UserServiceAPI.getEmojis()
        return super.requestJSON(target: target, success: success) { (error) in
            print(error)
        }
    }
    
    func fetchAuthUser(success: @escaping (User) -> Void, error: (RPServiceClientError) -> Void) -> Cancellable {
        
        let target = UserServiceAPI.getAuthUser()
        return super.requestObject(target: target, success: success) { (error) in
            switch error {
            case .RequestError(let statusCode, let json):
                print("Error occured with statusCode: \(statusCode), error: \(json)")
            case .JSONParsing(let cause):
                print(cause)
            case .InvalidMapping(let json):
                print(json)
            case .RequestFailure(_, let cause):
                print("cause: \(cause)")
            }
        }
    }


}
