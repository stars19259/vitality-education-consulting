import Foundation
import SwiftUI

// MARK: - 服务模型
struct Service: Identifiable, Codable {
    let id: Int
    let title: String
    let icon: String
    let description: String
    let features: [String]
    let color: String
    
    var gradientColor: LinearGradient {
        switch color {
        case "primary":
            return LinearGradient(colors: [Color("PrimaryColor"), Color("PrimaryDark")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "secondary":
            return LinearGradient(colors: [Color("SecondaryColor"), Color("SecondaryDark")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "accent":
            return LinearGradient(colors: [Color("AccentColor"), Color("AccentDark")], startPoint: .topLeading, endPoint: .bottomTrailing)
        default:
            return LinearGradient(colors: [Color("PrimaryColor"), Color("PrimaryDark")], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

// MARK: - 团队成员模型
struct TeamMember: Identifiable, Codable {
    let id: Int
    let name: String
    let title: String
    let avatar: String?
    let credentials: [String]
    let description: String?
    let isFounder: Bool
    
    var avatarImage: Image {
        if let avatar = avatar {
            return Image(avatar)
        } else {
            return Image(systemName: "person.circle.fill")
        }
    }
}

// MARK: - 教育成果模型
struct Achievement: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let icon: String
    let category: String
    let year: Int?
}

// MARK: - 统计数据模型
struct Statistics: Codable {
    let countries: Int
    let coreAbilities: Int
    let customization: Int
    let students: Int
    let successRate: Double
}

// MARK: - 联系信息模型
struct ContactInfo: Identifiable, Codable {
    let id: Int
    let type: ContactType
    let value: String
    let icon: String
    let description: String?
    
    enum ContactType: String, Codable {
        case wechat = "wechat"
        case phone = "phone"
        case email = "email"
        case location = "location"
        case schedule = "schedule"
    }
}

// MARK: - 生命力教育数据
class VitalityEducationData: ObservableObject {
    @Published var services: [Service] = []
    @Published var team: [TeamMember] = []
    @Published var achievements: [Achievement] = []
    @Published var statistics: Statistics
    @Published var contactInfo: [ContactInfo] = []
    
    init() {
        self.statistics = Statistics(
            countries: 7,
            coreAbilities: 23,
            customization: 100,
            students: 1000,
            successRate: 98.5
        )
        
        loadData()
    }
    
    private func loadData() {
        // 加载服务数据
        services = [
            Service(
                id: 1,
                title: "清华北大本硕博生教育咨询",
                icon: "graduationcap.fill",
                description: "为顶尖学府学生提供学术突破与职业发展指导",
                features: ["学术规划与研究方向", "职业发展路径设计", "国际交流与合作机会"],
                color: "primary"
            ),
            Service(
                id: 2,
                title: "中小学生导师课",
                icon: "person.2.fill",
                description: "为幼儿园到高中学生提供全方位成长指导",
                features: ["学业成绩提升", "综合素质培养", "国际名校申请"],
                color: "secondary"
            ),
            Service(
                id: 3,
                title: "父母家庭教育课程",
                icon: "house.fill",
                description: "帮助家长提升教育能力，改善亲子关系",
                features: ["家庭教育规划研讨", "育婴咨询指导", "亲子关系优化"],
                color: "accent"
            ),
            Service(
                id: 4,
                title: "职业发展咨询",
                icon: "briefcase.fill",
                description: "为职业人士提供晋升与收入增长指导",
                features: ["职业规划与转型", "技能提升与认证", "创业指导与支持"],
                color: "primary"
            )
        ]
        
        // 加载团队成员数据
        team = [
            TeamMember(
                id: 1,
                name: "Kaiwen",
                title: "创始人 & 首席导师",
                avatar: nil,
                credentials: ["北京大学客座讲师", "北大《教育与幸福》助教", "复旦《健康心理学》助教"],
                description: "师从著名教育家文教授和心理学家孙教授，开创了横跨5~40+岁学员的全教育阶段、全球化、高端的新型导师制教育模式。",
                isFounder: true
            ),
            TeamMember(
                id: 2,
                name: "Tony老师",
                title: "哈佛大学导师",
                avatar: nil,
                credentials: ["哈佛大学城市建筑专业", "清华苏世民书院硕士", "《福布斯》U30精英奖"],
                description: nil,
                isFounder: false
            ),
            TeamMember(
                id: 3,
                name: "王老师",
                title: "哈佛教育学硕士",
                avatar: nil,
                credentials: ["哈佛大学教育学硕士", "复旦十佳优秀毕业生", "复旦外语系绩点第一"],
                description: nil,
                isFounder: false
            ),
            TeamMember(
                id: 4,
                name: "W老师",
                title: "清华哲学硕士",
                avatar: nil,
                credentials: ["清华绩点专业第一", "斯坦福大学交流生", "清北联合粤歌赛冠军"],
                description: nil,
                isFounder: false
            )
        ]
        
        // 加载教育成果数据
        achievements = [
            Achievement(
                id: 1,
                title: "清华附小学生",
                description: "获得班级第一名🥇",
                icon: "trophy.fill",
                category: "学业成就",
                year: 2024
            ),
            Achievement(
                id: 2,
                title: "海淀区三好学生",
                description: "8个海淀区三好学生⭐️",
                icon: "star.fill",
                category: "综合素养",
                year: 2024
            ),
            Achievement(
                id: 3,
                title: "北京市三好学生",
                description: "1个北京市三好学生⭐️",
                icon: "medal.fill",
                category: "综合素养",
                year: 2024
            ),
            Achievement(
                id: 4,
                title: "全国网球冠军",
                description: "高一学生获得全国网球高中女子团体冠军🥇",
                icon: "sportscourt.fill",
                category: "体育成就",
                year: 2024
            ),
            Achievement(
                id: 5,
                title: "美国名校录取",
                description: "美国高中生获得全美专业排名第一的名校录取",
                icon: "building.columns.fill",
                category: "国际教育",
                year: 2024
            ),
            Achievement(
                id: 6,
                title: "奖学金获得",
                description: "累计约10万美元入学奖学金🥇",
                icon: "dollarsign.circle.fill",
                category: "国际教育",
                year: 2024
            )
        ]
        
        // 加载联系信息数据
        contactInfo = [
            ContactInfo(
                id: 1,
                type: .wechat,
                value: "kaiwen251899",
                icon: "message.fill",
                description: "微信咨询"
            ),
            ContactInfo(
                id: 2,
                type: .location,
                value: "清华校内、校外及线上腾讯会议",
                icon: "location.fill",
                description: "上课地点"
            ),
            ContactInfo(
                id: 3,
                type: .schedule,
                value: "周一到周日8-23点",
                icon: "clock.fill",
                description: "预约时间"
            ),
            ContactInfo(
                id: 4,
                type: .phone,
                value: "400-123-4567",
                icon: "phone.fill",
                description: "电话咨询"
            ),
            ContactInfo(
                id: 5,
                type: .email,
                value: "contact@vitality-edu.com",
                icon: "envelope.fill",
                description: "邮箱咨询"
            )
        ]
    }
} 