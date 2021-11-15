<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%
        String appContext = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+appContext;
        request.setAttribute("APP_PATH",basePath);
    %>

    <!-- http://localhost:8080/ssm-crud/ -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">--%>
<%--    Launch demo modal--%>
<%--</button>--%>

<!-- Modal员工添加 -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>

            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group ">
                        <label for="lastName" class="col-sm-2 control-label">lastName</label>
                        <div class="col-sm-10">
                  <input type="username" class="form-control" id="lastname" placeholder="name" name="lastName">

                            <span class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="email" name="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1" value="0"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender2" value="1"> 女
                        </label>
                        </div>

                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-5">
                        <select class="form-control" name="dId" id="dept_selector">
<%--                            再购键--%>
                        </select>
                        </div>
                    </div>




                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">Save changes</button>
            </div>
        </div>
    </div>
</div>

<%--员工修改--%>
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >修改员工</h4>

            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group ">
                        <label for="lastName" class="col-sm-2 control-label">lastName</label>
                        <div class="col-sm-10">
<%--  编辑 静态显示姓名                          <input type="username" class="form-control" id="lastname_update" placeholder="name" name="lastName">--%>
    <p class="form-control-static" id="lastname_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email_update" placeholder="email" name="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update" value="0"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update" value="1"> 女
                            </label>
                        </div>

                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="dId" id="dept_selector_update">
                                <%--                            再购键--%>
                            </select>
                        </div>
                    </div>




                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">update changes</button>
            </div>
        </div>
    </div>
</div>









<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-primary" id="emp_add_model_btn">新增</button>
            <button class="btn btn-danger" id="emp_deleteAll_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emp_table">
                <thead>

                <tr>
                    <th>
                      <input type="checkbox" id="check_all">
                    </th>
                    <th>#</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <%--				使用json--%>
                <tbody>

                </tbody>
            </table>
        </div>

    </div>


    <!-- pagehelper -->
    <div class="row">

        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">


        </div>
    </div>
    <div class="row"></div>
    <div class="row"></div>


</div>

<script type="text/javascript"></script>
<script>
    var totalCount,currentpage;
    $(function(){
        //首页
        to_page(1);
    });


<%--    使用ajax获取数据--%>
   function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result)

            }
        });
    }


        function build_emps_table(result){
            //使用ajax请求处理表格显示
            $("#emp_table tbody").empty();
            var emps = result.extend.page.list;
            $.each(emps,function(index,item){
                var checkBox = $("<td><input type='checkbox' class='check_item' /></td>");
                var empId = $("<td></td>").append(item.id);
                var empName = $("<td></td>").append(item.lastName);
                var empEmail = $("<td></td>").append(item.email);
                var empGender =$("<td></td>").append(item.gender=="0"?"男":"女");
                var deptName = $("<td></td>").append(item.department.name);
                //	<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-transh" aria-hidden="true"></span>删除</button>
                //<button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
                var btn = $("<td></td>")
                    .append($("<button></button>").addClass("btn btn-danger btn-sm  delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除").attr("delete-id",item.id))
                    //添加attr属性便于在按钮事件中获取id
                    .append(" ")
                    .append($("<button></button>").addClass("btn btn-primary btn-sm  edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑").attr("edit-id",item.id));
                    $("<tr></tr>").append(checkBox).append(empId).append(empName).append(empEmail).append(empGender).append(deptName).append(btn).appendTo("#emp_table tbody");
            });

        }



        function build_page_info(result){
            //解析显示分页信息
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.page.pageNum+"页,总"+
                result.extend.page.pages+"页,总"+
                result.extend.page.total+"条记录");
            totalRecord = result.extend.page.total;
            currentPage = result.extend.page.pageNum;
            currentpage=currentPage;
            totalCount=totalRecord;
        }

        function build_page_nav(result){
            //分页条数据
            //page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.page.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function(){
                    to_page(1);
                });
                prePageLi.click(function(){
                    to_page(result.extend.page.pageNum -1);
                });
        }
    var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
    var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
    if(result.extend.page.hasNextPage == false){
        nextPageLi.addClass("disabled");
        lastPageLi.addClass("disabled");
}else{
        nextPageLi.click(function(){
        to_page(result.extend.page.pageNum +1);
    });
        lastPageLi.click(function(){
        to_page(result.extend.page.pages);
    });
}
//添加首页和前一页 的提示
    ul.append(firstPageLi).append(prePageLi);
