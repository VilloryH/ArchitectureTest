
import UIKit

protocol TaskDisplayLogic: AnyObject {
    func taskDisplay(_ viewModel: TaskModel.FetchData.ViewModel)
}

class TaskViewController: UIViewController {
    
    weak var interactor: TaskBusinessLogic?

    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTasks()
        view.backgroundColor = .white
        view.addSubview(taskLabel)
        taskLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        taskLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
    }
    
    func setup(){
        let interactor = TaskInteractor()
        let presenter = TaskPresenter()
        interactor.presenter = presenter
        presenter.taskController = self
        self.interactor = interactor
    }
    
    func loadTasks() {
        let request = TaskModel.FetchData.Request(id: "5")
        interactor?.fetchTask(request)
    }

}

extension TaskViewController: TaskDisplayLogic {
    func taskDisplay(_ viewModel: TaskModel.FetchData.ViewModel) {
        taskLabel.text = viewModel.title
    }
}
