# Valyrix iOS SDK

Official Swift Package Manager distribution repository for the **Valyrix iOS SDK**.

Valyrix is an ultra high-performance, real-time product analytics, crash reporting, session replay, and feature flagging platform built for mobile applications.

---

## 📦 Installation via Swift Package Manager

### In Xcode:
1. Open your project in Xcode.
2. Navigate to **File** > **Add Package Dependencies...**
3. Enter the repository URL in the search field:
   ```text
   https://github.com/valyrix-io/valyrix-ios.git
   ```
4. Under **Dependency Rule**, select **Up to Next Major Version** starting at `1.0.0`.
5. Click **Add Package** and link `Valyrix` to your application target.

---

### In `Package.swift`:
If you are developing a Swift package or modular framework, add `Valyrix` to your `dependencies`:

```swift
dependencies: [
    .package(url: "https://github.com/valyrix-io/valyrix-ios.git", from: "1.0.0")
]
```

And add it to your target:

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "Valyrix", package: "valyrix-ios")
    ]
)
```

---

## 🚀 Quick Start

### 1. Initialize the SDK
Initialize Valyrix in your SwiftUI `App` init or `AppDelegate`:

```swift
import SwiftUI
import Valyrix

@main
struct MyApp: App {
    init() {
        let config = ValyrixConfig(
            writeKey: "SDK-your-project-id-write-key",
            serverUrl: "https://api.valyrix.io", // Or your self-hosted instance
            flushIntervalSeconds: 30,
            trackLifecycleEvents: true,
            trackScreenViews: true,
            enableCrashReporting: true,
            enableFeatureFlags: true
        )
        Valyrix.initialize(config: config)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 2. Identify Users
Associate anonymous events with an authenticated user profile:

```swift
Valyrix.identify(userId: "usr_99812", traits: [
    "email": "user@example.com",
    "plan": "enterprise",
    "name": "Jane Doe"
])
```

### 3. Track Custom Events
Dispatch custom behavioral and telemetry events:

```swift
Valyrix.track("order_completed", properties: [
    "order_id": "ord_88219",
    "total_cents": 4999,
    "currency": "USD",
    "item_count": 3
])
```

### 4. Feature Flags & Experiments
Evaluate feature flags with sub-millisecond local cache reads:

```swift
if Valyrix.isFeatureEnabled("new_checkout_flow", defaultValue: false) {
    // Show upgraded experience
}
```

---

## 🔒 Security & Architecture

This package distributes the pre-compiled, ABI-stable `Valyrix.xcframework` binary target:
- Built with `BUILD_LIBRARY_FOR_DISTRIBUTION=YES` for Swift runtime evolution compatibility.
- Bitcode-free dual-architecture support: `iOS Device (arm64)` and `iOS Simulator (arm64 + x86_64)`.
- Includes full debugging symbols (`dSYM`) for stack trace symbolication.
- Zero required third-party package dependencies at consumer resolution time.
