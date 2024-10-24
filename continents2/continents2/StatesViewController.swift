import UIKit

class StatesViewController: UITableViewController {
    var selectedCountry: Nation? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = selectedCountry {
            title = "States of \(country.nation)"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCountry?.states.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        cell.textLabel?.text = selectedCountry?.states[indexPath.row].state
        return cell
    }
}
