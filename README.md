# AppwriteServer Swift SDK

![Swift Package Manager](https://img.shields.io/github/v/release/AppwriteServer/sdk-for-swift.svg?color=green&style=flat-square)
![License](https://img.shields.io/github/license/AppwriteServer/sdk-for-swift.svg?style=flat-square)
![Version](https://img.shields.io/badge/api%20version-1.3.0-blue.svg?style=flat-square)
[![Build Status](https://img.shields.io/travis/com/AppwriteServer/sdk-generator?style=flat-square)](https://travis-ci.com/AppwriteServer/sdk-generator)
[![Twitter Account](https://img.shields.io/twitter/follow/AppwriteServer?color=00acee&label=twitter&style=flat-square)](https://twitter.com/AppwriteServer)
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://AppwriteServer.io/discord)

**This SDK is compatible with AppwriteServer server version 1.3.x. For older versions, please check [previous releases](https://github.com/AppwriteServer/sdk-for-swift/releases).**

 > This is the Swift SDK for integrating with AppwriteServer from your Swift server-side code. If you're looking for the Apple SDK you should check [AppwriteServer/sdk-for-apple](https://github.com/AppwriteServer/sdk-for-apple)

AppwriteServer is an open-source backend as a service server that abstract and simplify complex and repetitive development tasks behind a very simple to use REST API. AppwriteServer aims to help you develop your apps faster and in a more secure way. Use the Swift SDK to integrate your app with the AppwriteServer server to easily start interacting with all of AppwriteServer backend APIs and tools. For full API documentation and tutorials go to [https://AppwriteServer.io/docs](https://AppwriteServer.io/docs)

![AppwriteServer](https://AppwriteServer.io/images/github.png)

## Installation

### Xcode with Swift Package Manager

The AppwriteServer Swift SDK is available via Swift Package Manager. In order to use the AppwriteServer Swift SDK from Xcode, select File > **Add Packages**

In the dialog that appears, enter the AppwriteServer Swift SDK [package URL](git@github.com:AppwriteServer/sdk-for-swift.git) in the search field. Once found, select `sdk-for-apple`.

On the right, select your version rules and ensure your desired target is selected in the **Add to Project** field.

Now click add package and you're done!

### Swift Package Manager

Add the package to your `Package.swift` dependencies:

```swift
    dependencies: [
        .package(url: "git@github.com:AppwriteServer/sdk-for-swift.git", from: "2.0.0"),
    ],
```

Then add it to your target:

```swift
    targets: [
        .target(
            name: "YourAppTarget",
            dependencies: [
                .product(name: "", package: "sdk-for-swift")
            ]
        ),
```


## Getting Started

### Init your SDK

Initialize your SDK with your AppwriteServer server API endpoint and project ID which can be found in your project settings page and your new API secret Key project API keys section.

```swift
import AppwriteServer

func main() {
    let client = Client()
        .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
        .setProject("5df5acd0d48c2") // Your project ID
        .setKey("919c2d184...a2ae413dad2") // Your secret API key
        .setSelfSigned() // Use only on dev mode with a self-signed SSL cert
}
```

### Make Your First Request

Once your SDK object is initialized, create any of the AppwriteServer service objects and choose any request to send. Full documentation for any service method you would like to use can be found in your SDK documentation or in the [API References](https://AppwriteServer.io/docs) section.

```swift
let users = Users(client)

do {
    let user = try await users.create(
        userId: ID.unique(), 
        email: "email@example.com", 
        password: "password"
    )
    print(String(describing: user.toMap()))
} catch {
    print(error.localizedDescription)
}
```

### Full Example

```swift
import AppwriteServer

func main() {
    let client = Client()
        .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
        .setProject("5df5acd0d48c2") // Your project ID
        .setKey("919c2d18fb5d4...a2ae413da83346ad2") // Your secret API key
        .setSelfSigned() // Use only on dev mode with a self-signed SSL cert

    let users = Users(client)
    
    do {
        let user = try await users.create(
            userId: ID.unique(), 
            email: "email@example.com", 
            password: "password"
        )
        print(String(describing: user.toMap()))
    } catch {
        print(error.localizedDescription)
    }
}
```

### Error Handling

When an error occurs, the AppwriteServer Swift SDK throws an `AppwriteServerError` object with `message` and `code` properties. You can handle any errors in a catch block and present the `message` or `localizedDescription` to the user or handle it yourself based on the provided error information. Below is an example.

```swift
import AppwriteServer

func main() {
    let users = Users(client)
    
    do {
        let users = try await users.list()
        print(String(describing: users.toMap()))
    } catch {
        print(error.localizedDescription)
    }
}
```

### Learn more

You can use the following resources to learn more and get help

- 🚀 [Getting Started Tutorial](https://AppwriteServer.io/docs/getting-started-for-server)
- 📜 [AppwriteServer Docs](https://AppwriteServer.io/docs)
- 💬 [Discord Community](https://AppwriteServer.io/discord)
- 🚂 [AppwriteServer Swift Playground](https://github.com/AppwriteServer/playground-for-swift-server)


## Contribution

This library is auto-generated by AppwriteServer custom [SDK Generator](https://github.com/AppwriteServer/sdk-generator). To learn more about how you can help us improve this SDK, please check the [contribution guide](https://github.com/AppwriteServer/sdk-generator/blob/master/CONTRIBUTING.md) before sending a pull-request.

## License

Please see the [BSD-3-Clause license](https://raw.githubusercontent.com/AppwriteServer/AppwriteServer/master/LICENSE) file for more information.