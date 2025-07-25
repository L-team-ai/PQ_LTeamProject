# 智能考试生成系统 (AI Quiz Generator)

这是一个基于Vue.js + Node.js + Python的智能考试生成系统，能够自动处理多种文件格式（文档、PDF、图片、视频、音频），通过AI技术进行智能内容分析和题目生成，为教育工作者提供高效的出题解决方案。

视频讲解：
通过网盘分享的文件：L-team-ai.mp4
链接: https://pan.baidu.com/s/1QmTUmKSY_ontY3uBACq6KQ?pwd=vqwr 提取码: vqwr 
--来自百度网盘超级会员v6的分享

## ✨ 核心特性

- 📤 **多格式文件支持**: 支持TXT、PDF、DOC/DOCX、PPT/PPTX、图片、音频、视频等多种格式
- 🤖 **AI智能生成**: 集成OpenAI API，从知识内容自动生成高质量选择题
- 🔍 **OCR文字识别**: 使用EasyOCR自动识别图片中的文字内容
- 🎵 **语音转文字**: 支持音频文件的语音识别转换
- 🎥 **视频内容提取**: 从视频中提取PPT内容和音频轨道
- 📊 **实时文件监控**: 自动监控指定目录，实时处理新上传的文件
- 🌐 **完整API接口**: 提供RESTful API，支持前后端分离架构
- ⚙️ **灵活配置管理**: 支持自定义数据库、路径等配置参数
- 🎯 **智能题目解析**: 支持多种题目格式的自动识别和解析
- 📱 **响应式界面**: 基于Element UI的现代化用户界面

## 🏗️ 技术架构

### 前端技术栈
- **Vue.js 2.7** - 渐进式JavaScript框架
- **Element UI** - 基于Vue的桌面端组件库
- **Vue Router** - 官方路由管理器
- **Vuex** - 状态管理模式
- **Axios** - HTTP客户端库
- **CKEditor** - 富文本编辑器

### 后端技术栈
- **Node.js** - JavaScript运行时环境
- **Express.js** - Web应用框架
- **MySQL** - 关系型数据库
- **Multer** - 文件上传中间件
- **Chokidar** - 文件系统监控

- **Spring Boot 2.6.6** - 主框架
- **Spring Web** - Web服务支持
- **Spring Session** - 会话管理
- **MyBatis Plus 3.4.3** - ORM框架
- **MySQL** - 数据库
- **Druid 1.2.6** - 数据库连接池
- **JWT 3.10.0** - 身份认证
- **Lombok** - 代码简化工具

### Python处理引擎
- **PyPDF2** - PDF文档处理
- **EasyOCR** - 光学字符识别
- **Vosk** - 语音识别引擎
- **OpenAI API** - AI内容生成
- **Textract** - 文档内容提取

## 后端项目架构

```
src/
├── main/
│   ├── java/com/czj/
│   │   ├── config/          # 配置类
│   │   ├── controller/      # 控制器层
│   │   │   ├── exam/        # 考试相关控制器
│   │   │   ├── user/        # 用户相关控制器
│   │   │   └── util/        # 工具类控制器
│   │   ├── interceptor/     # 拦截器
│   │   ├── mapper/          # 数据访问层
│   │   ├── pojo/            # 实体类
│   │   ├── service/         # 业务逻辑层
│   │   ├── util/            # 工具类
│   │   └── TwoHoursApplication.java  # 主启动类
│   └── resources/
│       ├── mapper/          # MyBatis映射文件
│       ├── static/          # 静态资源
│       └── application.yml  # 配置文件
└── test/                    # 测试代码
```

## 📋 支持的文件类型

| 类型 | 格式 | 处理方式 | 说明 |
|------|------|----------|------|
| 📄 **文档** | `.txt`, `.doc`, `.docx`, `.ppt`, `.pptx` | 直接文本提取 | 支持Office文档和纯文本 |
| 📑 **PDF** | `.pdf` | PyPDF2提取 | 自动提取PDF中的文字内容 |
| 🖼️ **图片** | `.jpg`, `.jpeg`, `.png` | OCR识别 | 使用EasyOCR进行文字识别 |
| 🎥 **视频** | `.mp4`, `.avi`, `.mov`, `.mkv` | 内容提取 | 提取PPT内容和音频轨道 |
| 🎵 **音频** | `.wav` | 语音识别 | 使用Vosk进行语音转文字 |

## 🛠️ 环境要求

### 系统要求
- **Node.js** >= 14.0.0
- **Python** >= 3.7.0
- **MySQL** >= 5.7.0
- **操作系统**: Windows/Linux/macOS
- **Java 1.8** - 开发语言
- **Maven3.6＋** - 项目管理工具
- **Spring Boot DevTools** - 热部署

### 安装步骤

#### 1. 克隆项目
```bash
git clone <repository-url>
cd two_hours_front
```

