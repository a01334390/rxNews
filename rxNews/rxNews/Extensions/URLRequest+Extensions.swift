//
//  URLRequest+Extensions.swift
//  rxNews
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct Resource<T:Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
                }.map { data -> T? in
            return try? JSONDecoder().decode(T.self, from: data)
        }
        .asObservable()
    }
}