//1,2，3遍历给ul中添加页码提示
$.each(result.extend.page.navigatepageNums,function(index,item){
    var numLi = $("<li></li>").append($("<a></a>").append(item));
    if(result.extend.page.pageNum == item){
        numLi.addClass("active");
    }
    numLi.click(function(){
        to_page(item);
    });
    ul.append(numLi);
});
//添加下一页和末页 的提示
ul.append(nextPageLi).append(lastPageLi);
//把ul加入到nav
var navEle = $("<nav></nav>").append(ul);
    navEle.appendTo("#page_nav_area");
}
function reset_form(ele){
       $(ele)[0].reset();//清空数据
    $(ele).find("*").removeClass("has-error has-success");
    $(ele).find(".help-block").text("");
}


//添加员工的弹框
$("#emp_add_model_btn").click(function(){
    reset_form("#empAddModel form");
//打开模态框 得到员工信息的下拉框
    getDeptName("#dept_selector");
  //  $("#empAddModel form")[0].reset();dom对象的方法 避免出现上次结果不检查
    $("#empAddModel").modal({
        backdrop:"static"
    }) ;



});


   //部门信息的下拉列
    function getDeptName(ele){
        $(ele).empty();
        $.ajax({
           url:"${APP_PATH}/depts",
           type:"GET" ,
            success:function(result){
              // console.log(result);
              //{code: 100, msg: '处理成功', extend: {…}}
                $.each(result.extend.depts,function(){
                  var optionEle = $("<option></option>").append(this.name).attr("value",this.id);
                  optionEle.appendTo(ele)
                })


            }
        });
    }
//restFul风格
    //      /emp/{id} GET 查询
    //      /emp POST 保存
    //      /emp/{id} POST 修改
    //      /emp/{id} DELETE 删除
    function validate_add_form(){
        //校验表单数据
        var lastName = $("#lastname").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
       if( !regName.test(lastName)){
           // alert("用户名必须是2-5位的中文或6-16位的英文字符串");
        show_validate_msg("#lastname","error","用户名必须是2-5位的中文或6-16位的英文字符串");
            return false;
       }else {

          show_validate_msg("#lastname","success","");
       }
           var email = $("#email").val();
           var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
           if(!regEmail.test(email)){
               // alert("邮箱格式错误");
              show_validate_msg("#email","error","邮箱格式错误");
               return false;
           }else{ show_validate_msg("#email","success","");

           }

       return true;
    }

    $("#emp_save_btn").click(function() {
        //点击信息发送保存
        //先对数据格式进行校验
        if(!validate_add_form()){
            return false;

        }
        //校验完后检查用户名是否重名
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
//发送ajax请求进行保存操作
       $.ajax({
           url:"${APP_PATH}/emps",
               type:"POST",
               data:$("#empAddModel form").serialize(),
           success:function(result){
                  // console.log(result);
                       if(result.code==100){
                     $("#empAddModel").modal('hide');
               // alert("result.msg");
                     to_page(totalCount); }
               else{
                   //提示失败信息
                   if(undefined!=result.extend.errorFields.email){
                       show_validate_msg("#email","error",result.extend.errorFields.email);
                   }else if(undefined!=result.extend.errorFields.lastName){
                       show_validate_msg("#lastname","error",result.extend.errorFields.lastName);

                   }

               }
           }


       })
    });
