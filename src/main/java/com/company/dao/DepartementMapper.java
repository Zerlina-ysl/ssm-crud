package com.company.dao;

import com.company.bean.Departement;
import com.company.bean.DepartementExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepartementMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    long countByExample(DepartementExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int deleteByExample(DepartementExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int insert(Departement record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int insertSelective(Departement record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    List<Departement> selectByExample(DepartementExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    Departement selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int updateByExampleSelective(@Param("record") Departement record, @Param("example") DepartementExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int updateByExample(@Param("record") Departement record, @Param("example") DepartementExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int updateByPrimaryKeySelective(Departement record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_department
     *
     * @mbg.generated Mon Nov 08 13:50:47 CST 2021
     */
    int updateByPrimaryKey(Departement record);
}