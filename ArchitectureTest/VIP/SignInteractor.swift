
import Foundation

/// Протокол бизнес логики Interactor'a
protocol SignBusinessLogic:AnyObject {
    /// Метод получения данных из сети или других источников
    func fetchUser(_ request:SignModel.Fetch.Request)
}

final class SignInteractor: SignBusinessLogic {
    
    var presenter: SignPresentationLogic?
    
    func fetchUser(_ request: SignModel.Fetch.Request) {
        let userLogin = "Villory"
        let password = "123456"
        // Создаем запрос к Presentor'у с необходимыми данными
        let response = SignModel.Fetch.Response(login: userLogin, password: password)
        // Вызываем метод логики презентации у Presentor'а
        presenter?.presentUser(response)
    }
}
