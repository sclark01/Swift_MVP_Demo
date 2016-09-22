import UIKit

class PersonDetailsViewController : UIViewController {

    var personDetailsPresenter: PersonDetailsPresenterType?

    var personId: Int?

    override func viewDidLoad() {
        guard let id = personId else { return }
        if personDetailsPresenter == nil {
            personDetailsPresenter = PersonDetailsPresenter(view: self, service: PeopleService())
        }
        personDetailsPresenter?.getPersonWith(id: id)
    }
}

extension PersonDetailsViewController : PersonDetailsView {
    func display(person person: PersonForListViewModel) {

    }
}