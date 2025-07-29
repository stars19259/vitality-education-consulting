import SwiftUI
import MessageUI

struct ContactView: View {
    @StateObject private var data = VitalityEducationData()
    @State private var showingContactForm = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // 页面标题
                    VStack(spacing: 15) {
                        Text("联系我们")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                        
                        Text("开始您的教育咨询之旅，获得专业的教育指导")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top, 20)
                    
                    // 联系信息卡片
                    VStack(spacing: 15) {
                        ForEach(data.contactInfo) { contact in
                            ContactInfoCard(contact: contact) {
                                handleContactAction(contact)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // 快速咨询表单
                    VStack(spacing: 20) {
                        Text("快速咨询")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        Button("填写咨询表单") {
                            showingContactForm = true
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 40)
                    }
                    .padding(.vertical, 30)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 20)
                    
                    // 咨询时间说明
                    VStack(spacing: 15) {
                        Text("咨询时间")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        VStack(spacing: 10) {
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(Color("PrimaryColor"))
                                Text("周一到周日 8:00-23:00")
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                            HStack {
                                Image(systemName: "globe")
                                    .foregroundColor(Color("PrimaryColor"))
                                Text("海外学员可申请特别时间段")
                                    .font(.system(size: 16, weight: .medium))
                            }
                        }
                        .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 20)
                    .background(Color("BackgroundColor"))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 30)
            }
            .background(Color("BackgroundColor"))
            .navigationTitle("联系我们")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingContactForm) {
                ContactFormView()
            }
            .alert("提示", isPresented: $showingAlert) {
                Button("确定") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func handleContactAction(_ contact: ContactInfo) {
        switch contact.type {
        case .wechat:
            UIPasteboard.general.string = contact.value
            alertMessage = "微信号已复制到剪贴板"
            showingAlert = true
            
        case .phone:
            if let url = URL(string: "tel:\(contact.value)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                } else {
                    alertMessage = "无法拨打电话"
                    showingAlert = true
                }
            }
            
        case .email:
            if let url = URL(string: "mailto:\(contact.value)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                } else {
                    alertMessage = "无法发送邮件"
                    showingAlert = true
                }
            }
            
        case .location:
            // 可以打开地图应用
            alertMessage = "上课地点：\(contact.value)"
            showingAlert = true
            
        case .schedule:
            alertMessage = "预约时间：\(contact.value)"
            showingAlert = true
        }
    }
}

struct ContactInfoCard: View {
    let contact: ContactInfo
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                Image(systemName: contact.icon)
                    .font(.system(size: 20))
                    .foregroundColor(Color("PrimaryColor"))
                    .frame(width: 40, height: 40)
                    .background(Color("PrimaryColor").opacity(0.1))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    if let description = contact.description {
                        Text(description)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                    
                    Text(contact.value)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContactFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var serviceType = "学生咨询"
    @State private var message = ""
    @State private var showingAlert = false
    
    private let serviceTypes = ["学生咨询", "家长咨询", "职业咨询", "其他"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("基本信息") {
                    TextField("姓名", text: $name)
                    TextField("邮箱", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("电话", text: $phone)
                        .keyboardType(.phonePad)
                }
                
                Section("咨询类型") {
                    Picker("选择咨询类型", selection: $serviceType) {
                        ForEach(serviceTypes, id: \.self) { type in
                            Text(type).tag(type)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section("咨询内容") {
                    TextEditor(text: $message)
                        .frame(minHeight: 100)
                }
                
                Section {
                    Button("提交咨询") {
                        submitForm()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("PrimaryColor"))
                }
            }
            .navigationTitle("咨询表单")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        dismiss()
                    }
                }
            }
            .alert("提交成功", isPresented: $showingAlert) {
                Button("确定") {
                    dismiss()
                }
            } message: {
                Text("您的咨询已提交，我们会尽快与您联系。")
            }
        }
    }
    
    private func submitForm() {
        // 这里可以添加表单验证逻辑
        guard !name.isEmpty && !email.isEmpty && !message.isEmpty else {
            return
        }
        
        // 模拟提交
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showingAlert = true
        }
    }
}

#Preview {
    ContactView()
} 