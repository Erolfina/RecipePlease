//
//  TableViewController.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-11.
//

import UIKit

class TableViewController: UITableViewController {
    
    var recipeArray = [Hit]()
    var keyword = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = readJSONFromFile(forName: "recipes") else { return }
        parse(jsonData: data)
       
    }
    
    // MARK: - Methods
    
     func filterRecipes() {
        var result: [String] = []
        let ingredients = recipeArray.map{ $0.recipe.label }
        
        for word in keyword {
            let research = word
            
            ingredients.forEach { element in
                if element.contains(research) {
                    print(element)
                    result.append(element)
                    keyword = result
                    print(keyword)
                }
            }
        }
    }
    
    private func showRecipes() {
        filterRecipes()
        
        if keyword != [""] {
            
        }
        
    }
    
    
    // MARK: - JSON
    func readJSONFromFile(forName fileName: String) -> Data? {  // lire le fichier json
            do {
                if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
                    let jsonData = try String(contentsOfFile: path).data(using: .utf8)
                    return jsonData
                }
            } catch {
                print(error)
            }
            return nil
        }
    
    func parse(jsonData: Data) {
            do {
                let decodedData = try JSONDecoder().decode(Questions.self, from: jsonData)
                    recipeArray = decodedData.hits
              
              
            } catch {
                print("error: \(error)")
            }
        }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(ingredients: recipeArray[indexPath.row].recipe.ingredients,
                           title: recipeArray[indexPath.row].recipe.label,
                           time: recipeArray[indexPath.row].recipe.totalTime,
                           cuisine: recipeArray[indexPath.row].recipe.cuisineType,
                           photos: recipeArray[indexPath.row].recipe.image
        )
        return cell
    }
    
 

}
