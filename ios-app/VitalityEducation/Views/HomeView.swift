import SwiftUI

struct HomeView: View {
    @StateObject private var data = VitalityEducationData()
    @State private var animateStats = false
    @State private var showHeroContent = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // 主页横幅
                heroSection
                
                // 关于我们
                aboutSection
                
                // 核心服务
                servicesSection
                
                // 师资团队
                teamSection
                
                // 教育成果
                achievementsSection
                
                // 联系我们
                contactSection
            }
        }
        .background(Color("BackgroundColor"))
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                showHeroContent = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 2.0)) {
                    animateStats = true
                }
            }
        }
    }
    
    // MARK: - 主页横幅
    private var heroSection: some View {
        ZStack {
            // 背景渐变
            LinearGradient(
                colors: [Color("PrimaryColor"), Color("PrimaryDark")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            // 装饰性元素
            GeometryReader { geometry in
                ForEach(0..<6) { index in
                    Circle()
                        .fill(Color.white.opacity(0.1))
                        .frame(width: CGFloat.random(in: 20...60))
                        .position(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height)
                        )
                        .animation(
                            Animation.easeInOut(duration: 3.0)
                                .repeatForever(autoreverses: true)
                                .delay(Double(index) * 0.5),
                            value: animateStats
                        )
                }
            }
            
            VStack(spacing: 30) {
                Spacer()
                
                // 标题
                VStack(spacing: 20) {
                    Text("培养真我幸福的好公民")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .opacity(showHeroContent ? 1 : 0)
                        .offset(y: showHeroContent ? 0 : 30)
                    
                    Text("未来世界的开创者")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .opacity(showHeroContent ? 1 : 0)
                        .offset(y: showHeroContent ? 0 : 30)
                }
                
                // 副标题
                Text("全球大中小学生、家长及职业人士的教育咨询专家")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .opacity(showHeroContent ? 1 : 0)
                
                // 统计数据
                HStack(spacing: 40) {
                    StatCard(
                        number: animateStats ? data.statistics.countries : 0,
                        label: "国家学员",
                        icon: "globe"
                    )
                    
                    StatCard(
                        number: animateStats ? data.statistics.coreAbilities : 0,
                        label: "核心能力",
                        icon: "brain.head.profile"
                    )
                    
                    StatCard(
                        number: animateStats ? data.statistics.customization : 0,
                        label: "个性化定制",
                        icon: "person.crop.circle.badge.checkmark",
                        suffix: "%"
                    )
                }
                .padding(.horizontal, 20)
                
                // 操作按钮
                HStack(spacing: 20) {
                    Button("立即咨询") {
                        // 处理咨询按钮点击
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                    Button("了解更多") {
                        // 处理了解更多按钮点击
                    }
                    .buttonStyle(SecondaryButtonStyle())
                }
                .padding(.horizontal, 40)
                .opacity(showHeroContent ? 1 : 0)
                .offset(y: showHeroContent ? 0 : 30)
                
                Spacer()
            }
            .padding(.vertical, 60)
        }
        .frame(height: UIScreen.main.bounds.height * 0.9)
    }
    
    // MARK: - 关于我们
    private var aboutSection: some View {
        VStack(spacing: 40) {
            SectionHeader(
                title: "关于生命力教育",
                subtitle: "成立于2018年，专注于服务全球大中小学生、家长及职业人士的教育咨询机构"
            )
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                AboutCard(
                    icon: "target",
                    title: "教育使命",
                    content: "培养真我幸福的好公民和未来世界的开创者"
                )
                
                AboutCard(
                    icon: "eye",
                    title: "教育愿景",
                    content: "通过个性化导师制，帮助学员制定百年人生规划"
                )
                
                AboutCard(
                    icon: "handshake",
                    title: "核心价值观",
                    content: "高奉献教师团队、互相尊重、高薪酬的公平双赢理念"
                )
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 60)
        .background(Color("BackgroundColor"))
    }
    
    // MARK: - 核心服务
    private var servicesSection: some View {
        VStack(spacing: 40) {
            SectionHeader(
                title: "核心服务项目",
                subtitle: "为不同年龄段和需求的学员提供个性化教育咨询服务"
            )
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(data.services) { service in
                    ServiceCard(service: service)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 60)
        .background(Color.white)
    }
    
    // MARK: - 师资团队
    private var teamSection: some View {
        VStack(spacing: 40) {
            SectionHeader(
                title: "国际化师资团队",
                subtitle: "来自哈佛、清华、北大等名校的教授、博导、博士后及优秀学霸"
            )
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(data.team) { member in
                    TeamCard(member: member)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 60)
        .background(Color("BackgroundColor"))
    }
    
    // MARK: - 教育成果
    private var achievementsSection: some View {
        VStack(spacing: 40) {
            SectionHeader(
                title: "卓越教育成果",
                subtitle: "覆盖各年龄段学员的显著成就"
            )
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(data.achievements) { achievement in
                    AchievementCard(achievement: achievement)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 60)
        .background(Color.white)
    }
    
    // MARK: - 联系我们
    private var contactSection: some View {
        VStack(spacing: 30) {
            SectionHeader(
                title: "开始您的教育咨询之旅",
                subtitle: "立即联系我们，获得专业的教育指导"
            )
            
            VStack(spacing: 20) {
                ForEach(data.contactInfo.prefix(3)) { contact in
                    ContactRow(contact: contact)
                }
            }
            .padding(.horizontal, 20)
            
            Button("立即咨询") {
                // 处理咨询按钮点击
            }
            .buttonStyle(PrimaryButtonStyle())
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
        }
        .padding(.vertical, 60)
        .background(Color("BackgroundColor"))
    }
}

// MARK: - 统计卡片
struct StatCard: View {
    let number: Int
    let label: String
    let icon: String
    let suffix: String
    
    init(number: Int, label: String, icon: String, suffix: String = "") {
        self.number = number
        self.label = label
        self.icon = icon
        self.suffix = suffix
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.white.opacity(0.8))
            
            Text("\(number)\(suffix)")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.white.opacity(0.1))
        .cornerRadius(15)
    }
}

// MARK: - 关于卡片
struct AboutCard: View {
    let icon: String
    let title: String
    let content: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(Color("PrimaryColor"))
                .frame(width: 60, height: 60)
                .background(Color("PrimaryColor").opacity(0.1))
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            Text(content)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(4)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

// MARK: - 章节标题
struct SectionHeader: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            Text(subtitle)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

// MARK: - 按钮样式
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(
                LinearGradient(
                    colors: [Color("PrimaryColor"), Color("PrimaryDark")],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color("PrimaryColor"))
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(Color.white)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("PrimaryColor"), lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    HomeView()
} 