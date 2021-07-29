//
//  UserSettings.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/29/21.
//

import Foundation

final class UserSettings{
    
    private enum SettingsKeys: String{
        case defaultLanguage
        case defaultUnits
        case defaultLanguageAPI
        case defaultUnitsAPI
        case dateLocale
    }
    
    static var defaultUnitsAPI: String?{
        get{
            return UserDefaults.standard.string(forKey: SettingsKeys.defaultUnitsAPI.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.defaultUnitsAPI.rawValue
            if let units = newValue{
                defaults.set(units, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    static var defaultLanguageAPI: String?{
        get{
            return UserDefaults.standard.string(forKey: SettingsKeys.defaultLanguageAPI.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.defaultLanguageAPI.rawValue
            if let language = newValue{
                defaults.set(language, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    static var dateLocale: String?{
        get{
            return UserDefaults.standard.string(forKey: SettingsKeys.dateLocale.rawValue)
        }
        set{
            let defaults = UserDefaults.standard
            let key = SettingsKeys.dateLocale.rawValue
            if let locale = newValue{
                defaults.set(locale, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    static var defaultLanguage: String?{
        get{
            return UserDefaults.standard.string(forKey: SettingsKeys.defaultLanguage.rawValue)
        }
        set{
            let defaults = UserDefaults.standard
            let key = SettingsKeys.defaultLanguage.rawValue
            var finalValue: String?
            switch newValue{
                case "English", "Английский", "Англійська" :
                    finalValue = "English"
                    dateLocale = "en_EN"
                    defaultLanguageAPI = Lang.en.rawValue
                case "Russian", "Русский", "Російська":
                    finalValue = "Русский"
                    dateLocale = "ru_RU"
                    defaultLanguageAPI = Lang.ru.rawValue
                case "Ukrainian", "Украинский", "Українська":
                    finalValue = "Українська"
                    dateLocale = "uk_UA"
                    defaultLanguageAPI = Lang.ua.rawValue
                default:
                    break
            }
            if let lang = finalValue{
                defaults.set(lang, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    static var defaultUnits: String?{
        get{
            return UserDefaults.standard.string(forKey: SettingsKeys.defaultUnits.rawValue)
        }
        set{
            let defaults = UserDefaults.standard
            let key = SettingsKeys.defaultUnits.rawValue
            let localisedUnits = LocalisedData.shared.defLang!.settingsPickerUnitTitle
            var finalValue: String?
            switch newValue{
                case "Metric", "Метрические", "Метричні" :
                    finalValue = localisedUnits[1]
                    defaultUnitsAPI = Units.metric.rawValue
                case "Standard", "Стандартні", "Стандартные":
                    finalValue = localisedUnits[0]
                    defaultUnitsAPI = Units.standard.rawValue
                case "Imperial", "Имперские", "Імперські":
                    finalValue = localisedUnits[2]
                    defaultUnitsAPI = Units.imperial.rawValue
                default:
                    break
            }
            if let units = finalValue{
                defaults.set(units, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
}
