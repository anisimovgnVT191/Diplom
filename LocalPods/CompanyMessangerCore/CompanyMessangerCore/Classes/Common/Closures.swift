import Foundation

public typealias Closure<Arguments, Result> = (Arguments) -> Result

public typealias ClosureVoid = () -> Void

public typealias ArgumentsClosure<Arguments> = (Arguments) -> Void

public typealias ResultClosure<Result> = () -> Result
