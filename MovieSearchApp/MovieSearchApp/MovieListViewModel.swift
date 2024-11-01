//
//  MovieListViewModel.swift
//  MovieSearchApp
//
//  Created by Mohammad Azam on 6/23/21.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    
    @Published var movies: [MovieViewModel] = []
    
    func search(name: String) async {
        do {
            let movies = try await Webservice().getMovies(searchTerm: name)
            self.movies = movies.map(MovieViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
}


struct MovieViewModel {
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbID
    }
    
    var title: String {
        movie.title
    }
    
    var poster: URL? {
        URL(string: movie.poster)
    }
}