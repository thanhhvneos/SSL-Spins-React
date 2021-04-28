
import Foundation
import TrustKit

class ApiManager: URLSession {
  
  func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    // Call into TrustKit here to do pinning validation
    if TrustKit.sharedInstance().pinningValidator.handle(challenge, completionHandler: completionHandler) == false {
      // TrustKit did not handle this challenge: perhaps it was not for server trust
      // or the domain was not pinned. Fall back to the default behavior
      completionHandler(.performDefaultHandling, nil)
    }
  }
  
  func ok() {
    
  }
}
