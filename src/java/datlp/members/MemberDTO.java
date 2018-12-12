/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.members;

import java.io.Serializable;

/**
 *
 * @author DAT
 */
public class MemberDTO implements Serializable {
    private String username, password, firstName, lastName, heroName, gender, quote, birthdate, joinDate, role, avatar;

    public MemberDTO() {
    }

    public MemberDTO(String username, String firstName, String lastName, String heroName, String gender, String quote, String birthdate, String joinDate, String avatar) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.heroName = heroName;
        this.gender = gender;
        this.quote = quote;
        this.birthdate = birthdate;
        this.joinDate = joinDate;
        this.avatar = avatar;
    }


    public MemberDTO(String username, String password, String firstName, String lastName, String heroName, String gender, String birthdate) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.heroName = heroName;
        this.gender = gender;
        this.birthdate = birthdate;
    }

    public MemberDTO(String username, String firstName, String lastName, String avatar) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
    }

    public MemberDTO(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getHeroName() {
        return heroName;
    }

    public void setHeroName(String heroName) {
        this.heroName = heroName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
      
}
