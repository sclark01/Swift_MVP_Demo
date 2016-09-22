import UIKit

class PeopleListViewController: UIViewController {

    internal var peoplePresenter: PeopleListPresenterType!
    private var people: [PersonViewModel] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        if peoplePresenter == nil {
            peoplePresenter = PeopleListPresenter(view: self, peopleService: PeopleService())
        }
        peoplePresenter.getUsers()
    }

    func transitionToPeopleDetailsView(withId id: Int) {
        let storyBoard = UIStoryboard(name: "PersonDetails", bundle: nil)
        guard let viewController = storyBoard.instantiateInitialViewController() as? PersonDetailsViewController else { return }
        viewController.personId = id
        transitionTo(viewController: viewController)
    }

    internal func transitionTo(viewController vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
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

extension PeopleListViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let personModel = people[indexPath.row]
        transitionToPeopleDetailsView(withId: personModel.id)
    }
}

