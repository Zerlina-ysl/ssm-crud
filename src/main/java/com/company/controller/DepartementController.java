package com.company.controller;

import com.company.bean.Departement;
import com.company.bean.msg;
import com.company.service.DeparteService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class DepartementController {
    @Autowired
    private DeparteService dservice;

    @ResponseBody
    @RequestMapping("/depts")
    public msg getDepts(){
        List<Departement> department = dservice.getAllDept();
        return msg.success().add("depts",department);


    }


}
