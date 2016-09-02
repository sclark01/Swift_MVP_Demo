import UIKit

class PeopleListViewController: UIViewController {

    private var peoplePresenter: PeopleListPresenterType!
    private var people: [PersonViewModel] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        peoplePresenter = PeopleListPresenter(view: self, peopleService: PeopleService())
        peoplePresenter.getUsers()
    }
}

extension PeopleListViewController : PeopleListView {

    func set(people people: [PersonViewModel]) {
        self.people = people
        tableView.reloadData()
    }
}

extension PeopleListViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "person"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) ?? UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)

        let person = people[indexPath.row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.phone

        return cell
    }
}

