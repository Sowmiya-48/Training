package com.example.queue;

import java.util.LinkedList;
import java.util.Queue;

public class Helpdesk {
    static Queue<String> ticketQueue = new LinkedList<>();

    public static void raiseTicket(String ticket) {
        ticketQueue.add(ticket);
        System.out.println("Ticket raised: " + ticket);
    }

    public static void solveTicket() {
        if (!ticketQueue.isEmpty()) {
            String solved = ticketQueue.poll();
            System.out.println("Solved ticket: " + solved);
        } else {
            System.out.println("No tickets to solve.");
        }
    }

    public static void displayTickets() {
        System.out.println("Tickets in queue: " + ticketQueue);
    }

    public static void main(String[] args) {
        raiseTicket("Student1 - Forgot ID card");
        raiseTicket("Student2 - Login not working");
        raiseTicket("Student3 - Hostel Wi-Fi down");

        displayTickets();
        solveTicket(); 
        displayTickets();
        solveTicket(); 
        displayTickets();
        solveTicket();
    }
}
