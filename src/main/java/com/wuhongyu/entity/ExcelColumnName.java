package com.wuhongyu.entity;

public class ExcelColumnName {
    private Integer id;

    private String columnname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getColumnname() {
        return columnname;
    }

    public void setColumnname(String columnname) {
        this.columnname = columnname == null ? null : columnname.trim();
    }
}