// LanguageStatsController.swift

import Vapor

struct LanguageStatsController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let api = routes.grouped("api")
        api.get("language-stats", use: getLanguageStats)
    }

    func getLanguageStats(req: Request) async throws -> Response {
        let _ = req.query[String.self, at: "path"] ?? "."
        let dummyResult: [String: Double] = [
            "Swift": 100.0
        ]
        return try Response(status: .ok, body: .init(data: JSONEncoder().encode(dummyResult)))
    }
}
