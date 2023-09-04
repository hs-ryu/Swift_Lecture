//
//  main.swift
//  First
//
//  Created by ryu hyunsun on 2023/09/04.
//

import Foundation
import UIKit

let argc = CommandLine.argc
let argv = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>?.self, capacity: Int(CommandLine.argc))

UIApplicationMain(argc, argv, nil, NSStringFromClass(AppDelegate.self))
