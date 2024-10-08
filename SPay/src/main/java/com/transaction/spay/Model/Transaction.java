package com.transaction.spay.Model;

import java.math.BigDecimal;

public class Transaction {
    private String accountName;
    private long cardNumber;
    private BigDecimal transactionAmount;
    private TransactionType transactionType;
    private String description;
    private Long targetCardNumber; // Only for transfers

    public Transaction() {}

    public Transaction(String accountName, long cardNumber, BigDecimal transactionAmount,
                       TransactionType transactionType, String description, Long targetCardNumber) {
        this.accountName = accountName;
        this.cardNumber = cardNumber;
        this.transactionAmount = transactionAmount;
        this.transactionType = transactionType;
        this.description = description;
        this.targetCardNumber = targetCardNumber;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public long getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(long cardNumber) {
        this.cardNumber = cardNumber;
    }

    public BigDecimal getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(BigDecimal transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public TransactionType getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(TransactionType transactionType) {
        this.transactionType = transactionType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getTargetCardNumber() {
        return targetCardNumber;
    }

    public void setTargetCardNumber(Long targetCardNumber) {
        this.targetCardNumber = targetCardNumber;
    }
}