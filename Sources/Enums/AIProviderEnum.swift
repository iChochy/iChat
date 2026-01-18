//
//  AIProviderIdentifier.swift
//  iChat
//
//  Created by Lion on 2025/4/28.
//


// AI 提供商标识符 (可扩展)
enum AIProviderEnum: String, Codable, CaseIterable, Identifiable {
    case grok = "Grok"
    case deepSeek = "DeepSeek"
    case siliconFlow = "SiliconFlow"
    case glm = "GLM"
    case mimo = "MiMo"
    case nvidia = "Nvidia"
    case openAI = "OpenAI"
    case gemini = "Gemini"
    case zenMux = "ZenMux"
    case openRouter = "OpenRouter"
    case cloudflare = "Cloudflare"
    case custom = "Custom(OpenAI)"

    var id: String { self.rawValue }
    var name: String { self.rawValue }
    
    private static let data:[Self:AIProviderEnumModel] = [
        .grok:AIProviderEnumModel.getGrok(),
        .glm:AIProviderEnumModel.getGML(),
        .mimo:AIProviderEnumModel.getMiMo(),
        .nvidia:AIProviderEnumModel.getNIM(),
        .openAI:AIProviderEnumModel.getOpenAI(),
        .gemini:AIProviderEnumModel.getGemini(),
        .zenMux:AIProviderEnumModel.getZenMux(),
        .openRouter:AIProviderEnumModel.getOpenRouter(),
        .deepSeek:AIProviderEnumModel.getDeepSeek(),
        .siliconFlow:AIProviderEnumModel.getSiliconFlow(),
        .cloudflare:AIProviderEnumModel.getCloudflare(),
        .custom:AIProviderEnumModel.getCustom()
    ]
    

    var data:AIProviderEnumModel {
        Self.data[self]!
    }
    
    
}
