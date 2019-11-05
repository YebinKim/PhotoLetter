//
//  ShadowView.swift
//  PhotoLetter
//
//  Created by Yebin Kim on 2019/11/05.
//  Copyright © 2019 김예빈. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    @IBInspectable var shadowColor: UIColor = UseColor.shadow.value { didSet { updateColors() } }
    @IBInspectable var shadowOpacity: Float = 0.2 { didSet { updateOpacity() } }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 1.5) { didSet { updateOffsets() } }
    @IBInspectable var shadowRadius: CGFloat = 1 { didSet { updateRadius() } }
    
    override public class var layerClass: AnyClass { CALayer.self }
    
    var shadowLayer: CALayer { layer }
    
    func updateColors() {
        shadowLayer.shadowColor = shadowColor.cgColor
    }
    
    func updateOpacity() {
        shadowLayer.shadowOpacity = shadowOpacity
    }
    
    func updateOffsets() {
        shadowLayer.shadowOffset = shadowOffset
    }
    
    func updateRadius() {
        shadowLayer.shadowRadius = shadowRadius
    }
}
