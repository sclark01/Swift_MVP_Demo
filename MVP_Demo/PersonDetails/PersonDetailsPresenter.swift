import Foundation

protocol PersonDetailsPresenterType {
    init(view: PersonDetailsView, service: PeopleServiceType)
    func getPersonWith(id id: Int)
}

class PersonDetailsPresenter : PersonDetailsPresenterType {

    private let view: PersonDetailsView
    private let service: PeopleServiceType

    required init(view: PersonDetailsView, service: PeopleServiceType) {
        self.view = view
        self.service = service
    }

    func getPersonWith(id id: Int) {
        service.getPersonByID(withID: id) { [weak self] person in
            self?.view.display(person: PersonDetailsViewModel(person: person))
        }
    }
}