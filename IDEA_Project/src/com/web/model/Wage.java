package com.web.model;

public class Wage {


    private int id;/*数据ID*/
    private  int sno;/*员工编号*/
    private  String name;/*员工姓名*/
    private  String position;/*员工职位*/
    private  String year;/*年*/
    private  String month;/*月*/
    private  double basic_wage;/*基本工资*/
    private  double subsidy;/*补贴*/
    private  double bonus;/*奖金*/
    private  double tax;/*税收*/
    private  double real_wage;/*实际工资*/

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public double getBasic_wage() {
        return basic_wage;
    }

    public void setBasic_wage(double basic_wage) {
        this.basic_wage = basic_wage;
    }

    public double getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(double subsidy) {
        this.subsidy = subsidy;
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getReal_wage() {
        return real_wage;
    }

    public void setReal_wage(double real_wage) {
        this.real_wage = real_wage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
