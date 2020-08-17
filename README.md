RPHTTPServiceClient
============

[![Build Status](https://travis-ci.org/RedP4nda/RPHTTPServiceClient.svg?branch=main)](https://travis-ci.org/RedP4nda/RPHTTPServiceClient)
[![Twitter](https://img.shields.io/badge/twitter-@Florian_MrCloud-blue.svg?style=flat)](http://twitter.com/Florian_MrCloud)

# Disclaimer:

- This program is still under active development and in its early stage, consider that breaking changes and rewrites could occur before using it in a stable version.

RPHTTPServiceClient is a Type-safe JSON/HTTP client for iOS.

- [Features](#features)
- [The Basics](#the-basics)
- [Projects using RPHTTPServiceClient](#projects-using-RPHTTPServiceClient)
- [To Do](#to-do)
- [Contributing](#contributing)
- [Installation](#installation)

# Features:

# The Basics
RPHTTPServiceClient turns your JSON/HTTP API into a swift enum (built upon [Moya](https://github.com/Moya/Moya))


```swift
// Github public API
enum UserServiceAPI {
    case getUserInfos(username: String)
    case getUserRepos(username: String)
}

// MARK: - TargetType Protocol Implementation
extension UserServiceAPI : TargetType {

    var baseURL: URL { return URL(string: "https://api.github.com")! }
    var path: String {
        switch self {
        case .getUserInfos(let username):
            return "/users/\(username)"
        case .getUserRepos(let username):
            return "/users/\(username)/repos"
        }
    }
...
```
Check [UserServiceAPI.swift](https://github.com/RedP4nda/RPHTTPServiceClient/blob/master/Example/RPHTTPServiceClient/Modules/User/Service/UserServiceAPI.swift) for more infos

RPHTTPServiceClient uses [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper) in order to safely map your HTTP API calls into objects.

Consider the following [User]() Model:

```swift
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
```

Once your class implements `Mappable`, ObjectMapper allows you to easily convert to and from JSON.

Next you'll want to subclass `RPMoyaServiceClient` in order to automagically perform API calls and object mapping:

```swift
class UserService: RPMoyaServiceClient<UserServiceAPI> {

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
}
```

The `RPMoyaServiceClient.swift` class provides the required methods to perform the mapping actions
and return a single mapped object or an array of mapped objects
``` swift
// request and map a JSON String to a single object implementing ObjectMapper's Mappable Protocol
open func requestObject<T: Mappable>(target: Target, success: @escaping (_ result: T) -> Void, failure: @escaping (_ error: MoyaNetworkClientError) -> Void) -> Cancellable
// request and map a JSON String to an array of objects implementing ObjectMapper's Mappable Protocol
open func requestArray<T: Mappable>(target: Target, success: @escaping (_ result: [T]) -> Void, failure: @escaping (_ error: MoyaNetworkClientError) -> Void) -> Cancellable
```

`RPMoyaServiceClient.swift` API calls have a Cancellable return type, meaning you can use the returned
value of these calls to handle cancellation of requests

`RPMoyaServiceClient.swift` also automatically handle http status codes and return the appropriate
result of your request, be it the requested resource, a network error, or even an appropriate
JSON-wrapped error mapped into an object if this is what your API is serving.

For more details check out [RPMoyaServiceClient.swift](https://github.com/RedP4nda/RPHTTPServiceClient/blob/master/RPHTTPServiceClient/Classes/RPMoyaServiceClient.swift) implementation along with [ErrorResult.swift](https://github.com/RedP4nda/RPHTTPServiceClient/blob/master/RPHTTPServiceClient/Classes/ErrorResult.swift) and [MoyaNetworkClientError.swift](https://github.com/RedP4nda/RPHTTPServiceClient/blob/master/RPHTTPServiceClient/Classes/MoyaNetworkClientError.swift)


# Projects using RPHTTPServiceClient
-

If you have a project that utilizes, extends or provides tooling for RPHTTPServiceClient, please submit a PR with a link to your project in this section of the README.

# To Do
- Improve error handling. Perhaps using `throws`
-


# Installation
### Cocoapods
RPHTTPServiceClient can be added to your project using [CocoaPods](http://cocoapods.org) by adding the following lines to your `Podfile`:

```ruby

pod 'RPHTTPServiceClient', '~> 0.9'
```

## Contributors
[![MrCloud](https://avatars2.githubusercontent.com/u/486140?s=100)](https://github.com/MrCloud)

## Partner
<img src="https://github.com/MobileTribe/pandroid/raw/master/pandroid-doc/assets/partner/lm.jpg" width="100" height="100" />

# Contributing

Contributions are very welcome 👍😃.

Before submitting any pull request, please ensure you have run the included tests and they have passed. If you are including new functionality, please write test cases for it as well.
