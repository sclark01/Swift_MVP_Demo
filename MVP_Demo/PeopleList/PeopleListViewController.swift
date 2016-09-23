import UIKit

class PeopleListViewController: UIViewController {

    internal var peoplePresenter: PeopleListPresenterType!
    fileprivate var people: [PersonForListViewModel] = []

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
    func set(people: [PersonForListViewModel]) {
        self.people = people
        tableView.reloadData()
    }
}

extension PeopleListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "person"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)

        let person = people[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.phone

        return cell
    }
}

extension PeopleListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let personModel = people[(indexPath as NSIndexPath).row]
        transitionToPeopleDetailsView(withId: personModel.id)
    }
}

