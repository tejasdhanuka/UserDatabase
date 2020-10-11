//
//  NetworkError.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/11.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case notFound
    case internalServerError
    case maintenance
    case invalidURL
    case noData
    case noInternetConnection
    case cancelled
    case unhandledHttpStatusCode(Int)
    case decodeError(Error)
    case unknownError(Error?)
    
    enum ErrorCode: String {
        case unknown = "ERR0000"
        case badRequest = "ERR0001"
        case notFound = "ERR0002"
        case internalServerError = "ERR0003"
        case invalidURL = "ERR0004"
        case noData = "ERR0005"
        case decodeError = "ERR0006"
        case noInternetConnection = "ERR0007"
        case maintenance = "ERR0008"
        case cancelled = "ERR0009"
        case unhandledHttpStatusCode = "ERR0010"
    }
    
    init?(httpStatusCode: Int) {
        switch httpStatusCode {
        case 400:
            self = .badRequest
        case 404:
            self = .notFound
        case 500:
            self = .internalServerError
        case 503:
            self = .maintenance
        default:
            return nil
        }
    }
    
    var code: String {
        switch self {
        case .badRequest:
            return ErrorCode.badRequest.rawValue
        case .notFound:
            return ErrorCode.notFound.rawValue
        case .internalServerError:
            return ErrorCode.internalServerError.rawValue
        case .maintenance:
            return ErrorCode.maintenance.rawValue
        case .invalidURL:
            return ErrorCode.invalidURL.rawValue
        case .noData:
            return ErrorCode.noData.rawValue
        case .noInternetConnection:
            return ErrorCode.noInternetConnection.rawValue
        case .cancelled:
            return ErrorCode.cancelled.rawValue
        case .unhandledHttpStatusCode(let httpStatusCode):
            return ErrorCode.unhandledHttpStatusCode.rawValue + "[\(httpStatusCode)]"
        case .decodeError:
            return ErrorCode.decodeError.rawValue
        case .unknownError(let error):
            let baseErrorCode = ErrorCode.unknown.rawValue
            if let nsError = error as NSError? {
                return baseErrorCode + "[\(nsError.code)]"
            } else {
                return baseErrorCode
            }
        }
    }
}
