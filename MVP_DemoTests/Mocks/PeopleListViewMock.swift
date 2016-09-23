import Foundation

@testable import MVP_Demo

class PeopleListViewMock : PeopleListView {
    var didSetWithPeople: [PersonForListViewModel]? = nil

    func set(people: [PersonForListViewModel]) {
        didSetWithPeople = people
    }
}
