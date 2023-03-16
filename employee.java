package models;

import java.time.LocalDate;
import java.time.Period;

public class Employee {

    private String name;
    private String direction;
    private LocalDate birthDate;
    private LocalDate joinDate;


    public Employee(String name, String direction, LocalDate birthDate, LocalDate joinDate) {
        this.name = name;
        this.direction = direction;
        this.birthDate = birthDate;
        this.joinDate = joinDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public LocalDate getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDate joinDate) {
        this.joinDate = joinDate;
    }

    public int calcAge(LocalDate birthDate){
        LocalDate today = LocalDate.now();
        int edad = Period.between(birthDate, today).getYears();

        return edad;
    }

    public int calcAntiquity(LocalDate joinDate){
        LocalDate today = LocalDate.now();
        int antiquity = Period.between(joinDate, today).getYears();

        return antiquity;
    }

    public double calcAntiquityAmmount(int antiquity){
        int minSalary = 125;
        double antiquityAmmount = 0;

        if(antiquity > 15){
            antiquityAmmount = (antiquity * 12)*minSalary;
        }else {
            antiquityAmmount = 0;
        }
        return antiquityAmmount;
    }
}