#### 2. 安装Node.js依赖
```bash
npm install
```

#### 3. 安装Python依赖
```bash
pip install PyPDF2 easyocr textract chardet vosk openai mysql-connector-python
```

#### 4. 数据库配置
```sql
-- 创建数据库
CREATE DATABASE `two hours` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- 导入数据库结构
mysql -u root -p "two hours" < two_hours3.sql
```

## ⚙️ 配置说明

### 主配置文件 `exam-converter-config.json`

```json
{
  "db": {
    "host": "localhost",
    "port": 3306,
    "user": "root",
    "password": "your_password",
    "database": "two hours"
  },
  "watchDir": "./voicetotext/Quiz",
  "pythonPath": "python",
  "pythonScript": "main.py",
  "port": 3001,
  "examValidDays": 7,
  "defaultCourseId": 7,
  "defaultAuthorId": "stu023",
  "defaultExamType": 3,
  "defaultQuestionScore": 5
}
```

### 配置项说明

| 配置项 | 说明 | 默认值 |
|--------|------|--------|
| `db.host` | 数据库主机地址 | localhost |
| `db.port` | 数据库端口 | 3306 |
| `db.user` | 数据库用户名 | root |
| `db.password` | 数据库密码 | 123456 |
| `db.database` | 数据库名称 | two hours |
| `watchDir` | 文件监控目录 | ./voicetotext/Quiz |
| `pythonPath` | Python解释器路径 | python |
| `port` | API服务器端口 | 3001 |
| `examValidDays` | 考试有效期（天） | 7 |
| `defaultCourseId` | 默认课程ID | 7 |
| `defaultAuthorId` | 默认作者ID | stu023 |
| `defaultExamType` | 默认考试类型 | 3 |
| `defaultQuestionScore` | 默认题目分数 | 5 |

## 🚀 快速开始

### 启动开发环境

#### 1. 启动后端服务
```bash
# 启动主服务器
node server/index.js

# 或启动题目转换服务
node txt-to-exam-converter.js
```

#### 2. 启动前端开发服务器
```bash
npm run serve
```

#### 3.启动后端开发服务器
```bash
# 使用Maven运行
mvn spring-boot:run

# 或者使用包装器
./mvnw spring-boot:run  # Linux/Mac
mvnw.cmd spring-boot:run  # Windows
```

#### 4. 访问应用
- 前端应用: http://localhost:8080
- 后端API: http://localhost:3001

### 使用方式

#### 方法一：Web界面上传（推荐）
1. 打开前端应用
2. 登录系统（教师账号）
3. 进入"AI出题"功能
4. 上传知识内容文件
5. 系统自动生成选择题
6. 发布为考试

#### 方法二：文件监控模式
1. 配置监控目录路径
2. 启动监控服务：`node txt-to-exam-converter.js`
3. 将文件放入监控目录
4. 系统自动处理并生成考试

#### 方法三：API调用
```javascript
// 上传文件生成考试
const formData = new FormData();
formData.append('file', file);
formData.append('title', '考试标题');

fetch('/api/Exam/uploadAndGenerate', {
    method: 'POST',
    body: formData
})
.then(response => response.json())
.then(data => console.log(data));
```

## 📝 支持的内容格式

### 1. 知识内容格式（推荐）
系统可以从纯知识内容自动生成题目：

```text
计算机网络基础

网络协议是计算机网络中进行数据交换而建立的规则、标准或约定。
常见的网络协议包括：
- HTTP协议：用于Web浏览，默认端口80
- HTTPS协议：HTTP的安全版本，默认端口443
- FTP协议：用于文件传输，使用端口21和20
- DNS协议：用于域名解析，使用端口53
```

### 2. 标准题目格式
如果您已有现成题目，支持以下格式：

```text
1. TCP协议和UDP协议的主要区别是什么？
A. TCP是面向连接的，UDP是无连接的
B. TCP传输速度快，UDP传输速度慢
C. TCP用于局域网，UDP用于广域网
D. TCP是应用层协议，UDP是网络层协议
答案: A

2. 在OSI七层模型中，负责路由选择的是哪一层？
A. 物理层
B. 数据链路层
C. 网络层
D. 传输层
答案: C
```

### 3. 表格格式（CSV/TSV）
```csv
题目ID,题目内容,选项A,选项B,选项C,选项D,正确答案
1,HTTP协议的默认端口是?,21,80,443,53,B
2,DNS协议的主要作用是?,文件传输,域名解析,邮件发送,网页浏览,B
```

## 🌐 API接口文档

### 考试管理接口

#### 获取自动生成的考试列表
```http
GET /api/Exam/getAutoGeneratedExams
```
**响应示例:**
```json
{
  "flag": true,
  "data": [
    {
      "examId": 123,
      "title": "计算机网络基础考试",
      "beginDate": "2025-01-01 09:00:00",
      "endDate": "2025-01-07 23:59:59",
      "questionCount": 20
    }
  ]
}
```

