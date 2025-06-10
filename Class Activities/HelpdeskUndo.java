package com.example.stack;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Stack;

public class HelpdeskUndo {
    static Stack<String> ticketStack = new Stack<>();

    public static void raiseTicket(String ticket) {
        ticketStack.push(ticket);
        System.out.println("Ticket raised: " + ticket);
    }

    public static void undoTicket() {
        if (!ticketStack.isEmpty()) {
            String removed = ticketStack.pop();
            System.out.println("Undo ticket: " + removed);
        } else {
            System.out.println("No ticket to undo.");
        }
    }

    public static void displayTickets() {
        System.out.println("Current tickets: " + ticketStack);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        raiseTicket("Student1 - Forgot password");
        raiseTicket("Student2 - Unable to upload assignment");
        raiseTicket("Student1 - Update email");

        displayTickets();
        undoTicket();
        displayTickets();
        scanner.close();
    }
}
