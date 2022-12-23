//
//  NetworkMonitorManager.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-10-13.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    private let workerQueue = DispatchQueue(label: "NetworkMonitorQueue")
    private let pathMonitor: NWPathMonitor
    var isConnected = false
    
    @Published var currentInterface: NWInterface.InterfaceType = .wifi
    
    init() {
        pathMonitor = NWPathMonitor()
        self.start()
    }
    
    func start() {
        pathMonitor.pathUpdateHandler = { [weak self] path in
            //            print(path.status)
            //            if path.usesInterfaceType(.wifi) {
            //                print ("WIFI")
            //            } else if path.usesInterfaceType(.cellular) {
            //                print ("Cellular")
            //            }
            //                Task {
            //                    await MainActor.run {
            //                        self.objectWillChange.send()
            //                    }
            //                }
            self?.isConnected = path.status == .satisfied
            guard let interface = NWInterface.InterfaceType.allCases.filter({ path.usesInterfaceType($0)}).first else {
                return
            }
            DispatchQueue.main.async {
                self?.currentInterface = interface
            }
        }
        pathMonitor.start (queue: workerQueue)
    }
    
    func stop() {
    }
}

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .other, .wifi, .cellular, .loopback, .wiredEthernet
    ]
}


