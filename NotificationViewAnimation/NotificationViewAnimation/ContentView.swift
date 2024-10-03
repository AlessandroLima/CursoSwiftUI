import SwiftUI

struct ContentView: View {
    
    @State var showDetails: Bool = false
    private let screenHeight = UIScreen.main.bounds.height
    private let notificationHeight: CGFloat = 80
    
    
    var body: some View {
        VStack {
            
            let positions = getNotificationPosition(screenHeigth: screenHeight, notificationHeight: notificationHeight)
            
            NotificationView(notificationHeight: notificationHeight)
                .offset(y: CGFloat(showDetails ? positions.finalPosition : positions.inicialPosition))
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100, damping: 10, initialVelocity: 0))
           Button("Show Notification"){
                self.showDetails.toggle()
            }
         
        }
    }
}

private func getNotificationPosition(screenHeigth:CGFloat,
                                     notificationHeight: CGFloat)-> (inicialPosition: Int, finalPosition: Int) {
    
    let notificationInicialPosition = Int(-(screenHeigth / 2 + (notificationHeight / 2 )))
    let notificationFinalPosition = Int((notificationHeight + (notificationHeight / 2)) - (screenHeigth / 2 ))
    
    return (notificationInicialPosition, notificationFinalPosition)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
