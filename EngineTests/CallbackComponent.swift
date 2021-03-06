import Engine

final internal class CallbackComponent<T>: Component {
    let network: Network
    
    // Mark: - Callback
    typealias Callback = (T) -> Void
    private let callback: Callback
    
    init(_ network: Network, _ callback: Callback) {
        self.network = network
        self.callback = callback
    }
    
    // MARK: - Ports
    lazy var inPort: InPort<T> = InPort(self) { packet in
        self.callback(packet)
    }
}
