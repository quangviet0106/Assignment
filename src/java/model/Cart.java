/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author SAP-LAP-FPT
 */
public class Cart {
    private ArrayList<CartDetail> details = new ArrayList<>();
    
    public int getTotal()
    {
        int sum = 0;
        for (CartDetail detail : details) {
            sum+= detail.getTotal();
        }
        return sum;
    }
    
    public ArrayList<CartDetail> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<CartDetail> details) {
        this.details = details;
    }
    
}
