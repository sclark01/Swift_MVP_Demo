import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PeopleListPresenterTests : QuickSpec {
    override func spec() {
        var peopleListPresenter: PeopleListPresenter!
        var mockPeopleService: MockPeopleService!
        var mockPeopleListView: MockPeopleListView!

        let people = [Person(id: 0, name: "someName", phone: "somePhone")]
        let expectedPeople = [PersonViewModel(person: people.first!)]

        beforeEach {
            mockPeopleService = MockPeopleService()
            mockPeopleService.withMock(people: people)

            mockPeopleListView = MockPeopleListView()

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