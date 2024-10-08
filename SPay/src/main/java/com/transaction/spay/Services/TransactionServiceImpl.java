package com.transaction.spay.Services;

import com.transaction.spay.Model.*;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileReader;
import java.math.BigDecimal;
import java.util.*;

@Service
public class TransactionServiceImpl implements TransactionService{
    private Map<String, Account> accounts = new HashMap<>();
    private List<BadTransaction> badTransactions = new ArrayList<>();

    @Override
    public void processFile(File file) {
        try (FileReader reader = new FileReader(file);
             CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT
                     .withTrim())) {

            for (CSVRecord csvRecord : csvParser) {
                String rawData = csvRecord.toString();

                try {
                    Transaction transaction = parseTransaction(csvRecord);
                    processTransaction(transaction);
                } catch (Exception e) {
                    BadTransaction badTransaction = new BadTransaction(rawData, e.getMessage());
                    badTransactions.add(badTransaction);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Transaction parseTransaction(CSVRecord record) throws Exception {
        try {
            String accountName = record.get(0).trim();
            String cardNumberStr = record.get(1).trim();
            String transactionAmountStr = record.get(2).trim();
            String transactionTypeStr = record.get(3).trim();
            String description = record.get(4).trim();
            String targetCardNumber = record.size() > 5 ? record.get(5).trim() : null;

            if (accountName.isEmpty() || cardNumberStr.isEmpty() || transactionAmountStr.isEmpty() || transactionTypeStr.isEmpty() || description.isEmpty()) {
                throw new Exception("Missing required fields");
            }

            BigDecimal transactionAmount = new BigDecimal(transactionAmountStr);
            long cardNumber = Long.parseLong(cardNumberStr);
            Long targetCardNumberLong = (targetCardNumber != null && !targetCardNumber.isEmpty()) ? Long.parseLong(targetCardNumber) : null;

            TransactionType transactionType = TransactionType.valueOf(transactionTypeStr.toUpperCase());

            if (transactionType == TransactionType.TRANSFER && targetCardNumberLong == null) {
                throw new Exception("Transfer transaction missing target card number");
            }

            return new Transaction(accountName, cardNumber, transactionAmount, transactionType, description, targetCardNumberLong);
        } catch (Exception e) {
            throw new Exception("Error parsing transaction: " + e.getMessage());
        }
    }

    private void processTransaction(Transaction transaction) throws Exception {
        Account account = accounts.computeIfAbsent(transaction.getAccountName(), Account::new);

        Card card = account.getCardByNumber(transaction.getCardNumber());
        if (card == null) {
            card = new Card(transaction.getCardNumber());
            account.addCard(card);
        }

        switch (transaction.getTransactionType()) {
            case CREDIT:
                card.applyTransactionAmount(transaction.getTransactionAmount());
                break;
            case DEBIT:
                card.applyTransactionAmount(transaction.getTransactionAmount().negate());
                break;
            case TRANSFER:
                if (transaction.getTargetCardNumber() == null) {
                    throw new Exception("Transfer transaction missing target card number");
                }
                processTransfer(transaction, card);
                break;
            default:
                throw new Exception("Unknown transaction type");
        }
    }

    private void processTransfer(Transaction transaction, Card sourceCard) throws Exception {
        sourceCard.applyTransactionAmount(transaction.getTransactionAmount().negate());

        Card targetCard = null;
        for (Account account : accounts.values()) {
            targetCard = account.getCardByNumber(transaction.getTargetCardNumber());
            if (targetCard != null) {
                break;
            }
        }
        if (targetCard == null) {
            targetCard = new Card(transaction.getTargetCardNumber());
            Account unknownAccount = accounts.computeIfAbsent("Unknown Account", Account::new);
            unknownAccount.addCard(targetCard);
        }
        targetCard.applyTransactionAmount(transaction.getTransactionAmount());
    }

    @Override
    public List<Account> getAllAccounts() {
        return new ArrayList<>(accounts.values());
    }

    @Override
    public List<BadTransaction> getBadTransactions() {
        return badTransactions;
    }

    @Override
    public List<Card> getCardsInCollections() {
        List<Card> cardsInCollections = new ArrayList<>();
        for (Account account : accounts.values()) {
            for (Card card : account.getCards()) {
                if (card.getBalance().compareTo(BigDecimal.ZERO) < 0) {
                    cardsInCollections.add(card);
                }
            }
        }
        return cardsInCollections;
    }

    @Override
    public void resetSystem() {
        accounts.clear();
        badTransactions.clear();
    }
}