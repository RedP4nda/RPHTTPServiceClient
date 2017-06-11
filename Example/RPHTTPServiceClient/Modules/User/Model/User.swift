//
//  User.swift
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

import ObjectMapper

class User: NSObject, Mappable {
    var login : String!
    var id : Int?
    var avatar_url : String?
    var gravatar_id : String?
    var url : String!
    var html_url : String!
    var repos_url : String?
    var type : String?
    var name : String!
    var company : String?
    var blog : String?
    var location : String?
    var email : String!
    var bio : String?
    var public_repos : Int!
    var public_gists : Int?
    var followers : Int?
    var following : Int?
    var created_at : String?
    var updated_at : String?

    override var description : String {
        return "login: \(login) \nname: \(name) \nrepos: \(public_repos) \nurl: \(html_url)"
    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        avatar_url <- map["avatar_url"]
        gravatar_id <- map["gravatar_id"]
        url <- map["url"]
        html_url <- map["html_url"]
        repos_url <- map["repos_url"]
        type <- map["type"]
        name <- map["name"]
        company <- map["company"]
        blog <- map["blog"]
        location <- map["location"]
        email <- map["email"]
        bio <- map["bio"]
        public_repos <- map["public_repos"]
        public_gists <- map["public_gists"]
        followers <- map["followers"]
        following <- map["following"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
    }
}
