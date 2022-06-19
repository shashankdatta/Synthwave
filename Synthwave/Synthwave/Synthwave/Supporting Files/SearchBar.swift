//
//  SearchBar.swift
//  SearchBar
//
//  Created by Shashank datta Bezgam on 10/19/21.
//  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
//

import Foundation
import SwiftUI
 
struct SearchBar: UIViewRepresentable {
 
    // Input variable passed by reference
    @Binding var searchItem: String
  
    // Input constant passed by value
    let placeholder: String
 
    // This class is created to coordinate with UISearchBar
    class Coordinator: NSObject, UISearchBarDelegate {
     
        @Binding var searchText: String
     
        init(searchText: Binding<String>) {
            _searchText = searchText
        }
     
        func searchBar(_ searchBar: UISearchBar, textDidChange searchString: String) {
            searchText = searchString
            searchBar.showsCancelButton = true
        }
       
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
            searchBar.resignFirstResponder()
        }
      
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchText = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
    }
 
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(searchText: $searchItem)
    }
 
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
      
        // Create a UISearchBar instance and store its unique id into searchBar
        let searchBar = UISearchBar(frame: .zero)
     
        // Assign the associated coordinator as the search bar's delegate
        searchBar.delegate = context.coordinator
      
        searchBar.placeholder = placeholder
      
        // The search bar has no background, and the search field is translucent
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
     
        // Return the created and dressed up search bar
        return searchBar
    }
 
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        // Update UISearchBar instance's property 'text', which is the current or starting search text
        uiView.text = searchItem
    }
}
