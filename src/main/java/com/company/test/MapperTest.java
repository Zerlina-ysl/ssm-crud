package com.company.test;

import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.bean.Departement;
import com.company.bean.Employee;
import com.company.dao.DepartementMapper;
import com.company.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:ApplicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartementMapper dm;
	@Autowired
	EmployeeMapper em;
	

	@Test
	public void testSel() {
//		dm.insert(new Departement(3,"����"));
//		dm.insert(new Departement(4,"����"));

		
//		for(int i=0;i<500;i++) {
//			em.insertSelective(new Employee(null,UUID.randomUUID().toString().substring(1,5),"0","testInsert@company.com",1,"1"));
//		//insert into tbl_employee (id, last_name, gender,  email, d_id, empstatus)
//		}
		Employee emp = em.selectByPrimaryKeyWithDept(3516);
		System.out.println(emp);
		System.out.println(emp.getDepartment());
	
	}
	

}
