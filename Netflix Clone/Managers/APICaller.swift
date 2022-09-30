//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Haydar Demir on 24.09.2022.
//

import Foundation

fileprivate struct APIConstants {
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let baseUrl = "https://api.themoviedb.org"
    static let YOUTUBEAPI_KEY = "AIzaSyBQgbMvoYGSgtCBDqwxOy_Sp_DfHHN9CKI"
    static let youtubeBaseUrl = "https://youtube.googleapis.com/youtube/v3/search?"
}

fileprivate struct Endpoints {
    static let getTrendingMovies = "\(APIConstants.baseUrl)/3/trending/movie/day?api_key=\(APIConstants.API_KEY)"
    static let getTrendingTvs = "\(APIConstants.baseUrl)/3/trending/tv/day?api_key=\(APIConstants.API_KEY)"
    static let getUpcomingMovies = "\(APIConstants.baseUrl)/3/movie/upcoming?api_key=\(APIConstants.API_KEY)&language=en-US&page=1"
    static let getPopular = "\(APIConstants.baseUrl)/3/movie/popular?api_key=\(APIConstants.API_KEY)&language=en-US&page=1"
    static let getTopRated = "\(APIConstants.baseUrl)/3/movie/top_rated?api_key=\(APIConstants.API_KEY)&language=en-US&page=1"
    static let getDiscoverMovies = "\(APIConstants.baseUrl)/3/discover/movie?api_key=\(APIConstants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    static func search(_ query: String) -> String {
        "\(APIConstants.baseUrl)/3/search/movie?api_key=\(APIConstants.API_KEY)&query=\(query)"
    }
    static func getMovie(_ query: String) -> String {
        "\(APIConstants.youtubeBaseUrl)q=\(query)&key=\(APIConstants.YOUTUBEAPI_KEY)"
    }
}

public enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url  = URL(string: Endpoints.getTrendingMovies) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url  = URL(string: Endpoints.getTrendingTvs) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url  = URL(string: Endpoints.getUpcomingMovies) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Endpoints.getPopular) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Endpoints.getTopRated) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: Endpoints.getDiscoverMovies) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: Endpoints.search(query)) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: Endpoints.getMovie(query)) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
