import Foundation

class SampleNotificationGenerator {
    let sampleNotification = Notification(name: Notification.Name("Foo"))
    let notificationCenter = NotificationCenter.default

    func post() {
        notificationCenter.post(sampleNotification)
    }
}

class SampleNotificationReciever {
    let sampleNotification = Notification(name: Notification.Name("Foo"))
    let notificationCenter = NotificationCenter.default

    init() {
        notificationCenter.addObserver(self, selector: #selector(self.recieve(_:)), name: sampleNotification.name, object: nil)
    }

    @objc func recieve(_ notification: Notification) {

    }
}

class FakeNotificationReciever: SampleNotificationReciever {
    var recieveCallCount: Int = 0

    @objc override func recieve(_ notification: Notification) {
        self.recieveCallCount += 1
    }
}
