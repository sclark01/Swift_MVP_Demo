import Foundation

protocol PeopleListPresenterType {
    init(view: PeopleListView, peopleService: PeopleServiceType)
    func getUsers()
}

class PeopleListPresenter : PeopleListPresenterType {

    fileprivate let peopleService: PeopleServiceType
    fileprivate let view: PeopleListView

    required init(view: PeopleListView, peopleService: PeopleServiceType) {
        self.peopleService = peopleService
        self.view = view
    }

    func getUsers() {
        peopleService.getPeople { [weak self] people in
            let peopleForView = people.map {
                PersonForListViewModel(person: $0)
            }
            self?.view.set(people: peopleForView)
        }
    }
}
