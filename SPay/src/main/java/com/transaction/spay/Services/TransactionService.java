package com.transaction.spay.Services;

import java.io.File;
import java.util.List;

import com.transaction.spay.Model.*;


public interface TransactionService {
    void processFile(File file);
    List<Account> getAllAccounts();
    List<BadTransaction> getBadTransactions();
    List<Card> getCardsInCollections();
    void resetSystem();
}
