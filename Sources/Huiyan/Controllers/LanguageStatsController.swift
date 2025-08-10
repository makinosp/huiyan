// LanguageStatsController.swift

import Vapor

struct LanguageStatsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let api = routes.grouped("api")
        api.get("language-stats", use: getLanguageStats)
    }

    func getLanguageStats(req: Request) async throws -> Response {
        // クエリパラメータ path（省略時はプロジェクトルート）
        let path = req.query[String.self, at: "path"] ?? "."
        // 言語割合計算ロジックは後で実装
        let dummyResult: [String: Double] = [
            "Swift": 100.0
        ]
        return try Response(status: .ok, body: .init(data: JSONEncoder().encode(dummyResult)))
    }
}
