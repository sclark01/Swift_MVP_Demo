import Foundation

protocol PersonDetailsPresenterType {
    init(view: PersonDetailsView, service: PeopleServiceType)
    func getPersonWith(id: Int)
}

class PersonDetailsPresenter : PersonDetailsPresenterType {

    fileprivate let view: PersonDetailsView
    fileprivate let service: PeopleServiceType

    required init(view: PersonDetailsView, service: PeopleServiceType) {
        self.view = view
        self.service = service
    }

    func getPersonWith(id: Int) {
        service.getPersonByID(withID: id) { [weak self] person in
            self?.view.display(person: PersonDetailsViewModel(person: person))
        }
    }
}
