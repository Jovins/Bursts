//
//  BurstSetting.swift
//  Bursts
//
//  Created by Jovins on 2021/7/20.
//

import UIKit

public struct BurstSetting {
    
    /// 是否是默认
    public var isDefault: Bool = true
    /// 背景颜色, eg: .white
    public var backgroundColor: UIColor = UIColor.white
    /// 阴影颜色, eg: .black
    public var shadowColor: UIColor = UIColor.black
    /// 阴影半径, eg: 25
    public var shadowRadius: CGFloat = 25
    /// 阴影偏移, eg: zero
    public var shadowOffset: CGSize = .zero
    /// 阴影透明度, eg: 0.15
    public var shadowOpacity: Float = 0.15
    /// 光栅化, eg: true
    public var shouldRasterize: Bool = true
    public var rasterizationScale: CGFloat = UIScreen.main.scale
    public var masksToBounds: Bool = false
    /// 字体颜色, eg: black
    public var titleColor: UIColor = .black
    /// 小字体颜色, eg: darkGray
    public var subtitleColor: UIColor = .darkGray
    /// 高度，eg: 50
    public var height: CGFloat = 50
    /// 设置圆角，如果该值没有设置，则取min(width, height) * 0.5
    public var cornerRadius: CGFloat = 0
    
    public init() {
        
    }
}
