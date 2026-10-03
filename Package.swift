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
            checksum: "80545af402fd990a48c71b960f5e490a3c608131eca49f2a302a2f83dc965504"
        ),
    ]
)
