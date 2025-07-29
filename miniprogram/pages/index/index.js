// index.js
const app = getApp()

Page({
  data: {
    stats: {
      countries: 7,
      coreAbilities: 23,
      customization: 100
    },
    services: [],
    team: [],
    achievements: []
  },

  onLoad() {
    // 从全局数据获取生命力教育数据
    const vitalityData = app.globalData.vitalityData
    this.setData({
      services: vitalityData.services,
      team: vitalityData.team,
      achievements: vitalityData.achievements
    })

    // 启动数字动画
    this.animateNumbers()
  },

  onShow() {
    // 页面显示时的逻辑
  },

  // 数字动画
  animateNumbers() {
    const stats = this.data.stats
    const animateValue = (obj, start, end, duration) => {
      let startTimestamp = null
      const step = (timestamp) => {
        if (!startTimestamp) startTimestamp = timestamp
        const progress = Math.min((timestamp - startTimestamp) / duration, 1)
        const current = Math.floor(progress * (end - start) + start)
        
        // 更新对应的数据
        if (obj === 'countries') {
          this.setData({
            'stats.countries': current
          })
        } else if (obj === 'coreAbilities') {
          this.setData({
            'stats.coreAbilities': current
          })
        } else if (obj === 'customization') {
          this.setData({
            'stats.customization': current
          })
        }
        
        if (progress < 1) {
          requestAnimationFrame(step)
        }
      }
      requestAnimationFrame(step)
    }

    // 延迟启动动画
    setTimeout(() => {
      animateValue('countries', 0, stats.countries, 2000)
      animateValue('coreAbilities', 0, stats.coreAbilities, 2000)
      animateValue('customization', 0, stats.customization, 2000)
    }, 1000)
  },

  // 立即咨询
  onConsult() {
    wx.showModal({
      title: '立即咨询',
      content: '您可以通过以下方式联系我们：\n\n微信：kaiwen251899\n\n或点击下方按钮跳转到咨询页面',
      confirmText: '去咨询页面',
      cancelText: '复制微信号',
      success: (res) => {
        if (res.confirm) {
          // 跳转到咨询页面
          wx.switchTab({
            url: '/pages/contact/contact'
          })
        } else {
          // 复制微信号
          wx.setClipboardData({
            data: 'kaiwen251899',
            success: () => {
              wx.showToast({
                title: '微信号已复制',
                icon: 'success'
              })
            }
          })
        }
      }
    })
  },

  // 了解更多
  onLearnMore() {
    wx.showActionSheet({
      itemList: ['关于我们', '服务项目', '师资团队', '教育成果'],
      success: (res) => {
        const pages = [
          '/pages/about/about',
          '/pages/services/services',
          '/pages/team/team',
          '/pages/achievements/achievements'
        ]
        
        if (pages[res.tapIndex]) {
          wx.navigateTo({
            url: pages[res.tapIndex]
          })
        }
      }
    })
  },

  // 服务项目点击
  onServiceTap(e) {
    const service = e.currentTarget.dataset.service
    wx.showModal({
      title: service.title,
      content: service.description,
      showCancel: false,
      confirmText: '了解详情',
      success: (res) => {
        if (res.confirm) {
          // 跳转到服务详情页面
          wx.switchTab({
            url: '/pages/services/services'
          })
        }
      }
    })
  },

  // 团队成员点击
  onTeamTap(e) {
    const member = e.currentTarget.dataset.member
    let content = `${member.name}\n${member.title}\n\n`
    
    member.credentials.forEach(credential => {
      content += `• ${credential}\n`
    })
    
    if (member.description) {
      content += `\n${member.description}`
    }
    
    wx.showModal({
      title: member.name,
      content: content,
      showCancel: false,
      confirmText: '了解详情'
    })
  },

  // 联系我们
  onContact() {
    wx.showActionSheet({
      itemList: ['微信咨询', '电话咨询', '在线预约'],
      success: (res) => {
        switch (res.tapIndex) {
          case 0:
            // 微信咨询
            wx.setClipboardData({
              data: 'kaiwen251899',
              success: () => {
                wx.showToast({
                  title: '微信号已复制',
                  icon: 'success'
                })
              }
            })
            break
          case 1:
            // 电话咨询
            wx.makePhoneCall({
              phoneNumber: '400-123-4567',
              success: () => {
                console.log('拨打电话成功')
              },
              fail: () => {
                wx.showToast({
                  title: '拨打电话失败',
                  icon: 'none'
                })
              }
            })
            break
          case 2:
            // 在线预约
            wx.switchTab({
              url: '/pages/contact/contact'
            })
            break
        }
      }
    })
  },

  // 分享功能
  onShareAppMessage() {
    return {
      title: '生命力教育咨询工作室 - 培养真我幸福的好公民',
      path: '/pages/index/index',
      imageUrl: '/images/share-cover.jpg'
    }
  },

  onShareTimeline() {
    return {
      title: '生命力教育咨询工作室 - 培养真我幸福的好公民',
      imageUrl: '/images/share-cover.jpg'
    }
  },

  // 页面滚动事件
  onPageScroll(e) {
    // 可以在这里添加滚动相关的逻辑
    const scrollTop = e.scrollTop
    // console.log('页面滚动位置：', scrollTop)
  },

  // 下拉刷新
  onPullDownRefresh() {
    // 模拟数据刷新
    setTimeout(() => {
      wx.stopPullDownRefresh()
      wx.showToast({
        title: '刷新成功',
        icon: 'success'
      })
    }, 1000)
  },

  // 触底加载更多
  onReachBottom() {
    // 可以在这里添加加载更多数据的逻辑
    wx.showToast({
      title: '已到底部',
      icon: 'none'
    })
  }
}) 