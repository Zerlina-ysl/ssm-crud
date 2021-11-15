# ssm-crud
ssm框架解决员工的增删改查
## 技术点
1.后端：spring+springMVC+mybatis框架
2.前端：bootstrap框架+原生jquery
3.maven工具
4.JSR303校验
5.pagehelper分页条工具


## 项目记录
- 环境的配置
    - 新建maven工程 下载eclipse相关文件 在mvn仓库引入jar包 snapshot随时更新新特性但是不稳定 开发环境使用release版本
    - 引入bootstrap前端框架
    - eclipse下载速度过慢 应思考镜像解决问题 而不是干等....
    - ssm的整合配置(web.xml,ApplicationContext.xml,dispatcherServlet-servlet.xml mbg.xml mybatis-config.xml
        - 对于逆向工程的配置文件有一个问题 要么使用低版本的数据库驱动 要么在表数据后加时区信息`?serverTimezone=UTC`
        - 对于逆向工程的bean类 在mbg.xml配置 <commentGenerator><property name="suppressAllComments" value="true"/></commentGenerator>可以避免注释的生成。
    - 自定义某些所需方法并测试
        - 使用spring-test测试类
        - 在测试插入数据时 ioc容器中生成批量操作的sqlsession
    - 不熟练的时候就找成功的代码对着看
- 完善功能（需单元测试
    - 使用MockMVC 虚拟一个对页面的相应 进行控制层功能的测试
    - 卡了很久的bug：root of hierchy context:MockHttpRequestServlet 写成了HttpRequestServlet
    - 进入系统后员工数据的展示+前端样式
    - eclipse的运行花费了五个小时，最后莫名其妙好啦
- 首页的emp数据展示（select）
    
    ```jsx
    <%
    	String appContext = request.getContextPath();
    	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+appContext;
    	request.setAttribute("APP_PATH",basePath);
    	%>
    //协议：//服务器名称：端口号+上下文路径
    //使用以上jsp代码获取上下文路径，用绝对路径引用资源 
    <!-- http://localhost:8080/ssm-crud/ -->
    //http://localhost:8080/ssm-crud/static/bootstrap-3.4.1-dist/js/bootstrap.min.js
    <script ~~src~~ href="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"></link>
    <script src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
    ```
    
    - [x]  目前找不到前端页面 把script的src属性改为href浏览器不报错，但前端样式仍未显示
    
    解决方法:用cdn
    
    ```jsx
    		<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    ```
    
    - 解决了级联查询department类中name属性的显示问题
    - 分页信息的处理 /emps定义在控制器 还有一个参数pn表示页面
    
    ```jsx
    <c:forEach items="${page.navigatepageNums }" var="i">
    				<c:if test="${ i==page.pageNum}">
      					<li class="active"><a href="#">${i }</a></li>
    				</c:if>
    				<!-- 本页高亮 -->
    				<c:if test="${ i!=page.pageNum}">
      					<li class="disable"><a href="${ APP_PATH}/emps?pn=${ i}">${i }</a></li>
    				</c:if>
    				
     					 </c:forEach>
    ```
    
    - 服务器将有效的数据以json的数据返回给客户端的请求（ajax）
    - json无法进行下一步的操作，新建msg类，返回状态、文字信息、扩展信息（即查询到的emp，用map封装）
    - 使用原生jquery完善页面功能
- 新增
    
    使用boostrap框架搭建模态框、下拉列表框。对于部门名称需要动态显示，发送ajax请求。
    
    不跳转页面 直接使用ajax发送请求
    
    数据的校验（前端+后端+数据库）
    
    - [x]  deptname无法获取插入(获取dId name属性值对应即可级联插入deptname
    
    JSR303校验
    
    - [x]  多个ajax请求导致返回多个msg值，而导致无法回调函数的返回值result（返回index.js代码？），也有多个code，导致条件选择函数无法进行。(@ResponseBody注解忘了，这个注解的作用应该是为了相应ajax请求
- 修改
    - `org.springframework.web.filter.HttpPutFormContentFilter` 过滤器 支持直接发送put请求，封装请求体中的数据
    - [x]  ❗对于put请求报405 不知道是因为缓存还是代码错误
        
        ~~url写成了uri 现在的错误是500⇒少加了一个#又是这种傻逼错误~~
        
- 删除
    
    确认的提示框是confirm不是confirm（纯纯无语了 哈😅）
    
    和sqlyog的删除差不多，需要在表格中添加一个checkbox 实现选择功能
    
    把批量删除和单个删除用一个控制器方法实现：批量删除传入带-的字符串数组，通过split，转化成列表使用andIdIn();
    
- @PathVariable

```java
@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public msg getEmp(@PathVariable("id")Integer id){
Employee emp = 		eservice.getEmp(id);
	return msg.success().add("emp",emp);
//对于该注解设置的变量，可以直接拿来作为参数
	}
```

## 项目打包
https://blog.csdn.net/qq_22339269/article/details/85031223?utm_source=app&app_version=4.16.0&utm_source=app

