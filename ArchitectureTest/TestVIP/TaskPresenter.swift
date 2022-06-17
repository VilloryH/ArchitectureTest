
import Foundation

protocol TaskPresentationLogic: AnyObject {
    func presentTask(_ response: TaskModel.FetchData.Response)
}

final class TaskPresenter {
    weak var taskController: TaskViewController?
}

extension TaskPresenter: TaskPresentationLogic {
    func presentTask(_ response: TaskModel.FetchData.Response) {
        let viewModel = TaskModel.FetchData.ViewModel(id: response.id, executorName: response.executorName, title: response.title)
        taskController?.taskDisplay(viewModel)
    }
}
