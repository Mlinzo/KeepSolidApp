//
//  LocalisedData.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/29/21.
//

import Foundation

struct LangData{
    let humidityTitle: String
    let uvindexTitle: String
    let windTitle: String
    let weekTitle: String
    let settingsCancelButtonTitle: String
    let settingsDoneButtonTitle: String
    let settingsTitle: String
    let settingsUnitsTitle: String
    let settingsLanguageTitle: String
    let settingsPickerSkipButtonTitle: String
    let settingsPickerDoneButtonTitle: String
    let windSpeedUnits: String
    let settingsPickerUnitTitle: [String]
    let settingsPickerLanguageTitle: [String]
}

final class LocalisedData{
    static let shared = LocalisedData()
    private init(){}
    private var storage = UserDefaults()
    var enData = LangData(humidityTitle: "Humidity", uvindexTitle: "UV Index", windTitle: "Wind", weekTitle: "7 days", settingsCancelButtonTitle: "Cancel", settingsDoneButtonTitle: "Done", settingsTitle: "Settings", settingsUnitsTitle: "Units", settingsLanguageTitle: "Language", settingsPickerSkipButtonTitle: "Skip", settingsPickerDoneButtonTitle: "Done", windSpeedUnits: "kmh", settingsPickerUnitTitle: ["Standard", "Metric", "Imperial"], settingsPickerLanguageTitle: ["English", "Ukrainian", "Russian"])
    
    var uaData = LangData(humidityTitle: "Вологість", uvindexTitle: "УФ-індекс", windTitle: "Вітер", weekTitle: "7 днів", settingsCancelButtonTitle: "Скасувати", settingsDoneButtonTitle: "Готово", settingsTitle: "Налаштування", settingsUnitsTitle: "Одиниці виміру", settingsLanguageTitle: "Мова", settingsPickerSkipButtonTitle: "Пропустити", settingsPickerDoneButtonTitle: "Готово", windSpeedUnits: "км/год", settingsPickerUnitTitle: ["Стандартні", "Метричні","Імперські"], settingsPickerLanguageTitle: ["Англійська", "Українська", "Російська"])
    
    var ruData = LangData(humidityTitle: "Влажность", uvindexTitle: "УФ-индекс", windTitle: "Ветер", weekTitle: "7 дней", settingsCancelButtonTitle: "Отмена", settingsDoneButtonTitle: "Готово", settingsTitle: "Настройки", settingsUnitsTitle: "Единицы измерения", settingsLanguageTitle: "Язык", settingsPickerSkipButtonTitle: "Пропустить", settingsPickerDoneButtonTitle: "Готово", windSpeedUnits: "км/ч", settingsPickerUnitTitle: ["Стандартные", "Метрические", "Имперские"], settingsPickerLanguageTitle: ["Английский", "Украинский", "Русский"])
    var defLang: LangData?{
        set{}
        get{
            switch UserSettings.defaultLanguage {
            case "English", "Английский", "Англійська" :
                return enData
            case "Russian", "Русский", "Російська":
                return ruData
            case "Ukrainian", "Украинский", "Українська":
                return uaData
            default:
                break
            }
            return enData
        }
    }
    
    
}
