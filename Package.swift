// swift-tools-version: 5.10

import PackageDescription
import Foundation

let url = "https://github.com/yume190/SwiftSyntaxPrebuilt/releases/download/510.0.1"

func prebuiltTarget(name: String, checksum: String, dependencies: [Target.Dependency] = []) -> [Target] {
    return [
        .binaryTarget(
            name: name,
            url: "\(url)/\(name).xcframework.zip",
            checksum: checksum
        ),
        .target(
            name: "\(name)_Aggregation",
            dependencies: [
                .target(name: name),
            ] + dependencies
        ),
    ]
}

let targets: [[Target]] = [
    prebuiltTarget(
        name: "_SwiftSyntaxTestSupport",
        checksum: "6dbda6902fe7d62ed6f42430f0c04a002bb95b456d5e36f0c3ee83b17e90c882",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacrosTestSupport",
        checksum: "954ddf82dfbefa74230afe51f89f485d1ba4569fe56af837a54c5a1efd24b603",
        dependencies: [
            "_SwiftSyntaxTestSupport_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacros",
        checksum: "561a7e336778fd41ba96ebd7b827abba57f3da330816e5b66d8a054215e2c032",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacroExpansion",
        checksum: "450a9837785bed957749902609748c11613ce6019b83e79875b0947c551a1420",
        dependencies: [
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftOperators_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxBuilder",
        checksum: "672a8abb14ab43bc131c75d837fb2c1a80f5484aec335b152a088fb4754459fe",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParserDiagnostics_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntax510",
        checksum: "4b2f81c7f00a1e67f165f1e281433d5b8ddf8d09daee2c29325a08257ac1187e"
    ),
    prebuiltTarget(
        name: "SwiftSyntax509",
        checksum: "1f9ac16311495d65de4785f7d4f4ccdbf3175aff4e32def1cdd0bb1fd41c751d"
    ),
    prebuiltTarget(
        name: "SwiftSyntax",
        checksum: "bb52e685d9a4837909eb3521858448d32c8d40cc0db3707b7bcf2e1b9c9c6ce7",
        dependencies: [
            "SwiftSyntax509_Aggregation",
            "SwiftSyntax510_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftRefactor",
        checksum: "159dd2da5b9d00a9b32879534353b23a563237d5fd760a4f0694a5863266a28f",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParserDiagnostics",
        checksum: "c3cd9e9ef3cfb79fab3583c85b33803eca57edabfa4301019318e3fc89f02fac",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParser",
        checksum: "f9bdcad4e1b8b1c0b9b7d9e887a1f1489d37bc6a3550cbb75c2b76c406d3d11b",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftOperators",
        checksum: "a56a6555246c47b70b74c3dcd14fda84b0ca700b347115161ee4adae48b2a280",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftIDEUtils",
        checksum: "58c3588e2894b598c263f57ee576bea515c4f138d07a47e58ca3effff97cb0d2",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftDiagnostics",
        checksum: "bd56c7638fac8b8bf64ce24be86d21bcb48100ab6001987517a15628ff13456e",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPluginMessageHandling",
        checksum: "d9ee641473130564a6356014d659f3ee87e3a8aec7789c2ed04bcc169c16e192",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftOperators_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
            "SwiftSyntaxMacroExpansion_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPlugin",
        checksum: "1321fc51e67e1e9281bd7552e9c5a7e2f9208c75e321914deb000136f6ca0a09",
        dependencies: [
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftBasicFormat",
        checksum: "855e0117f11008df891e458de5db07c53b72d3684d57c208752c78382330ea72",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
]

let package = Package(
    name: "swift-syntax",
    // platforms: [],
    products: [
        .library(
            name: "SwiftBasicFormat",
            targets: [
                "SwiftBasicFormat_Aggregation",
            ]),
        .library(
            name: "SwiftCompilerPlugin",
            targets: [
                "SwiftCompilerPlugin_Aggregation",
            ]),
        .library(
            name: "SwiftCompilerPluginMessageHandling",
            targets: [
                "SwiftCompilerPluginMessageHandling_Aggregation",
            ]),
        .library(
            name: "SwiftDiagnostics",
            targets: [
                "SwiftDiagnostics_Aggregation",
            ]),
        .library(
            name: "SwiftIDEUtils",
            targets: [
                "SwiftIDEUtils_Aggregation",
            ]),
        .library(
            name: "SwiftOperators",
            targets: [
                "SwiftOperators_Aggregation",
            ]),
        .library(
            name: "SwiftParser",
            targets: [
                "SwiftParser_Aggregation",
            ]),
        .library(
            name: "SwiftParserDiagnostics",
            targets: [
                "SwiftParserDiagnostics_Aggregation",
            ]),
        .library(
            name: "SwiftRefactor",
            targets: [
                "SwiftRefactor_Aggregation",
            ]),
        .library(
            name: "SwiftSyntax",
            targets: [
                "SwiftSyntax_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxBuilder",
            targets: [
                "SwiftSyntaxBuilder_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxMacros",
            targets: [
                "SwiftSyntaxMacros_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxMacroExpansion",
            targets: [
                "SwiftSyntaxMacroExpansion_Aggregation",
            ]),
        .library(
            name: "SwiftSyntaxMacrosTestSupport",
            targets: [
                "SwiftSyntaxMacrosTestSupport_Aggregation",
            ]),
    ],
    dependencies: [

    ],
    targets: targets.flatMap { $0 }
)
