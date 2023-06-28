//
//  Units.swift
//  ConvertorUiKit
//
//  Created by Radovan Bojkovský on 04/06/2023.
//

struct Units {
    let units: [String]
    let sections: Array<Section>  // [Section]
    let ratios: [Double]

    func convert(value: Double, fromUnit: String, toUnit: String) -> String {
        guard let fromIndex = units.firstIndex(of: fromUnit),
              let toIndex = units.firstIndex(of: toUnit),
              ratios.indices.contains(fromIndex),
              ratios.indices.contains(toIndex) else { return "" }
        let basicValue = value * ratios[fromIndex]
        let toValue = basicValue / ratios[toIndex]
        return "\(toValue) \(toUnit)"
    }
}

