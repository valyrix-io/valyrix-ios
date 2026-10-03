// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Valyrix",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "Valyrix",
            targets: ["Valyrix"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Valyrix",
            url: "https://github.com/valyrix-io/valyrix-ios/releases/download/1.0.0/Valyrix.xcframework.zip",
            checksum: "1d0a5d63c11099b16568c86f9ae39514c5e26bde6dd159636118e84ba61123a0"
        ),
    ]
)
