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
    let windSpeedUnits: [String]
    let settingsPickerUnitTitle: [String]
    let settingsPickerLanguageTitle: [String]
    let waitScreen: String
    let minLabel: String
    let maxLabel:String
    let dayPeriod: [String]
    let detailBackButton: String
    let tempLabel: String
    let feelsLabel: String
    let pressureLabel: String
    let detailsLabel: String
    let pressureUnits: String
    
}

final class LocalisedData{
    static let shared = LocalisedData()
    private init(){}
    private var storage = UserDefaults()
    var enData = LangData(humidityTitle: "Humidity", uvindexTitle: "UV Index", windTitle: "Wind", weekTitle: "7 days", settingsCancelButtonTitle: "Cancel", settingsDoneButtonTitle: "Done", settingsTitle: "Settings", settingsUnitsTitle: "Units", settingsLanguageTitle: "Language", settingsPickerSkipButtonTitle: "Skip", settingsPickerDoneButtonTitle: "Done", windSpeedUnits: ["m/s","mi/h"], settingsPickerUnitTitle: ["Standard", "Metric", "Imperial"], settingsPickerLanguageTitle: ["English", "Ukrainian", "Russian"], waitScreen: "Please wait", minLabel: "Min:", maxLabel: "Max:", dayPeriod: ["Morning","Afternoon","Evening","Night"], detailBackButton: "Back", tempLabel: "Temp:", feelsLabel: "Feels:", pressureLabel: "Pressure", detailsLabel: "Details", pressureUnits: "pHa")
    
    var uaData = LangData(humidityTitle: "Вологість", uvindexTitle: "УФ-індекс", windTitle: "Вітер", weekTitle: "7 днів", settingsCancelButtonTitle: "Скасувати", settingsDoneButtonTitle: "Готово", settingsTitle: "Налаштування", settingsUnitsTitle: "Одиниці виміру", settingsLanguageTitle: "Мова", settingsPickerSkipButtonTitle: "Пропустити", settingsPickerDoneButtonTitle: "Готово", windSpeedUnits: ["м/c","миль/год"], settingsPickerUnitTitle: ["Стандартні", "Метричні","Імперські"], settingsPickerLanguageTitle: ["Англійська", "Українська", "Російська"], waitScreen: "Будь ласка, зачекайте", minLabel: "Мін:", maxLabel: "Макс:", dayPeriod: ["Ранок", "Полудень", "Вечір", "Ніч"], detailBackButton: "Повернутися", tempLabel: "Темп:", feelsLabel: "Відч:", pressureLabel: "Тиск", detailsLabel: "Деталі", pressureUnits: "гПа")
    
    var ruData = LangData(humidityTitle: "Влажность", uvindexTitle: "УФ-индекс", windTitle: "Ветер", weekTitle: "7 дней", settingsCancelButtonTitle: "Отмена", settingsDoneButtonTitle: "Готово", settingsTitle: "Настройки", settingsUnitsTitle: "Единицы измерения", settingsLanguageTitle: "Язык", settingsPickerSkipButtonTitle: "Пропустить", settingsPickerDoneButtonTitle: "Готово", windSpeedUnits:["м/c", "миль/ч"], settingsPickerUnitTitle: ["Стандартные", "Метрические", "Имперские"], settingsPickerLanguageTitle: ["Английский", "Украинский", "Русский"], waitScreen: "Пожалуйста, подождите", minLabel: "Мин:", maxLabel: "Макс:", dayPeriod: ["Утро", "Полдень", "Вечер", "Ночь"], detailBackButton: "Назад", tempLabel: "Темп:", feelsLabel: "Ощущ:", pressureLabel: "Давление", detailsLabel: "Детали", pressureUnits: "гПа")
    
    var defLang: LangData?{
        set{}
        get{
            switch UserSettings.defaultLanguage {
            case "English":
                return enData
            case "Русский":
                return ruData
            case "Українська":
                return uaData
            default:
                break
            }
            return enData
        }
    }
}
