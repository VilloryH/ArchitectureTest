
import Foundation

enum TaskModel {
    
    enum FetchData {
        
        struct Request {
            let id: String
        }
        
        struct Response {
            let id: String
            let executorName: String
            let title: String
        }
        
        struct ViewModel {
            let id: String
            let executorName: String
            let title: String
        }
    }
}
