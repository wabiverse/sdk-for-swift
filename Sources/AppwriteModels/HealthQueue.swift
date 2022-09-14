
/// Health Queue
public class HealthQueue {

    /// Amount of actions in the queue.
    public let size: Int

    init(
        size: Int
    ) {
        self.size = size
    }

    public static func from(map: [String: Any]) -> HealthQueue {
        return HealthQueue(
            size: map["size"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "size": size as Any
        ]
    }
        
}
