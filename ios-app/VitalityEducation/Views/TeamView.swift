import SwiftUI

struct TeamView: View {
    @StateObject private var data = VitalityEducationData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // 页面标题
                    VStack(spacing: 15) {
                        Text("国际化师资团队")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                        
                        Text("来自哈佛、清华、北大等名校的教授、博导、博士后及优秀学霸")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top, 20)
                    
                    // 团队成员卡片
                    LazyVStack(spacing: 20) {
                        ForEach(data.team) { member in
                            TeamDetailCard(member: member)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // 咨询按钮
                    Button("联系团队") {
                        // 处理联系按钮点击
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                }
                .padding(.bottom, 30)
            }
            .background(Color("BackgroundColor"))
            .navigationTitle("师资团队")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct TeamDetailCard: View {
    let member: TeamMember
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 卡片头部
            HStack(spacing: 15) {
                // 头像
                ZStack {
                    Circle()
                        .fill(member.isFounder ? 
                              LinearGradient(colors: [Color("PrimaryColor"), Color("PrimaryDark")], startPoint: .topLeading, endPoint: .bottomTrailing) :
                              LinearGradient(colors: [Color("SecondaryColor"), Color("SecondaryDark")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 60)
                    
                    member.avatarImage
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .overlay(
                    Circle()
                        .stroke(member.isFounder ? Color("PrimaryColor") : Color.clear, lineWidth: 3)
                )
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(member.name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        if member.isFounder {
                            Text("创始人")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .background(Color("PrimaryColor"))
                                .cornerRadius(8)
                        }
                    }
                    
                    Text(member.title)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color("PrimaryColor"))
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("PrimaryColor"))
                }
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(15, corners: [.topLeft, .topRight])
            
            // 展开内容
            if isExpanded {
                VStack(alignment: .leading, spacing: 15) {
                    Divider()
                        .padding(.horizontal, 20)
                    
                    // 教育背景
                    VStack(alignment: .leading, spacing: 10) {
                        Text("教育背景")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        ForEach(member.credentials, id: \.self) { credential in
                            HStack(spacing: 10) {
                                Image(systemName: "graduationcap.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("PrimaryColor"))
                                
                                Text(credential)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // 个人介绍
                    if let description = member.description {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("个人介绍")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.primary)
                            
                            Text(description)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.secondary)
                                .lineLimit(nil)
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    .padding(.bottom, 20)
                }
                .background(Color.white)
                .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .animation(.easeInOut(duration: 0.3), value: isExpanded)
    }
}

#Preview {
    TeamView()
} 