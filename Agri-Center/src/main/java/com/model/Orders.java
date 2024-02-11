/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author ngung
 */
public class Orders extends ProductModel {

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Orders() {
    }

    public Orders(int orderId, int userid, int quantity, String date) {
        this.orderId = orderId;
        this.userid = userid;
        this.quantity = quantity;
        this.date = date;
    }

    public Orders(int userid, int quantity, String date) {
        this.userid = userid;
        this.quantity = quantity;
        this.date = date;
    }

    @Override
    public String toString() {
        return "Orders{" + "orderId=" + orderId + ", userid=" + userid + ", quantity=" + quantity + ", date=" + date + '}';
    }
    
    
    private int orderId;
    private int userid;
    private int quantity;
    private String date;    
    
}