//处理编辑
    //整个页面是通过ajax请求后期获取得到，无法直接绑定事件。可以使用live方法,但是新版被删除。可以使用on
    $(document).on("click",".edit_btn",function(){
        //传入事件 selector 函数体
        getDeptName("#empUpdateModel select");
            getEmp($(this).attr("edit-id"));
            //将员工id值传给更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModel").modal({
            backdrop:"static"
        });
    });
    //处理单个·删除按钮 动态绑定事件
    $(document).on("click",".delete_btn",function(){
        var name = $(this).parents("tr").find("td:eq(1)").text();
        if(confirm("确定要删除{"+name+"}吗")){
            //true
            $.ajax({
               url:"${APP_PATH}/emp/"+$(this).attr("delete-id"),
               type:"DELETE",
                success:function(result){
                   to_page(currentpage);
                }

            });
        }
    });








    //编辑信息时 文本框里显示源数据
    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function(result){
         // console.log(result)//{code: 100, msg: '处理成功', extend: {…}}
var emp  = result.extend.emp;
console.log(emp);
$("#lastname_update_static").text(emp.lastName);
$("#email_update").val(emp.email);
$("#empUpdateModel input[name=gender]").val([emp.gender]);
$("#empUpdateModel select").val([emp.dId]);



            }
        });
    }






function show_validate_msg(ele,status,msg){
    $(ele).parent().removeClass("has-success has-error");
    $(ele).next("span").text("");
    if("success"==status){
        //校验情况表单按钮的状态 封装成为函数
        $(ele).parent().addClass("has-success");

    }else if("error"==status){
        $(ele).parent().addClass("has-error");

    }
        $(ele).next("span").text(msg);
    }

    $("#lastname").change(function(){
    $.ajax({
        url:"${APP_PATH}/checkUser",
        data:"username="+$("#lastname").val(),
        type:"POST",
        success:function(result){
            if(result.code==100){
                show_validate_msg("#lastname","success","用户名可用");

                $("#emp_save_btn").attr("ajax-va","success");
                //动态添加ajax-va属性标记 用户名是否可用
            }else{

                show_validate_msg("#lastname","error",result.extend.var_msg);

                $("#emp_save_btn").attr("ajax-va","error");
            }
        }

        });
    })
    //更新按钮
$("#emp_update_btn").click(function(){
    //邮箱验证
    var email = $("#email_update").val();
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if(!regEmail.test(email)){
        // alert("邮箱格式错误");
        show_validate_msg("#email_update","error","邮箱格式错误");
        return false;
    }else{ show_validate_msg("#email_update","success","");
    }
   $.ajax({
       url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
       type:"PUT",
       // data:$("empUpdateModel form").serialize()+"&_method=PUT",
       data:$("#empUpdateModel form").serialize(),
       success:function(result){
                $("#empUpdateModel").modal('hide');
                to_page(currentpage);

       }

   }) ;
});

//点击tr中的checkbox完成全选功能
    $("#check_all").click(function(){
            //checked是原生属性 可以通过prop获取

            //当前选中状态
        //实现其他checkbox同步总checkbox
        $(".check_item").prop("checked",$(this).prop("checked"));
             });
    $(document).on("click",".check_item",function(){

        //实现总checkbox同步其他checkbox
         $("#check_all").prop("checked",$(".check_item:checked").length==$(".check_item").length);

    });

    $("#emp_deleteAll_btn").click(function(){
        var name="";var del_id="";
        $.each($(".check_item:checked"),function(){
                del_id+= $(this).parents("tr").find("td:eq(1)").text()+"-";
                 name+= $(this).parents("tr").find("td:eq(2)").text()+",";
        });
       name=name.substring(0,name.length-1);del_id=del_id.substring(0,del_id.length-1);
        if(confirm("您确定要删除{"+name+"}吗")){
            $.ajax({
                url:"${APP_PATH}/emp/"+del_id,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    $("#check_all").prop("checked",false);
                    to_page(currentpage);
                }
            })
        }
    })



</script>
</body>
</html>