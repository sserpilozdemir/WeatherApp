//
//  NetworkMonitor.swift
//  SwiftWeatherApp
//
//

import Foundation
import Network

//internet conn check
final class NetworkMonitor: ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")

    @Published var isNotConnected = false
    
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isNotConnected = path.status == .satisfied ? false : true
            }
        }
        monitor.start(queue: queue)
    }
}
