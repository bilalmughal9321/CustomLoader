# Custom Loading Animation

## Introduction

Introducing Swift Package dependencies involves integrating third-party libraries or your own custom packages into your Swift projects using Swift Package Manager (SPM).
Swift Package Manager is Apple's tool for managing the distribution of Swift code and is integrated into Xcode. Here's how you can introduce and manage Swift Package dependencies:

![](https://github.com/bilalmughal9321/CustomLoader/blob/main/resources/image.gif)

## Installation

### Using Swift Package Manager (SPM)

#### In Xcode

1. **Open Your Xcode Project:**
   - Open the Xcode project or workspace where you want to add the Swift package.

2. **Navigate to Swift Packages:**
   - Select your project file in the Xcode navigator.
   - Go to the "Package Dependencies" tab under your project settings.

3. **Add a Package:**
   - Click the “+” button to add a new package dependency.
   - Enter the following URL into the package repository field:
     ```
     https://github.com/bilalmughal9321/CustomLoader.git
     ```
   - Choose the version rules you want to apply (e.g., exact version, range, or branch).

4. **Add Package:**
   - Click "Add Package" to include it in your project.

#### Using Swift CLI

1. **Open Terminal:**
   - Navigate to your project directory.

2. **Edit `Package.swift`:**
   - Open the `Package.swift` file and add the package dependency:

     ```swift
     // swift-tools-version:5.3
     import PackageDescription

     let package = Package(
         name: "MySwiftPackage",
         dependencies: [
             .package(url: "https://github.com/bilalmughal9321/CustomLoader.git", from: "1.0.0")
         ],
         targets: [
             .target(
                 name: "MySwiftPackage",
                 dependencies: []
             ),
         ]
     )
     ```

3. **Update Dependencies:**
   - Run `swift package update` to fetch and resolve the new dependencies.
