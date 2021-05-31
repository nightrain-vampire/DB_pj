# 部署方法：

1.项目保存到本地

2.数据库脚本放在 `library.sql`,在librarium-vue文件夹内，在MySQL中执行数据库脚本  

3.数据库配置在 `librarium` 项目的 `src\main\resources` 目录下的`application.properties` 文件中（如需在自己的电脑上使用，需修改数据库名称和登录账户）

4.在IntelliJ IDEA中运行 `librarium` 项目，为了保证项目成功运行，需在 `pom.xml` 中配置依赖

5.可在cmd窗口，定位到`librarium-vue`所在路径，运行 `librarium-vue` 项目（执行命令 `npm run dev`)

6.打开浏览器，访问 `http://localhost:8181` ，即可进入页面，默认管理员账号是 `admin`，密码是 `123`