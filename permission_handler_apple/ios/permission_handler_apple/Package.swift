// swift-tools-version: 5.9
import PackageDescription

let environmentVariables = ProcessInfo.processInfo.environment

let permissionDefines: [CSetting] = [
    .define("PERMISSION_EVENTS", to: environmentVariables["PERMISSION_EVENTS"] ?? "0"),
    .define("PERMISSION_EVENTS_FULL_ACCESS", to: environmentVariables["PERMISSION_EVENTS_FULL_ACCESS"] ?? "0"),
    .define("PERMISSION_REMINDERS", to: environmentVariables["PERMISSION_REMINDERS"] ?? "0"),
    .define("PERMISSION_CONTACTS", to: environmentVariables["PERMISSION_CONTACTS"] ?? "0"),
    .define("PERMISSION_CAMERA", to: environmentVariables["PERMISSION_CAMERA"] ?? "0"),
    .define("PERMISSION_MICROPHONE", to: environmentVariables["PERMISSION_MICROPHONE"] ?? "0"),
    .define("PERMISSION_SPEECH_RECOGNIZER", to: environmentVariables["PERMISSION_SPEECH_RECOGNIZER"] ?? "0"),
    .define("PERMISSION_PHOTOS", to: environmentVariables["PERMISSION_PHOTOS"] ?? "0"),
    .define("PERMISSION_LOCATION", to: environmentVariables["PERMISSION_LOCATION"] ?? "0"),
    .define("PERMISSION_LOCATION_WHENINUSE", to: environmentVariables["PERMISSION_LOCATION_WHENINUSE"] ?? "0"),
    .define("PERMISSION_NOTIFICATIONS", to: environmentVariables["PERMISSION_NOTIFICATIONS"] ?? "0"),
    .define("PERMISSION_MEDIA_LIBRARY", to: environmentVariables["PERMISSION_MEDIA_LIBRARY"] ?? "0"),
    .define("PERMISSION_SENSORS", to: environmentVariables["PERMISSION_SENSORS"] ?? "0"),
    .define("PERMISSION_BLUETOOTH", to: environmentVariables["PERMISSION_BLUETOOTH"] ?? "0"),
    .define("PERMISSION_APP_TRACKING_TRANSPARENCY", to: environmentVariables["PERMISSION_APP_TRACKING_TRANSPARENCY"] ?? "0"),
    .define("PERMISSION_CRITICAL_ALERTS", to: environmentVariables["PERMISSION_CRITICAL_ALERTS"] ?? "0")
]

let package = Package(
    name: "permission-handler-apple",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "permission-handler-apple",
            targets: ["permission-handler-apple"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "permission-handler-apple",
            dependencies: [],
            path: "Sources/permission_handler_apple",
            resources: [
                .copy("Resources/PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include/permission_handler_apple")
            ] + permissionDefines
        ),
    ]
)