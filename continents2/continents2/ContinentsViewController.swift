import UIKit

class ContinentsViewController: UITableViewController {
    let continents: [Contient] = [
        Contient(continent: "Asia", nations: [
            Nation(nation: "India", states: [
                State(state: "Maharashtra"),
                State(state: "Gujarat"),
                State(state: "Karnataka")
            ]),
            Nation(nation: "China", states: [
                State(state: "Beijing"),
                State(state: "Shanghai"),
                State(state: "Guangdong")
            ]),
            Nation(nation: "Japan", states: [
                State(state: "Tokyo"),
                State(state: "Osaka"),
                State(state: "Hokkaido")
            ])
        ]),
        
        Contient(continent: "Africa", nations: [
            Nation(nation: "Nigeria", states: [
                State(state: "Lagos"),
                State(state: "Abuja"),
                State(state: "Kano")
            ]),
            Nation(nation: "Kenya", states: [
                State(state: "Nairobi"),
                State(state: "Mombasa"),
                State(state: "Kisumu")
            ]),
            Nation(nation: "Egypt", states: [
                State(state: "Cairo"),
                State(state: "Alexandria"),
                State(state: "Giza")
            ])
        ]),
        
        Contient(continent: "Europe", nations: [
            Nation(nation: "France", states: [
                State(state: "Île-de-France"),
                State(state: "Normandy"),
                State(state: "Brittany")
            ]),
            Nation(nation: "Germany", states: [
                State(state: "Bavaria"),
                State(state: "Berlin"),
                State(state: "Saxony")
            ]),
            Nation(nation: "Italy", states: [
                State(state: "Lazio"),
                State(state: "Tuscany"),
                State(state: "Sicily")
            ])
        ]),
        
        Contient(continent: "North America", nations: [
            Nation(nation: "USA", states: [
                State(state: "California"),
                State(state: "Texas"),
                State(state: "New York")
            ]),
            Nation(nation: "Canada", states: [
                State(state: "Ontario"),
                State(state: "Quebec"),
                State(state: "British Columbia")
            ]),
            Nation(nation: "Mexico", states: [
                State(state: "Jalisco"),
                State(state: "Mexico City"),
                State(state: "Nuevo León")
            ])
        ])
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return continents.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section].continent
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents[section].nations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        cell.textLabel?.text = continents[indexPath.section].nations[indexPath.row].nation
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = continents[indexPath.section].nations[indexPath.row].nation
        performSegue(withIdentifier: "showStates", sender: selectedCountry)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStates",
           let destinationVC = segue.destination as? StatesViewController,
           let country = sender as? String {
            destinationVC.selectedCountry = country
        }
    }
}
