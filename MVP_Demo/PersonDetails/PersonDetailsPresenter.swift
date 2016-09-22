import Foundation

protocol PersonDetailsPresenterType {
    init(view: PersonDetailsView, service: PeopleServiceType)
    func getPersonWith(id id: Int)
}

struct PersonDetailsPresenter : PersonDetailsPresenterType {

    private let view: PersonDetailsView
    private let service: PeopleServiceType

    init(view: PersonDetailsView, service: PeopleServiceType) {
        self.view = view
        self.service = service
    }

    func getPersonWith(id id: Int) {
        
    }
}