#### 上传文件并生成考试
```http
POST /api/Exam/uploadAndGenerate
Content-Type: multipart/form-data
```
**请求参数:**
- `file`: 上传的文件
- `title`: 考试标题（可选）
- `sourceType`: 内容来源类型（可选）

**响应示例:**
```json
{
  "flag": true,
  "data": {
    "examId": 124,
    "questionCount": 15
  },
  "message": "考试生成成功"
}
```

#### 获取考试详情
```http
GET /api/Exam/getExamDetails/:examId
```

#### 删除考试
```http
DELETE /api/Exam/deleteExam/:examId
```

### 系统接口

#### 健康检查
```http
GET /api/health
```

#### 获取支持的文件类型
```http
GET /api/Exam/getSupportedFileTypes
```

### Python脚本接口

#### 运行Python处理脚本
```http
POST /api/python/run-script
```

#### 获取处理状态
```http
GET /api/python/status/:taskId
```

## 📁 项目结构

```
two_hours_front/
├── src/                          # 前端源码
│   ├── components/               # 公共组件
│   ├── pages/                    # 页面组件
│   │   ├── user/                # 用户相关页面
│   │   │   ├── teacherComponents/  # 教师功能组件
│   │   │   └── studentComponents/  # 学生功能组件
│   │   └── login/               # 登录相关页面
│   ├── router/                  # 路由配置
│   └── App.vue                  # 根组件
├── server/                      # 后端服务
│   ├── routes/                  # API路由
│   │   ├── quizGenerator.js     # 题目生成路由
│   │   ├── simpleExamGenerator.js # 简单考试生成
│   │   └── pythonScriptRunner.js  # Python脚本运行器
│   └── index.js                 # 服务器入口
├── scripts/                     # 工具脚本
│   ├── convert_text_to_questions.js # 文本转题目
│   └── extract_questions.py     # Python题目提取
├── voicetotext/                 # Python处理模块
│   ├── inputFiles/              # 输入文件目录
│   ├── Quiz/                    # 生成的题目目录
│   ├── txt_QuizSource/          # 文本源文件目录
│   └── main.py                  # Python主处理脚本
├── exam-converter-config.json   # 主配置文件
├── package.json                 # Node.js依赖配置
├── two_hours3.sql              # 数据库结构文件
└── README.md                   # 项目说明文档
```

## 🔧 开发指南

### 添加新的文件处理器

1. 在`voicetotext/`目录下创建新的处理模块
2. 实现`process(file_path)`函数
3. 在`main.py`中注册新的处理器

```python
# 示例：添加Excel处理器
def process_excel(file_path):
    # 处理Excel文件的逻辑
    return extracted_content

# 在main.py中注册
file_processors = {
    '.xlsx': process_excel,
    '.xls': process_excel
}
```

### 自定义题目生成规则

修改`scripts/convert_text_to_questions.js`中的生成逻辑：

```javascript
// 自定义题目生成规则
function generateCustomQuestions(content) {
    // 实现自定义的题目生成逻辑
    return questions;
}
```

### 扩展API接口

在`server/routes/`目录下添加新的路由文件：

```javascript
// server/routes/customApi.js
const express = require('express');
const router = express.Router();

router.post('/custom-endpoint', (req, res) => {
    // 自定义API逻辑
    res.json({ success: true });
});

module.exports = router;
```
## 🐛
 常见问题

### Q: 数据库连接失败怎么办？
**A:** 检查以下几点：
1. 确认MySQL服务已启动
2. 检查`exam-converter-config.json`中的数据库配置
3. 确认数据库`two hours`已创建
4. 验证用户名和密码是否正确

### Q: Python脚本执行失败？
**A:** 可能的解决方案：
1. 确认Python环境已正确安装
2. 检查Python依赖包是否完整：`pip install -r requirements.txt`
3. 验证Python路径配置是否正确
4. 查看控制台错误日志

### Q: 文件上传后没有生成题目？
**A:** 排查步骤：
1. 检查文件格式是否支持
2. 确认文件内容是否包含有效的知识点
3. 查看服务器日志中的错误信息
4. 验证AI API配置是否正确

### Q: 前端页面无法访问？
**A:** 检查项目：
1. 确认前端开发服务器已启动：`npm run serve`
2. 检查端口是否被占用
3. 验证后端API服务是否正常运行
4. 查看浏览器控制台的错误信息


### 代码规范
- 前端代码遵循Vue.js官方风格指南
- 后端代码使用ESLint进行代码检查
- Python代码遵循PEP 8规范
- 提交信息使用英文，格式清晰

⭐ 如果这个项目对您有帮助，请给我们一个星标！