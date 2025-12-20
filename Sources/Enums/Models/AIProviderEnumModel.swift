//
//  SettingsModel.swift
//  iChat
//
//  Created by Lion on 2025/5/19.
//

import Foundation
import SwiftUI

class AIProviderEnumModel {
    var title: String = ""
    var icon: String = ""
    var supportUrl: String = ""
    var APIURL: String = ""
    var service: AIProtocol = GrokService()

    init(
        title:String,
        icon: String,
        supportUrl: String,
        APIURL: String,
        service: AIProtocol
    ) {
        self.title = title
        self.icon = icon
        self.supportUrl = supportUrl
        self.APIURL = APIURL
        self.service = service
    }

    static func getGML() -> AIProviderEnumModel {
        let title = "GML(Zhipu)"
        let icon = ""
        let supportUrl = "https://www.bigmodel.cn/invite?icode=SbhyEoRyatGVt2/j3XXIzn3uFJ1nZ0jLLgipQkYjpcA="
        let APIURL = "https://open.bigmodel.cn/api/paas/v4"
        let service = DeepSeekService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }
    
    static func getMiMo() -> AIProviderEnumModel {
        let title = "MiMo(Xiaomi)"
        let icon = ""
        let supportUrl = "https://platform.xiaomimimo.com/#/console/api-keys"
        let APIURL = "https://api.xiaomimimo.com"
        let service = MiMoService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }
    static func getGrok() -> AIProviderEnumModel {
        let title = "XAI(Grok)"
        let icon = ""
        let supportUrl = "https://console.x.ai"
        let APIURL = "https://api.x.ai"
        let service = GrokService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }

    static func getOpenAI() -> AIProviderEnumModel {
        let title = "OpenAI(GPT)"
        let icon = ""
        let supportUrl = "https://platform.openai.com/settings/organization/api-keys"
        let APIURL = "https://api.openai.com"
        let service = GrokService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }
    static func getZenMux() -> AIProviderEnumModel {
        let title = "ZenMux(OpenAI)"
        let icon = ""
        let supportUrl = "https://zenmux.ai/invite/3KA0VI"
        let APIURL = "https://zenmux.ai/api"
        let service = ZenMuxService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }
    static func getOpenRouter() -> AIProviderEnumModel {
        let title = "OpenRouter(OpenAI)"
        let icon = ""
        let supportUrl = "https://openrouter.ai/settings/keys"
        let APIURL = "https://openrouter.ai/api"
        let service = OpenRouterService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }

    static func getGemini() -> AIProviderEnumModel {
        let title = "Google(Gemini)"
        let icon = ""
        let supportUrl = "https://aistudio.google.com/apikey"
        let APIURL = "https://generativelanguage.googleapis.com"
        let service = GeminiService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }
    static func getDeepSeek() -> AIProviderEnumModel {
        let title = "DeepSeek"
        let icon = ""
        let supportUrl = "https://platform.deepseek.com/api_keys"
        let APIURL = "https://api.deepseek.com"
        let service = DeepSeekService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }
    static func getCloudflare() -> AIProviderEnumModel {
        let title = "Cloudflare(Compat)"
        let icon = ""
        let supportUrl = "https://developers.cloudflare.com/ai-gateway/usage/chat-completion/"
        let APIURL = "https://gateway.ai.cloudflare.com/v1/{account_id}/{gateway_id}"
        let service = CloudflareService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }
    static func getCustom() -> AIProviderEnumModel {
        let title = "Custom(OpenAI)"
        let icon = ""
        let supportUrl = ""
        let APIURL = ""
        let service = GrokService()
        return AIProviderEnumModel(
            title: title,
            icon: icon,
            supportUrl: supportUrl,
            APIURL: APIURL,
            service: service
        )
    }

}
