//
//  CustomDownButton.swift
//  TouchDownAnimation
//
//  Created by Rob Napier on 6/21/16.
//  Copyright © 2016 Rob Napier. All rights reserved.
//

import UIKit

struct CustomAnimator {
    var touchesBegan: (UIView) -> Void = { $0.backgroundColor = .red() }
    var touchesEnded: (UIView) -> Void = { $0.backgroundColor = .clear() }
}

class CustomDownButton: UIButton {
    var customAnimator: CustomAnimator?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        customAnimator?.touchesBegan(self)
        super.touchesBegan(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        customAnimator?.touchesEnded(self)
        super.touchesEnded(touches, with: event)
    }
}

class CustomAnimatorGestureRecognizer: UIGestureRecognizer {
    let customAnimator: CustomAnimator

    init(customAnimator: CustomAnimator) {
        self.customAnimator = customAnimator
        super.init(target: nil, action: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if let view = view {
            customAnimator.touchesBegan(view)
        }
        super.touchesBegan(touches, with: event)
    }

    override func reset() {
        // I'm a bit surprised this isn't in the default impl.
        if self.state == .possible {
            self.state = .failed
        }
        super.reset()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        if let view = view {
            customAnimator.touchesEnded(view)
        }
        self.reset()
        super.touchesEnded(touches, with: event)
    }
}
