import Foundation

@testable import MVP_Demo

class PeopleListPresenterMock : PeopleListPresenterType {

    var didCallGetUsers = false
    let view: PeopleListView
    let service: PeopleServiceType

    var willSetWithUsers: [PersonViewModel]!

    required init(view: PeopleListView, peopleService: PeopleServiceType) {
        self.view = view
        self.service = peopleService
    }

    func getUsers() {
        didCallGetUsers = true
        view.set(people: willSetWithUsers)
    }
}