package com.company.service;

import java.util.List;

import com.company.bean.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.bean.Employee;
import com.company.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	private	EmployeeMapper emapper;
	
	public List<Employee> getEmps(){
		return emapper.selectByExampleWithDept(null);
	}

    public int  saveEmp(Employee employee) {
		return emapper.insertSelective(employee);

    }

	/**
	 * true表示姓名可用
	 * @param name
	 * @return
	 */
	public boolean checkuser(String name) {
		EmployeeExample example = new EmployeeExample();
		 EmployeeExample.Criteria criteria = example.createCriteria();
		criteria.andLastNameEqualTo(name);


		return emapper.countByExample(example)==0;//true
	}

	public Employee getEmp(Integer id) {
		Employee employee = emapper.selectByPrimaryKey(id);
		return employee;
	}

	/**
	 * 按照主键有选择的更新
	 * @param employee
	 * @return
	 */
	public int updateEmp(Employee employee) {
		return emapper.updateByPrimaryKeySelective(employee);
	}

	public int deleteEmp(Integer id) {
		return emapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> idss) {
//		for(int i=0;i<idss.length;i++){
//			int id = Integer.parseInt(idss[i]);
//			deleteEmp(id);
			EmployeeExample example = new EmployeeExample();
			EmployeeExample.Criteria  criteria = example.createCriteria();
		criteria.andIdIn(idss);
			//delete from xx where id in {1,2,3}
		emapper.deleteByExample(example);

		}
	}

