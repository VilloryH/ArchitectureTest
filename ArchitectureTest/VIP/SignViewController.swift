
import UIKit
/// Протокол логики для отображения подготовленной информации
protocol SignDisplayLogic: AnyObject {
    
    /// Метод логики отображения данных
    func displayUser(_ viewModel: SignModel.Fetch.ViewModel)
}

final class SignViewController: UIViewController {
    
    var interactor: SignBusinessLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        // Создаем компоненты VIP цикла 
        let interactor = SignInteractor()
        let presenter = SignPresenter()
        
        // Связываем созданные компоненты
        interactor.presenter = presenter
        presenter.viewController = self
        
        // Указываем ссылку на Interactor для View Controller
        self.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfromation()
    }
    
    /// Делаем запрос к Interactor для получения данных
    private func loadUserInfromation() {
        // Создаем экземпляр запроса к Interactor с параметрами
        let request = SignModel.Fetch.Request(login: "Aleksey")
        
        // Вызываем метод бизнес логики у Interactor'a
        interactor?.fetchUser(request)
    }
}

extension SignViewController: SignDisplayLogic {
    
    func displayUser(_ viewModel: SignModel.Fetch.ViewModel) {
        print(viewModel)
    }
}
