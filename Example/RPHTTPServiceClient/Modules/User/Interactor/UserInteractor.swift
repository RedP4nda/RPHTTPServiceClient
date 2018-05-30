//
//  UserInteractor.swift
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

class UserInteractor: UserInteractorInput {
    weak var output: UserInteractorOutput!


    func getUser(username: String) {
       _ = UserService().fetchUser(username: username, success: { (user) in
            self.output.presentUser(user: user)
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    func getUserRepos(username: String, completion: @escaping ([Repo]) -> Void) {
       _ = UserService().fetchUserRepos(username: username, success: { (repos) in
            completion(repos)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func getEmojis(completion: @escaping (Any) -> Void) {
        _ = UserService().fetchEmojis(success: { (json) in
            completion(json)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func getAuthUser(completion: @escaping (User) -> Void) {
        _ = UserService().fetchAuthUser(success: { (user) in
            completion(user)
        }, error: { (error) in
            print(error.localizedDescription)
        })
    }




}
