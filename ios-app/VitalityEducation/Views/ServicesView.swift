import SwiftUI

struct ServicesView: View {
    @StateObject private var data = VitalityEducationData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // 页面标题
                    VStack(spacing: 15) {
                        Text("核心服务项目")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                        
                        Text("为不同年龄段和需求的学员提供个性化教育咨询服务")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top, 20)
                    
                    // 服务卡片
                    LazyVStack(spacing: 20) {
                        ForEach(data.services) { service in
                            ServiceDetailCard(service: service)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // 咨询按钮
                    Button("立即咨询") {
                        // 处理咨询按钮点击
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                }
                .padding(.bottom, 30)
            }
            .background(Color("BackgroundColor"))
            .navigationTitle("服务项目")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ServiceDetailCard: View {
    let service: Service
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 卡片头部
            HStack(spacing: 15) {
                Image(systemName: service.icon)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(service.gradientColor)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(service.title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    Text(service.description)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)
                        .lineLimit(2)
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
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("服务特色")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        ForEach(service.features, id: \.self) { feature in
                            HStack(spacing: 10) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("PrimaryColor"))
                                
                                Text(feature)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
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

// MARK: - 圆角扩展
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    ServicesView()
} 