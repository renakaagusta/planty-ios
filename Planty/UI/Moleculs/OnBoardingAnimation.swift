//
//  OnBoardingAnimation.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import SwiftUI
import Lottie

struct OnBoardingAnimation: UIViewRepresentable {
    typealias UIViewType = UIView
    var title : String = ""
      
      func makeUIView(context:
          UIViewRepresentableContext<OnBoardingAnimation>)-> UIView {
               let view = UIView(frame: .zero)
               let animationView = AnimationView()
               let animation = Animation.named (title)
               animationView.animation = animation
               animationView.contentMode =  .scaleAspectFit
               animationView.play()
               animationView.play(fromProgress: 0,
                                  toProgress: 1,
                                  loopMode: LottieLoopMode.repeat(15),
                                  completion: { (finished) in
                                   if finished {
                                       print("Animation Complete")
                                     } else {
                                    print("Animation cancelled")
                                    }
                                 })
              animationView.translatesAutoresizingMaskIntoConstraints = false
              view.addSubview(animationView)
              
              NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo:view.widthAnchor),
              animationView.heightAnchor.constraint(equalTo:view.heightAnchor)])
             
              return view
            }
      
          func updateUIView( _ uiView: UIView, context:
              UIViewRepresentableContext<OnBoardingAnimation>){
                  }
            }

struct OnBoardingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingAnimation()
    }
}
