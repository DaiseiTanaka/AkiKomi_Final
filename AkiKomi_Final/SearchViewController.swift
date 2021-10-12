//
//  SearchViewController.swift
//  CollectionViewInsideTableViewExample
//
//  Created by 田中大誓 on 2021/10/02.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    // データを定義
    let data: [String] = ["Advanced hall",
                          "Sagano hall",
                          "Library",
                          "S 306",
                          "S 307",
                          "S 311",
                          "S 312",
                          "Learning commons1",
                          "Learning commons2",
                          "Learning commons3",
                          "Learning commons4",
                          "Electronic Workshop",
                          "Mechanical Workshop",
                          "AkiKomi documents"]
    
    // 検索にひっかっかったものを入れる変数
    var filteredItems: [String] = []
    
    // UISearchControllerの変数を作成
    var searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"
        
        if #available(iOS 11.0, *){
            // Titleがでかく表示されるやつ．デフォルトはfalseらしい
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        // セルの名前を設定
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 検索に関する設定
        searchController.delegate = self
        self.searchController = UISearchController(searchResultsController: nil)  // 検索結果を表示するViewControllerが自分なら，nilを設定
        self.searchController.searchResultsUpdater = self  // 検索されると動くViewを設定
        self.searchController.hidesNavigationBarDuringPresentation = true  // 検索バーを押したらナビゲーションバーが隠れる
        self.searchController.dimsBackgroundDuringPresentation = false  // 検索中は後ろが暗くなる。
        self.definesPresentationContext = true
        //text fieldをタップするとキーボードを非表示にする
        self.searchController.searchBar.endEditing(true)
        
        self.searchController.searchBar.setValue("Cancel", forKey: "cancelButtonText")
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
         UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
        
        let searchBar = self.searchController.searchBar  // searchBarを取得
        searchBar.delegate = self
        searchBar.placeholder = "Search by whitespace"  // placeholderを設定
        //searchBar.scopeButtonTitles = ["contain all", "contain something"]  // Scopeボタンのタイトルを設定
        searchBar.becomeFirstResponder()

        if #available(iOS 11.0, *){
            // iOS11以降は，UINavigationItemにSearchControllerを設定
            self.navigationItem.searchController = self.searchController
            
            // trueだとスクロールした時にSearchBarを隠す（デフォルトはtrue）
            // falseだとスクロール位置に関係なく常にSearchBarが表示される
            self.navigationItem.hidesSearchBarWhenScrolling = false
        }else{
            // iOS11より前は，tableHeaderViewにsearchBarを設定
            self.tableView.tableHeaderView = searchBar  // TableViewの一番上にsearchBarを設置
        }

    
    }

    override func viewDidAppear(_ animated: Bool) {
        //viewを開いたらフォーカス
        searchController.isActive = true
        
        DispatchQueue.main.async {
                self.searchController.searchBar.becomeFirstResponder()
            }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.isActive{
            return self.filteredItems.count
        }else{
            return self.data.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if self.searchController.isActive{
            cell.textLabel?.text = self.filteredItems[indexPath.row]
        }else{
            // セルに表示するテキストを設定
            cell.textLabel?.text = self.data[indexPath.row]
        }
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.searchController.isActive{
            print("-=-=-=-=-=--=--=-=-=-=-=---==--==--=-=\(self.filteredItems[indexPath.row])")
            if self.filteredItems[indexPath.row] == "Advanced hall" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toAdvanced", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Sagano hall" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toSagano", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Library" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLibrary", sender: nil)
            } else if self.filteredItems[indexPath.row] == "S 306" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS306", sender: nil)
            } else if self.filteredItems[indexPath.row] == "S 307" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS307", sender: nil)
            } else if self.filteredItems[indexPath.row] == "S 311" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS311", sender: nil)
            } else if self.filteredItems[indexPath.row] == "S 312" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS312", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Learning commons1" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC1", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Learning commons2" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC2", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Learning commons3" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC3", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Learning commons4" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC4", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Electronic Workshop" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toEWS", sender: nil)
            } else if self.filteredItems[indexPath.row] == "Mechanical Workshop" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toMWS", sender: nil)
            } else if self.filteredItems[indexPath.row] == "AkiKomi documents" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toAkiKomiDocuments", sender: nil)
            }
        } else{
            print("-=-=-=-=-=--=--=-=-=-=-=---==--==--=-=\(data[indexPath.row])")
            
            if self.data[indexPath.row] == "Advanced hall" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toAdvanced", sender: nil)
            } else if self.data[indexPath.row] == "Sagano hall" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toSagano", sender: nil)
            } else if self.data[indexPath.row] == "Library" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLibrary", sender: nil)
            } else if self.data[indexPath.row] == "S 306" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS306", sender: nil)
            } else if self.data[indexPath.row] == "S 307" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS307", sender: nil)
            } else if self.data[indexPath.row] == "S 311" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS311", sender: nil)
            } else if self.data[indexPath.row] == "S 312" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toS312", sender: nil)
            } else if self.data[indexPath.row] == "Learning commons1" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC1", sender: nil)
            } else if self.data[indexPath.row] == "Learning commons2" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC2", sender: nil)
            } else if self.data[indexPath.row] == "Learning commons3" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC3", sender: nil)
            } else if self.data[indexPath.row] == "Learning commons4" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toLC4", sender: nil)
            } else if self.data[indexPath.row] == "Electronic Workshop" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toEWS", sender: nil)
            } else if self.data[indexPath.row] == "Mechanical Workshop" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toMWS", sender: nil)
            } else if self.data[indexPath.row] == "AkiKomi documents" {
                tableView.deselectRow(at: indexPath, animated: true)
                performSegue(withIdentifier: "toAkiKomiDocuments", sender: nil)
            }
            
        }
        
    }
    
}

// MARK: -
extension SearchViewController: UISearchResultsUpdating{
    
    // 検索された時に実行される関数
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{ return }
        if searchController.searchBar.selectedScopeButtonIndex == 0{ //  or
            self.filteredItems = self.data.filter{
                for word in text.components(separatedBy: " "){
                    if word == ""{
                        continue
                    }
                    if !$0.localizedCaseInsensitiveContains(word){
                        return false
                    }
                }
                return true
            }
            
        }else if searchController.searchBar.selectedScopeButtonIndex == 1{  // and
            self.filteredItems = self.data.filter{
                for word in text.components(separatedBy: " "){
                    if $0.localizedCaseInsensitiveContains(word){
                        return true
                    }
                }
                return false
            }
        }
        self.tableView.reloadData()
    }
    
}

// MARK: -
extension SearchViewController: UISearchBarDelegate, UISearchControllerDelegate{
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.updateSearchResults(for: self.searchController)
        
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
    }

}

// MARK: -
@available(iOS 9.0, *)
extension SearchViewController: UIViewControllerPreviewingDelegate{
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print("peek")
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
}
