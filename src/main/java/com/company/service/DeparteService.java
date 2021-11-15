package com.company.service;

import com.company.bean.Departement;
import com.company.dao.DepartementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DeparteService {
    @Autowired
    private DepartementMapper dmapper;
    public List<Departement> getAllDept(){
        return dmapper.selectByExample(null);

    }
}
