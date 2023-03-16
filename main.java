package main;
import models.Employee;

import java.time.LocalDate;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        int n = 0;
        String value;
        boolean isInt = false;
        Scanner sc = new Scanner(System.in);
        while(!isInt) {
            System.out.println("Enter the total of employees");
            value = sc.next();
            try {
                n = Integer.parseInt(value);
                isInt = true;
            } catch (Exception e) {
                System.out.println("Please enter a number");
            }
        }

        sc.nextLine();
        Employee[] employees = new Employee[n];
        LocalDate birthDate = null;
        LocalDate joinDate = null;
        boolean validBirthDate = false;
        boolean validJoinDate = false;

        for (int i = 0; i < employees.length; i++){
            System.out.println("Hello to the employee control");
            System.out.println("Enter employee name");
            String name = sc.nextLine();
            System.out.println("Enter employee direction");
            String direction = sc.nextLine();
            while (!validBirthDate) {
                try {

                    System.out.println("Enter employee birthdate in format yyyy-mm-dd");
                    String birthDateStr = sc.nextLine();
                    birthDate = LocalDate.parse(birthDateStr);
                    validBirthDate = true;
                } catch (Exception e) {
                    System.out.println("Please enter the date with format yyyy-mm-dd.");
                }

            }
            while(!validJoinDate){
                try{
                    System.out.println("Enter employee join date in format yyyy-mm-dd");
                    String joinDateStr = sc.nextLine();
                    joinDate = LocalDate.parse(joinDateStr);
                    validJoinDate = true;
                } catch (Exception e){
                    System.out.println("Please enter the date with format yyyy-mm-dd.");
                }
            }
            employees[i] = new Employee(name, direction, birthDate, joinDate);

            int employeeAge = employees[i].calcAge(birthDate);
            int employeeAntiquity = employees[i].calcAntiquity(joinDate);
            double employeAntiquityAmmount = employees[i].calcAntiquityAmmount(employeeAntiquity);

            System.out.println("The employee " +(i+1)+ " has "+employeeAge+" years old");
            if(employeeAntiquity > 15){
                System.out.println("Employee antiquity: "+employeeAntiquity);
                System.out.println("Employee antiquity ammount: "+employeAntiquityAmmount);
            }else{
                System.out.println("The employee has not enought antiquity to earn an ammount");
            }
            validJoinDate = false;
            validBirthDate = false;

        }
    }
}
