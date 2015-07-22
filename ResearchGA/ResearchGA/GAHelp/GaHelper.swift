//
//  GaHelper.swift


import Foundation

class GaHelper: NSObject {
    var tracker = GAI.sharedInstance().trackerWithTrackingId("UA-65438243-1")
    class var sharedInstance: GaHelper {
        struct Static {
            static let instance: GaHelper = GaHelper()
        }
        return Static.instance
    }
    
    override class func initialize() {
        super.initialize()
        GAI.sharedInstance().dispatchInterval = 20
        GAI.sharedInstance().trackUncaughtExceptions = true
    }
    
    class func sendEvent(category: String, action: String, label: String?) {
        if let tracker = GaHelper.sharedInstance.tracker {
            let dict = GAIDictionaryBuilder.createEventWithCategory(category,
                action: action,
                label: label,
                value: nil).build()
            tracker.send(dict as [NSObject : AnyObject])
        }
    }
    
    class func trackScreenName(screenName: String) {
//        if screenName.length == 0 {
//            return
//        }
        if let tracker = GaHelper.sharedInstance.tracker {
            tracker.set(kGAIScreenName, value: screenName)
            
            var builder = GAIDictionaryBuilder.createScreenView()
            tracker.send(builder.build() as [NSObject : AnyObject])
        }
    }
}

enum GaCommon: String {
    case masterView            = "master view"
    case detailView            = "detail view"
}

enum GaCommonAction: String {
    case showView                   = "show master view action"
    case showViewDetail             = "show master view detail action"
}

enum GaCommonLabel: String {
    case masterViewLabel            = "master view label"
    case masterViewDetail           = "master view detail label"
}
