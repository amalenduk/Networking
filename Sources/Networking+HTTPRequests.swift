import Foundation

public extension Networking {
    
    /// GET request to the specified path.
    ///
    /// - Parameters:
    ///   - path: The path for the GET request.
    ///   - parameters: The parameters to be used, they will be serialized using Percent-encoding and appended to the URL.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func get(_ path: String, parameters: Any? = nil, cachingLevel: CachingLevel = .none, completion: @escaping (_ result: JSONResult) -> Void) -> String {
        let parameterType: ParameterType = parameters != nil ? .formURLEncoded : .none
        
        return handleJSONRequest(.get, path: path, cacheName: nil, parameterType: parameterType, parameters: parameters, responseType: .json, cachingLevel: cachingLevel, completion: completion)
    }
    
    /// Cancels the GET request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled GET request
    func cancelGET(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .get, url: url)
    }
}

public extension Networking {
    
    /// PATCH request to the specified path, using the provided parameters.
    ///
    /// - Parameters:
    ///   - path: The path for the PATCH request.
    ///   - parameterType: The parameters type to be used, by default is JSON.
    ///   - parameters: The parameters to be used, they will be serialized using the ParameterType, by default this is JSON.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func patch(_ path: String, parameterType: ParameterType = .json, parameters: Any? = nil, completion: @escaping (_ result: JSONResult) -> Void) -> String {
        return handleJSONRequest(.patch, path: path, cacheName: nil, parameterType: parameterType, parameters: parameters, responseType: .json, cachingLevel: .none, completion: completion)
    }
    
    /// Cancels the PATCH request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled PATCH request.
    func cancelPATCH(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .patch, url: url)
    }
}

public extension Networking {
    
    /// PUT request to the specified path, using the provided parameters.
    ///
    /// - Parameters:
    ///   - path: The path for the PUT request.
    ///   - parameterType: The parameters type to be used, by default is JSON.
    ///   - parameters: The parameters to be used, they will be serialized using the ParameterType, by default this is JSON.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func put(_ path: String, parameterType: ParameterType = .json, parameters: Any? = nil, completion: @escaping (_ result: JSONResult) -> Void) -> String {
        return handleJSONRequest(.put, path: path, cacheName: nil, parameterType: parameterType, parameters: parameters, responseType: .json, cachingLevel: .none, completion: completion)
    }
    
    /// Cancels the PUT request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled PUT request.
    func cancelPUT(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .put, url: url)
    }
}

public extension Networking {
    
    /// POST request to the specified path, using the provided parameters.
    ///
    /// - Parameters:
    ///   - path: The path for the POST request.
    ///   - parameterType: The parameters type to be used, by default is JSON.
    ///   - parameters: The parameters to be used, they will be serialized using the ParameterType, by default this is JSON.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func post(_ path: String, parameterType: ParameterType = .json, parameters: Any? = nil, completion: @escaping (_ result: JSONResult) -> Void) -> String {
        return handleJSONRequest(.post, path: path, cacheName: nil, parameterType: parameterType, parameters: parameters, responseType: .json, cachingLevel: .none, completion: completion)
    }
    
    /// POST request to the specified path, using the provided parameters.
    ///
    /// - Parameters:
    ///   - path: The path for the POST request.
    ///   - parameters: The parameters to be used, they will be serialized using the ParameterType, by default this is JSON.
    ///   - parts: The list of form data parts that will be sent in the request.
    ///   - completion: A closure that gets called when the POST request is completed, it contains a `JSON` object and an `NSError`.
    /// - Returns: The request identifier.
    @discardableResult
    func post(_ path: String, parameters: Any? = nil, parts: [FormDataPart], completion: @escaping (_ result: JSONResult) -> Void) -> String {
        return handleJSONRequest(.post, path: path, cacheName: nil, parameterType: .multipartFormData, parameters: parameters, parts: parts, responseType: .json, cachingLevel: .none, completion: completion)
    }
    
    /// Cancels the POST request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled POST request.
    func cancelPOST(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .post, url: url)
    }
}

public extension Networking {
    
    /// DELETE request to the specified path, using the provided parameters.
    ///
    /// - Parameters:
    ///   - path: The path for the DELETE request.
    ///   - parameters: The parameters to be used, they will be serialized using Percent-encoding and appended to the URL.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func delete(_ path: String, parameters: Any? = nil, completion: @escaping (_ result: JSONResult) -> Void) -> String {
        let parameterType: ParameterType = parameters != nil ? .formURLEncoded : .none
        return handleJSONRequest(.delete, path: path, cacheName: nil, parameterType: parameterType, parameters: parameters, responseType: .json, cachingLevel: .none, completion: completion)
    }
    
    /// Cancels the DELETE request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled DELETE request.
    func cancelDELETE(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .delete, url: url)
    }
}

public extension Networking {
    
    /// Retrieves an image from the cache or from the filesystem.
    ///
    /// - Parameters:
    ///   - path: The path where the image is located.
    ///   - cacheName: The cache name used to identify the downloaded image, by default the path is used.
    /// - Returns: The cached image.
    func imageFromCache(_ path: String, cacheName: String? = nil) -> Image? {
        let object = objectFromCache(for: path, cacheName: cacheName, cachingLevel: .memoryAndFile, responseType: .image)
        
        return object as? Image
    }
    
    /// Downloads an image using the specified path.
    ///
    /// - Parameters:
    ///   - path: The path where the image is located.
    ///   - cacheName: The cache name used to identify the downloaded image, by default the path is used.
    ///   - cachingLevel: Enum to control the caching level: .memory, .memoryAndFile, .none
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func downloadImage(_ path: String, cacheName: String? = nil, cachingLevel: CachingLevel = .memoryAndFile, completion: @escaping (_ result: ImageResult) -> Void) -> String {
        return handleImageRequest(.get, path: path, cacheName: cacheName, cachingLevel: cachingLevel, responseType: .image, completion: completion)
    }
    
    /// Cancels the image download request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled image download request.
    func cancelImageDownload(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .get, url: url)
    }
    
    /// Downloads data from a URL, caching the result.
    ///
    /// - Parameters:
    ///   - path: The path used to download the resource.
    ///   - cacheName: The cache name used to identify the downloaded data, by default the path is used.
    ///   - cachingLevel: Enum to control the caching level: .memory, .memoryAndFile, .none
    ///   - completion: A closure that gets called when the download request is completed, it contains  a `data` object and an `NSError`.
    @discardableResult
    func downloadData(_ path: String, cacheName: String? = nil, cachingLevel: CachingLevel = .memoryAndFile, completion: @escaping (_ result: DataResult) -> Void) -> String {
        return handleDataRequest(.get, path: path, cacheName: cacheName, cachingLevel: cachingLevel, responseType: .data, completion: completion)
    }
    
    /// Retrieves data from the cache or from the filesystem.
    ///
    /// - Parameters:
    ///   - path: The path where the image is located.
    ///   - cacheName: The cache name used to identify the downloaded data, by default the path is used.
    /// - Returns: The cached data.
    func dataFromCache(_ path: String, cacheName: String? = nil) -> Data? {
        let object = objectFromCache(for: path, cacheName: cacheName, cachingLevel: .memoryAndFile, responseType: .data)
        
        return object as? Data
    }
}
