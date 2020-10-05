package com.web.model;

public class Staff {
    private  int sno;/*员工编号*/
    private  String name;/*员工姓名*/
    private  String sex;/*员工性别*/
    private  String position;/*员工职位*/


    private  String phone_id;/*员工手机号*/
    private  String enroldate;/*入职日期*/

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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }


    public String getEnroldate() {
        return enroldate;
    }

    public void setEnroldate(String enroldate) {
        this.enroldate = enroldate;
    }

    public String getPhone_id() {
        return phone_id;
    }

    public void setPhone_id(String phone_id) {
        this.phone_id = phone_id;
    }
}
