// app.js
App({
  onLaunch() {
    // 展示本地存储能力
    const logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
        console.log('登录成功', res)
      }
    })
  },
  globalData: {
    userInfo: null,
    // 生命力教育数据
    vitalityData: {
      stats: {
        countries: 7,
        coreAbilities: 23,
        customization: 100
      },
      services: [
        {
          id: 1,
          title: '清华北大本硕博生教育咨询',
          icon: 'university',
          description: '为顶尖学府学生提供学术突破与职业发展指导',
          features: ['学术规划与研究方向', '职业发展路径设计', '国际交流与合作机会']
        },
        {
          id: 2,
          title: '中小学生导师课',
          icon: 'child',
          description: '为幼儿园到高中学生提供全方位成长指导',
          features: ['学业成绩提升', '综合素质培养', '国际名校申请']
        },
        {
          id: 3,
          title: '父母家庭教育课程',
          icon: 'users',
          description: '帮助家长提升教育能力，改善亲子关系',
          features: ['家庭教育规划研讨', '育婴咨询指导', '亲子关系优化']
        },
        {
          id: 4,
          title: '职业发展咨询',
          icon: 'briefcase',
          description: '为职业人士提供晋升与收入增长指导',
          features: ['职业规划与转型', '技能提升与认证', '创业指导与支持']
        }
      ],
      team: [
        {
          id: 1,
          name: 'Kaiwen',
          title: '创始人 & 首席导师',
          avatar: '/images/kaiwen.jpg',
          credentials: ['北京大学客座讲师', '北大《教育与幸福》助教', '复旦《健康心理学》助教'],
          description: '师从著名教育家文教授和心理学家孙教授，开创了横跨5~40+岁学员的全教育阶段、全球化、高端的新型导师制教育模式。'
        },
        {
          id: 2,
          name: 'Tony老师',
          title: '哈佛大学导师',
          avatar: '/images/tony.jpg',
          credentials: ['哈佛大学城市建筑专业', '清华苏世民书院硕士', '《福布斯》U30精英奖']
        },
        {
          id: 3,
          name: '王老师',
          title: '哈佛教育学硕士',
          avatar: '/images/wang.jpg',
          credentials: ['哈佛大学教育学硕士', '复旦十佳优秀毕业生', '复旦外语系绩点第一']
        },
        {
          id: 4,
          name: 'W老师',
          title: '清华哲学硕士',
          avatar: '/images/w.jpg',
          credentials: ['清华绩点专业第一', '斯坦福大学交流生', '清北联合粤歌赛冠军']
        }
      ],
      achievements: [
        {
          id: 1,
          title: '清华附小学生',
          description: '获得班级第一名🥇',
          icon: 'trophy'
        },
        {
          id: 2,
          title: '海淀区三好学生',
          description: '8个海淀区三好学生⭐️',
          icon: 'medal'
        },
        {
          id: 3,
          title: '北京市三好学生',
          description: '1个北京市三好学生⭐️',
          icon: 'star'
        },
        {
          id: 4,
          title: '全国网球冠军',
          description: '高一学生获得全国网球高中女子团体冠军🥇',
          icon: 'trophy'
        },
        {
          id: 5,
          title: '美国名校录取',
          description: '美国高中生获得全美专业排名第一的名校录取',
          icon: 'university'
        },
        {
          id: 6,
          title: '奖学金获得',
          description: '累计约10万美元入学奖学金🥇',
          icon: 'dollar'
        }
      ]
    }
  }
}) 