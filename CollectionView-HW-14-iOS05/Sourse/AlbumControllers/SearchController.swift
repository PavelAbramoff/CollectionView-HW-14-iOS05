//
//  SearchBar2.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 30.08.2022.
//

import UIKit

class SearchController: UIViewController {

    var filteredCountries = [Country]()
    let countries = Country.GetAllCountries()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(CountryCell.self, forCellReuseIdentifier: "cell")
        
        return tv
    }()
    
    lazy var searchController: UISearchController = {
        let s = UISearchController(searchResultsController: nil)
        s.searchResultsUpdater = self
        
        s.obscuresBackgroundDuringPresentation = false
        s.searchBar.placeholder = "Search"
        s.searchBar.sizeToFit()
        s.searchBar.searchBarStyle = .prominent
        
        s.searchBar.scopeButtonTitles = ["All", "Europe", "Asia", "Africa"]
        
        s.searchBar.delegate = self
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.searchController = searchController
        setupElement()
        
        
    }
    
    func filteredContentForSearchText(searchText: String, scoupe: String = "1") {
        filteredCountries = countries.filter({(country: Country) -> Bool in
            let doesCategoryMatch = (scoupe == "1") || (country.continent == scoupe)
            
            if isSearchBarEmpty(){
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && country.title.lowercased().contains(searchText.lowercased())
            }
        })
        
        tableView.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFilrering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeIsFilrering)
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filteredContentForSearchText(
            searchText: searchBar.text!,
            scoupe: searchBar.scopeButtonTitles![selectedScope]
        )
    }
}

extension SearchController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        
        filteredContentForSearchText(searchText: searchController.searchBar.text!,
                                     scoupe: scope)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() { return filteredCountries.count }
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
                CountryCell else { return UITableViewCell()}
        
        let currentCountry: Country
        
        if isFiltering() {
            currentCountry = filteredCountries[indexPath.row]
        } else {
            currentCountry = countries[indexPath.row]
        }
        
        cell.titleLbl.text = currentCountry.title
        cell.categoryLbl.text = currentCountry.continent
        
        return cell
    }
}

extension SearchController {
    
    func setupElement() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
}
