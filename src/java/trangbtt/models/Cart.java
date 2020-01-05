/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.models;

import java.io.Serializable;
import java.util.ArrayList;
import trangbtt.dtos.CartAddDTO;

/**
 *
 * @author ASUS
 */
public class Cart implements Serializable {

    private ArrayList<CartAddDTO> cart;

    public Cart() {
    }

    public void addToCard(CartAddDTO dto) throws Exception {
        if (cart == null) {
            cart = new ArrayList<CartAddDTO>();

        }
        this.cart.add(dto);

    }

    public int getTotal() throws Exception {
        int result = 0;

        for (CartAddDTO dto : cart) {
            result += (dto.getPrice());
        }
        return result;
    }

    public void removeCart(int id) throws Exception {
        cart.remove(id);
    }


    public ArrayList<CartAddDTO> getCart() {
        return cart;
    }

    public void setCart(ArrayList<CartAddDTO> cart) {
        this.cart = cart;
    }

}
