/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.display;

/**
 *
 * @author J2EE-33
 */
import java.util.Map;
import java.util.HashMap;
 
import com.stripe.model.Charge;
import com.stripe.Stripe;
import com.stripe.exception.AuthenticationException;
import com.stripe.exception.InvalidRequestException;
import com.stripe.exception.APIConnectionException;
import com.stripe.exception.CardException;
import com.stripe.exception.APIException;
 
public class StripeTest {
  public static void main(String[] args) throws AuthenticationException, InvalidRequestException,
      APIConnectionException, CardException, APIException  {
    Stripe.apiKey = "pk_live_oFBfstQYIXxeV4fkVs4vHkEV"; // stripe public
                              // test key

    final Map<String, Object> cardParams = new HashMap<String, Object>();
    cardParams.put("number", "4242424242424242");
    cardParams.put("exp_month", 12);
    cardParams.put("exp_year", 2015);
    cardParams.put("cvc", "123");
    cardParams.put("name", "J Bindings Cardholder");
    cardParams.put("address_line1", "140 2nd Street");
    cardParams.put("address_line2", "4th Floor");
    cardParams.put("address_city", "San Francisco");
    cardParams.put("address_zip", "94105");
    cardParams.put("address_state", "CA");
    cardParams.put("address_country", "USA");

    final Map<String, Object> chargeParams = new HashMap<String, Object>();
    chargeParams.put("amount", 100);
    chargeParams.put("currency", "usd");
    chargeParams.put("card", cardParams);

    final Charge charge = Charge.create(chargeParams);
    System.out.println(charge);
  }
}