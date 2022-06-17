//В Router выносится вся логика, отвечающая за переходы и передачу данных между сценами.

import Foundation

enum SignModel {
    /// Набор запросов для одного VIP цикла
    enum Fetch {
        /// Запрос к Interactor из View Controller
        struct Request {
            let login:String
        }
        /// Запрос к Presentor из Interactor
        struct Response {
            let login:String
            let password:String
        }
        struct ViewModel {
            let login:String
            let password:String
        }
    }
}
