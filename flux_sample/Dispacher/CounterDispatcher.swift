//
//  CounterDispacher.swift
//  flux_sample
//
//  Created by 林 明虎 on 2025/01/05.
//

final class CounterDispatcher {
    static let shared = CounterDispatcher()
    private init() {}
    
    private var actionHandlers: [(CounterAction) -> Void] = []
    
    func register(actionHandler: @escaping (CounterAction) -> Void) {
        actionHandlers.append(actionHandler)
    }
    
    func dispatch(action: CounterAction) {
        actionHandlers.forEach { $0(action) }
    }
}
