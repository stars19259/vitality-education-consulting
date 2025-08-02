# 生命力教育咨询工作室网站

## 项目简介

这是一个专业的教育咨询工作室网站，致力于为学生提供全方位的教育咨询服务。网站采用现代化的设计理念，提供响应式布局和优秀的用户体验。

## 主要功能

### 🎯 核心功能
- **响应式设计**: 完美适配桌面、平板和移动设备
- **现代化UI**: 采用渐变色彩和流畅动画效果
- **PWA支持**: 可安装为桌面应用，支持离线访问
- **表单验证**: 实时验证用户输入，提供友好反馈
- **无障碍访问**: 支持键盘导航和屏幕阅读器

### 📱 用户体验
- **平滑滚动**: 页面内导航平滑过渡
- **加载动画**: 优雅的页面加载效果
- **返回顶部**: 便捷的页面导航功能
- **进度条**: 实时显示页面滚动进度
- **移动菜单**: 移动端友好的导航菜单

### 🔧 技术特性
- **Service Worker**: 离线缓存和推送通知
- **懒加载**: 图片和内容的延迟加载
- **性能优化**: 代码分割和资源压缩
- **SEO友好**: 完整的元标签和结构化数据
- **错误处理**: 完善的错误捕获和报告

## 技术栈

- **HTML5**: 语义化标记
- **CSS3**: 现代样式和动画
- **JavaScript (ES6+)**: 交互逻辑和功能
- **PWA**: 渐进式Web应用
- **Service Worker**: 离线功能
- **Font Awesome**: 图标库
- **Google Fonts**: 中文字体

## 文件结构

```
website/
├── index.html          # 主页面
├── styles.css          # 样式文件
├── script.js           # JavaScript逻辑
├── manifest.json       # PWA配置
├── sw.js              # Service Worker
├── robots.txt          # 搜索引擎配置
├── sitemap.xml        # 网站地图
├── .nojekyll          # GitHub Pages配置
├── README.md          # 项目说明
├── images/            # 图片资源
│   ├── logo.png       # 网站Logo
│   ├── icon-192.png   # PWA图标
│   └── icon-512.png   # PWA图标
└── .github/           # GitHub配置
    └── workflows/     # 自动化部署
        └── deploy.yml # 部署脚本
```

## 部署方式

### 1. GitHub Pages (推荐)
```bash
# 推送到GitHub仓库
git add .
git commit -m "Initial website deployment"
git push origin main

# 在GitHub仓库设置中启用Pages
# Settings > Pages > Source: Deploy from a branch
```

### 2. Netlify
```bash
# 连接GitHub仓库到Netlify
# 自动部署，支持自定义域名
```

### 3. Vercel
```bash
# 连接GitHub仓库到Vercel
# 自动部署，支持预览环境
```

## 本地开发

### 启动开发服务器
```bash
# 使用Python
python3 -m http.server 8000

# 使用Node.js
npx serve .

# 使用PHP
php -S localhost:8000
```

### 访问地址
- 本地开发: `http://localhost:8000`
- 生产环境: `https://your-domain.com`

## 自定义配置

### 修改主题色彩
在 `styles.css` 中修改CSS变量：
```css
:root {
  --primary-color: #667eea;
  --secondary-color: #764ba2;
  --accent-color: #f093fb;
}
```

### 更新网站信息
在 `index.html` 中修改：
- 网站标题和描述
- 联系信息
- 服务项目
- 团队介绍

### 添加新页面
1. 创建新的HTML文件
2. 在导航菜单中添加链接
3. 更新 `sitemap.xml`

## 性能优化

### 已实现的优化
- ✅ 图片懒加载
- ✅ CSS和JS压缩
- ✅ 浏览器缓存
- ✅ Service Worker缓存
- ✅ 代码分割
- ✅ 资源预加载

### 进一步优化建议
- 🔄 使用WebP图片格式
- 🔄 实施CDN加速
- 🔄 启用Gzip压缩
- 🔄 优化字体加载

## 浏览器支持

- ✅ Chrome 60+
- ✅ Firefox 55+
- ✅ Safari 12+
- ✅ Edge 79+
- ✅ 移动端浏览器

## 贡献指南

1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 联系方式

- 网站: [生命力教育咨询工作室](https://your-domain.com)
- 邮箱: info@vitality-edu.com
- 电话: 400-123-4567

## 更新日志

### v1.0.0 (2024-08-02)
- ✨ 初始版本发布
- 🎨 现代化UI设计
- 📱 响应式布局
- ⚡ PWA功能
- 🔧 Service Worker支持
- 📝 完整文档

---

**生命力教育咨询工作室** - 培养真我幸福的好公民，未来世界的开创者 