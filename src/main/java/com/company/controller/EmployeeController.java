package com.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.company.bean.msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import com.company.bean.Employee;
import com.company.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class EmployeeController {
	
	//No qualifying bean of type 'com.company.service.EmployeeService' available
	@Autowired
	 EmployeeService eservice;

	@RequestMapping(value="/emps",method= RequestMethod.GET)
	@ResponseBody
	public msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn,5);

		List<Employee> emps = eservice.getEmps();
		PageInfo page = new PageInfo(emps,5);
		return msg.success().add("page",page);//添加key value
	}

	/**
	 * 保存员工数据
	 * @param employee
	 * @param result
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emps",method=RequestMethod.POST)
	public msg saveEmp(@Valid  Employee employee, BindingResult result){
		if(result.hasErrors()){
			Map<String,Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError error:errors){
				System.out.println("错误的字段名"+error.getField());
				System.out.println("错误的信息"+error.getDefaultMessage());
				map.put(error.getField(),error.getDefaultMessage());//将错误信息封装在map中
				 }
			return msg.fail().add("errorFields",map);}
		else{
				eservice.saveEmp(employee);
		return msg.success();
		}

	}
	@ResponseBody
	@RequestMapping("/checkUser")
	public msg checkUser(@RequestParam("username") String username){
		String regName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!username.matches(regName)){
			return msg.fail().add("var_msg","用户名必须是2-5位的中文或6-16位的英文字符");
		}
		//使用后端正则校验+数据库校验
		if(eservice.checkuser(username)){
			return msg.success();
		}else{
			return msg.fail().add("var_msg","用户名不可用");
		}
	}


	
	
	
	
	
	
//	@RequestMapping("/emps")
//	public String SelectAll(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
//
//		PageHelper.startPage(pn,5);//��ǰ����pnҳ ÿҳ��5������
//
//		List<Employee> emps = eservice.getEmps();
//		PageInfo page = new PageInfo(emps);
//		model.addAttribute("page",page);
//		return "emps";
		
//	}

	/**
	 * 根据id查询员工数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public msg getEmp(@PathVariable("id")Integer id){
Employee emp = 		eservice.getEmp(id);
	return msg.success().add("emp",emp);


	}
//直接发送ajax type=PUT请求，请求体中有数据但无法封装到employee对象
	//Tomcat服务器会将请求体中的数据封装成为map
	//springmvc封装pojo对象 会调用request.getParameter(" ")
	//问题：put请求体中的数据Tomcat服务器不会封装
	/**
	 * 根据id更新员工数据
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public msg saveEmp(Employee employee, HttpServletRequest request){
		System.out.println(employee);
		eservice.updateEmp(employee);
		return msg.success();
	}



	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public msg deleteEmp(@PathVariable("ids") String ids){
		if(ids.contains("-")){
			//批量删除
			String[] idss = ids.split("-");
			//使用列表删除速度更快 达到批量目的
			List<Integer> idlist = new ArrayList<>();
			for(String id :idss){
				idlist.add(Integer.parseInt(id));
			}
			eservice.deleteBatch(idlist);
		}else{
			Integer id = Integer.parseInt(ids);
			//单个删除
		eservice.deleteEmp(id);

		}
		return msg.success();
	}


}
