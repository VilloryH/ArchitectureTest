
import Foundation

protocol TaskBusinessLogic: AnyObject {
    func fetchTask(_ request: TaskModel.FetchData.Request)
}

final class TaskInteractor {
    weak var presenter: TaskPresentationLogic?
}

extension TaskInteractor: TaskBusinessLogic {
    func fetchTask(_ request: TaskModel.FetchData.Request) {
        let id = "5"
        let executorName = "Maxim"
        let title = "It's title"
        let response = TaskModel.FetchData.Response(id: id, executorName: executorName, title: title)
        presenter?.presentTask(response)
    }
    
    
}
