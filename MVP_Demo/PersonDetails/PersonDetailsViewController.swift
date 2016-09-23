import UIKit

class PersonDetailsViewController : UIViewController {

    var personDetailsPresenter: PersonDetailsPresenterType?
    var personId: Int?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    var viewModel: PersonDetailsViewModel? {
        didSet {
            nameLabel.text = viewModel?.name
            ageLabel.text = viewModel?.age
            phoneLabel.text = viewModel?.phone
        }
    }

    override func viewDidLoad() {
        guard let id = personId else { return }
        if personDetailsPresenter == nil {
            personDetailsPresenter = PersonDetailsPresenter(view: self, service: PeopleService())
        }
        personDetailsPresenter?.getPersonWith(id: id)
    }
}

extension PersonDetailsViewController : PersonDetailsView {
    func display(person: PersonDetailsViewModel) {
        viewModel = person
    }
}
