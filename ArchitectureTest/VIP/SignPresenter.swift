
import Foundation

protocol SignPresentationLogic:AnyObject {
    /// Метод форматирования полученных данных с Interactor'a
    func presentUser(_ response: SignModel.Fetch.Response)
}

final class SignPresenter: SignPresentationLogic {
    
    weak var viewController: SignViewController?
    
    func presentUser(_ response: SignModel.Fetch.Response) {
        
        let formattedPassword = response.password.replacingOccurrences(of: "1", with: "*")
        // Создаем экземляр ViewModel для отправки в View Controller
        let viewModel = SignModel.Fetch.ViewModel(login: response.login, password: formattedPassword)
        // Вызываем метод логики отображения у View Controller'a
        viewController?.displayUser(viewModel)
    }
    
    
}
