package com.transaction.spay.Model;
import java.util.ArrayList;
import java.util.List;

public class Account {
    private String name;
    private List<Card> cards;

    public Account() {
        this.cards = new ArrayList<>();
    }

    public Account(String name) {
        this.name = name;
        this.cards = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Card> getCards() {
        return cards;
    }

    public void setCards(List<Card> cards) {
        this.cards = cards;
    }

    public void addCard(Card card) {
        this.cards.add(card);
    }

    public Card getCardByNumber(long cardNumber) {
        for (Card card : cards) {
            if (card.getCardNumber() == cardNumber) {
                return card;
            }
        }
        return null;
    }
}