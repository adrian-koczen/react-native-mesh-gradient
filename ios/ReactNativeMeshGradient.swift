import Foundation
import SwiftUI
import UIKit
import simd

@available(iOS 18.0, *)
struct MeshGradientView: View {
    @State private var isAnimating = false
    @ObservedObject var options: Options
    @State var elementsInRow: Int = 0
    
    var body: some View {
        if options.error != nil {
            ErrorMessage(message: options.error)
        } else
        if #available(iOS 18.0, *) {
            VStack {
                MeshGradient(
                    width: elementsInRow,
                    height: elementsInRow,
                    points: options.points,
                    colors: isAnimating ? options.animatedColors : options.colors,
                    smoothsColors: true
                ).onAppear{
                    if (options.points.count > 0) {
                        elementsInRow = Int(sqrt(Double(options.points.count)))
                    }
                    
                    if (options.animatedColors.count > 0 && options.animationDuration != nil) {
                        withAnimation(
                            .easeInOut( duration: options.animationDuration!)
                            .repeatForever(autoreverses: true)
                        ) {
                            isAnimating.toggle()
                        }
                    }
                }.ignoresSafeArea(.all)
            }
        } else {
            ErrorMessage(message: "MeshGradient available only in iOS 18.0+")
        }
    }
}

@available(iOS 18.0, *)
class MeshGradientUIView: UIView {
    private var hostingController: UIHostingController<MeshGradientView>?
    private var options = Options()
    
    @objc func setAnimationDuration (_ animationDuration: NSNumber) {
        options.animationDuration = Double(truncating: animationDuration)
    }
    
    @objc func setAnimatedColors (_ hexArray: NSArray) {
        do {
            let colors = try getColors(hexArray: hexArray)
            
            options.animatedColors = colors
        } catch {
            options.error = "Please check animated color attribute"
        }
    }
    
    @objc func setColors (_ hexArray: NSArray) {
        do {
            let colors = try getColors(hexArray: hexArray)
            
            options.colors = colors
        } catch {
            options.error = "Please check color attribute"
        }
    }
    
    @objc func setPoints(_ val: NSArray) {
        var simdArray: [SIMD2<Float>] = []

        for element in val {
            if let tuple = element as? NSArray,
                let x = tuple[0] as? NSNumber,
                let y = tuple[1] as? NSNumber {
                let simdPoint = SIMD2<Float>(x.floatValue, y.floatValue)

                simdArray.append(simdPoint)
            } else {
                options.error = "Please check points attribute"
            }
        }
        
        options.points = simdArray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        let view = MeshGradientView(options: options)
        let hostingController = UIHostingController(rootView: view)
        
        self.hostingController = hostingController
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: self.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

@available(iOS 18.0, *)
@objc(ReactNativeMeshGradient)
class ReactNativeMeshGradient: RCTViewManager {
    @objc
    override func view() -> UIView! {
        return MeshGradientUIView()
    }
    
    @objc
    override static func requiresMainQueueSetup() -> Bool {
      return true
    }
}
