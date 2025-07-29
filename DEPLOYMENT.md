# 生命力教育咨询工作室网站部署指南

## GitHub Pages 部署步骤

### 1. 创建GitHub仓库

1. 访问 [GitHub.com](https://github.com)
2. 点击右上角的 "+" 号，选择 "New repository"
3. 仓库名称：`vitality-education-consulting`
4. 描述：`生命力教育咨询工作室官方网站`
5. 选择 "Public"（公开）
6. 不要勾选 "Add a README file"
7. 点击 "Create repository"

### 2. 上传代码到GitHub

在终端中执行以下命令：

```bash
# 添加远程仓库
git remote add origin https://github.com/你的用户名/vitality-education-consulting.git

# 推送到GitHub
git branch -M main
git push -u origin main
```

### 3. 配置GitHub Pages

1. 在GitHub仓库页面，点击 "Settings" 标签
2. 在左侧菜单中找到 "Pages"
3. 在 "Source" 部分，选择 "Deploy from a branch"
4. 在 "Branch" 下拉菜单中选择 "main"
5. 在 "Folder" 下拉菜单中选择 "/ (root)"
6. 点击 "Save"

### 4. 等待部署完成

GitHub Pages 会自动构建和部署您的网站。通常需要几分钟时间。

### 5. 访问您的网站

部署完成后，您的网站将可以通过以下URL访问：

```
https://你的用户名.github.io/vitality-education-consulting
```

## 自定义域名（可选）

如果您有自己的域名，可以：

1. 在仓库的 "Settings" > "Pages" 中
2. 在 "Custom domain" 部分输入您的域名
3. 保存设置
4. 在您的域名提供商处添加CNAME记录，指向 `你的用户名.github.io`

## 自动部署

每次您推送代码到main分支时，GitHub Pages会自动重新部署网站。

## 故障排除

### 如果网站没有显示
1. 检查仓库是否为公开
2. 确认GitHub Pages已启用
3. 等待几分钟让部署完成
4. 检查仓库设置中的Pages配置

### 如果样式没有加载
1. 确保所有文件路径正确
2. 检查CSS和JavaScript文件是否在正确位置
3. 清除浏览器缓存

## 性能优化

- 网站已配置PWA功能
- 包含Service Worker缓存
- 响应式设计适配各种设备
- 优化的图片和资源加载

## 联系方式

如有问题，请联系：
- 邮箱：contact@vitality-edu.com
- 微信：kaiwen251899

---

**生命力教育咨询工作室** - 培养真我幸福的好公民和未来世界的开创者 