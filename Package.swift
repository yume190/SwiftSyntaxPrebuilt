// swift-tools-version: 5.7

import PackageDescription
import Foundation

let url = "https://github.com/yume190/SwiftSyntaxPrebuilt/releases/download/510.0.1"

func prebuiltTarget(name: String, checksum: String, dependencies: [Target.Dependency] = []) -> [Target] { [Target] {
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
        checksum: "7f8dac48da1a17ee8a673f9514a433af7af9bf8c0a65cf9f99c9d54f6c9d8ace",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacrosTestSupport",
        checksum: "1e4dff4165db75815f0cffa6ef36539e545f6e7cca369d381f1310c41629fd9f",
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
        checksum: "81ba9453122ddb521f836e80081833ca4c7c74744ae4e536d49de2f33d15b830",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftSyntaxMacroExpansion",
        checksum: "800701efddd4d3aeff770e389d3efbf630877621c3dfadde64a1d7706c806409",
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
        checksum: "d0a61bffe9733001a5a8777c8ef2e50eb6bbe622ea336defb6f5c45cfb6a0ef9",
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
        checksum: "659b62b445609ec0f4dedb9b70df7c30ab81ee6cdbc88fff448876a384ab87a1"
    ),
    prebuiltTarget(
        name: "SwiftSyntax509",
        checksum: "84e89a9dc535051efef44f5ac0d5b40bc434b53ea31c1289130cb78926377197"
    ),
    prebuiltTarget(
        name: "SwiftSyntax",
        checksum: "36e95daf91633fc5389646201682c6afbcdd0bb7995c518b3dbe55f52a1dbec1",
        dependencies: [
            "SwiftSyntax509_Aggregation",
            "SwiftSyntax510_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftRefactor",
        checksum: "a5b75468165300557f628efa18517d59a13aaebdc59a059803004a9d75060e70",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
            "SwiftSyntaxBuilder_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParserDiagnostics",
        checksum: "b6f69dfffc794eba2368d7916c30c73941989c836ad3b5c5c4ea911e454c8c8a",
        dependencies: [
            "SwiftBasicFormat_Aggregation",
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftParser",
        checksum: "06ffb269bae61d0dd42ee451a383a7ca17273bea1cf5c7a4d78b1a57ef629221",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftOperators",
        checksum: "1cccbea133c8e7baf25033e17fa82eafd1e819dbf2ae77903ae5c07183bf51c6",
        dependencies: [
            "SwiftDiagnostics_Aggregation",
            "SwiftParser_Aggregation",
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftIDEUtils",
        checksum: "b62f84623d3deb47ae15466fb4043112c7ea755ffa4edd5932ee106c0199a46c",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftDiagnostics",
        checksum: "cfbb992967313ba0afc2f5501324647a2cb7642c3d842b4910f8de95daa447b5",
        dependencies: [
            "SwiftSyntax_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftCompilerPluginMessageHandling",
        checksum: "18e6a00d10844ac2acd3302f4922e7707a3aa34984549bdf4c2cf95fe0c9367b",
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
        checksum: "a3cd3b016f0d5cc377e182a8d9f2f4ecf29d70bc387d3fcf3732a43278944eb8",
        dependencies: [
            "SwiftCompilerPluginMessageHandling_Aggregation",
            "SwiftSyntaxMacros_Aggregation",
        ]
    ),
    prebuiltTarget(
        name: "SwiftBasicFormat",
        checksum: "46bac6cc672b9becf444d75dca61f220f8ef452f9874bf17e09067aef0127330",
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