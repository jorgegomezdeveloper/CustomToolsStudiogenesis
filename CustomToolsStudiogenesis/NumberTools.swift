//
//  NumberTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

extension Int {
    
    // check if pair number
    public func isPairNumber() -> Bool {
        if self%2 == 0 {
            return true
        } else {
            return false
        }
    }
    
}

public class NumberTools {
    
    public init() {
        
    }
    
    public enum NumberResultType: String {
        case hours
        case minutes
        case seconds
    }
    
    public func getTotalTime(value: Any, valueType: NumberResultType, resultType: NumberResultType) -> Int {
        
        var result = 0
        result = passValueToInt(value: value)
        result = passValueToSeconds(value: result, valueType: valueType)
        
        switch resultType {
        case .hours:
            return (result / 3600)
        case .minutes:
            return ((result % 3600) / 60)
        case .seconds:
            return ((result % 3600) % 60)
        }
    }
    
    public func passValueToInt(value: Any) -> Int {
        
        let result = 0
        /*
        if let value: String = value as? String {
            if value.isNumeric {
                result = Int(value) ?? 0
            }
        } else if let value: Int = value as? Int {
            result = value
        } else if let value: Double = value as? Double {
            result = Int(value)
        }*/
        
        return result
    }
    
    public func passValueToSeconds(value: Int, valueType: NumberResultType) -> Int {
        
        var result = 0
        
        switch valueType {
        case .hours:
            result = value * 360
            break
        case .minutes:
            result = value * 60
            break
        case .seconds:
            break
        }
        
        return result
    }
}

extension Numeric {
    
    // MARK: NUMBER FORMAT, RETURN STRING
    public func formatCustomDecimal(currencyType: CurrencyType = .spain, withoutDecimals: Bool = false) -> String? {
        return formatCustom(numberStyle: .decimal, currencyType: currencyType, withoutDecimals: withoutDecimals)
    }
    
    public func formatCustomCurrency(currencyType: CurrencyType = .spain, withoutDecimals: Bool = false) -> String? {
        return formatCustom(numberStyle: .currency, currencyType: currencyType, withoutDecimals: withoutDecimals)
    }
    
    public func formatCustomPercent(currencyType: CurrencyType = .spain) -> String? {
        return formatCustom(numberStyle: .percent, currencyType: currencyType, withoutDecimals: false)
    }
    
    public func formatCustom(numberStyle: NumberFormatter.Style, currencyType: CurrencyType, withoutDecimals: Bool, groupingSeparatorType: GroupingSeparatorType = .dot, beforeText: String = "", afterText: String = "") -> String? {
        
        if let num = self as? NSNumber {
            let formater = NumberFormatter()
            formater.numberStyle = numberStyle
            
            formater.groupingSeparator = groupingSeparatorType.rawValue
            
            if currencyType != .none {
                formater.locale = Locale(identifier: currencyType.rawValue)
            }
            
            if !withoutDecimals {
                formater.minimumFractionDigits = 2
                formater.maximumFractionDigits = 2
                formater.multiplier = 1
            }

            return "\(beforeText)\(formater.string(from: num) ?? "?")\(afterText)"
        }
        return ""
    }
    
    // MARK: NUMBER FORMAT, RETURN DOUBLE
    public func formatCustomNumberDecimal(currencyType: CurrencyType = .spain, withoutDecimals: Bool = false) -> Double? {
        return formatCustomNumber(numberStyle: .decimal, currencyType: currencyType, withoutDecimals: withoutDecimals)
    }

    public func formatCustomNumber(numberStyle: NumberFormatter.Style, currencyType: CurrencyType = .none, withoutDecimals: Bool) -> Double? {
        if let num = self as? NSNumber {
            let formater = NumberFormatter()
            formater.numberStyle = numberStyle
            
            if currencyType != .none {
                formater.locale = Locale(identifier: currencyType.rawValue)
            }
            
            if !withoutDecimals {
                formater.minimumFractionDigits = 2
                formater.maximumFractionDigits = 2
                formater.multiplier = 1
            }

            let result = formater.string(from: num) ?? "0.0"
            return Double(result)
        }
        return 0.0
    }
    
}

public enum CurrencyType: String {
    case none = ""
    /// Spain
    case spain = "es-ES"
    /// Chile
    case chile = "es-CL"
}

public enum GroupingSeparatorType: String {
    case none = ""
    case dot = "."
    case comma = ","
}



extension NumberTools {
    
    public enum TypeResult: String {
        case Int
        case Float
        case Double
    }
    /*
    public func getNumberFromJsonKey(typeResult: TypeResult, jsonObject: [String: AnyObject], keyName: String) -> Any {
        /*
        switch typeResult {
        case .Int:
            return getCustomNumber(typeResult: .Int, type: Int.self, jsonObject: jsonObject, keyName: keyName)
        case .Float:
            return getCustomNumber(typeResult: .Float, type: Float.self, jsonObject: jsonObject, keyName: keyName)
        case .Double:
            return getCustomNumber(typeResult: .Double, type: Double.self, jsonObject: jsonObject, keyName: keyName)
        }*/
    }*/
    /*
    private func getCustomNumber<T>(typeResult: TypeResult, type: T.Type, jsonObject: [String: AnyObject], keyName: String) -> T {
        
        if let result = jsonObject[keyName] as? T {
            return result
        } else if let resultString = jsonObject[keyName] as? String {
            
            switch typeResult {
                
            case .Int:
                if resultString.isNumeric {
                    return Int(resultString.replacingOccurrences(of: ",", with: ".")) as! T
                } else {
                    return Int(-1) as! T
                }
            case .Float:
                if resultString.isNumeric {
                    return Float(resultString.replacingOccurrences(of: ",", with: ".")) as! T
                } else {
                    return Float(-1.0) as! T
                }
            case .Double:
                if resultString.isNumeric {
                    return Double(resultString.replacingOccurrences(of: ",", with: ".")) as! T
                } else {
                    return Double(-1.0) as! T
                }
            }
            
        } else {
            
            switch typeResult {
                
            case .Int:
                return Int(-1) as! T
            case .Float:
                return Float(-1.0) as! T
            case .Double:
                return Double(-1.0) as! T
            }
        }
    }*/
}

