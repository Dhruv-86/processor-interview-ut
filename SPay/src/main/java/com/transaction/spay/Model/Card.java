package com.transaction.spay.Model;

import java.math.BigDecimal;

public class Card {

    private long cardNumber;
    private BigDecimal balance;

    public Card() {
        this.balance = BigDecimal.ZERO;
    }

    public Card(long cardNumber) {
        this.cardNumber = cardNumber;
        this.balance = BigDecimal.ZERO;
    }

    public long getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(long cardNumber) {
        this.cardNumber = cardNumber;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public void applyTransactionAmount(BigDecimal amount) {
        this.balance = this.balance.add(amount);
    }

}