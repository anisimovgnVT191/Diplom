import Foundation

@propertyWrapper
public struct DisplayItemCallback<Value>: Hashable {
    public var wrappedValue: Value
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    public func hash(into hasher: inout Hasher) {}
    
    public static func == (lhs: DisplayItemCallback<Value>, rhs: DisplayItemCallback<Value>) -> Bool {
        return true
    }
}
