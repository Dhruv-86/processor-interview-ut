package com.transaction.spay.Model;

public class BadTransaction {

    private String rawData;
    private String errorMessage;

    public BadTransaction() {}

    public BadTransaction(String rawData, String errorMessage) {
        this.rawData = rawData;
        this.errorMessage = errorMessage;
    }

    public String getRawData() {
        return rawData;
    }

    public void setRawData(String rawData) {
        this.rawData = rawData;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

}
