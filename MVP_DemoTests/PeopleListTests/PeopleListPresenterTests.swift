import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PeopleListPresenterTests : QuickSpec {
    override func spec() {
        var peopleListPresenter: PeopleListPresenter!
        var mockPeopleService: PeopleServiceMock!
        var mockPeopleListView: PeopleListViewMock!

        let people = [Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")]
        let expectedPeople = [PersonForListViewModel(person: people.first!)]

        beforeEach {
            mockPeopleService = PeopleServiceMock()
            mockPeopleService.withMock(people)

            mockPeopleListView = PeopleListViewMock()

            peopleListPresenter = PeopleListPresenter(view: mockPeopleListView, peopleService: mockPeopleService)
        }

        describe("get users") {
            it("should call get people service") {
                peopleListPresenter.getUsers()

                expect(mockPeopleService.getPeopleCalled).to(beTrue())
            }

            it("should pass the list of people to view") {
                peopleListPresenter.getUsers()

                expect(mockPeopleListView.didSetWithPeople).toEventuallyNot(beNil())
                expect(mockPeopleListView.didSetWithPeople!.first).toEventually(equal(expectedPeople.first!))
            }
        }
    }
}