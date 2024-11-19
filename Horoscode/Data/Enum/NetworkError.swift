//
//  NetworkError.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//


enum NetworkError: Error {
    case badUrl, badStatus, badResponse, failedToDecodeResponse
}
