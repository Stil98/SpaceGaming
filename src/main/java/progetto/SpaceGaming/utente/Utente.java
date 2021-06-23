package progetto.SpaceGaming.utente;

import progetto.SpaceGaming.acquisto.Acquisto;

import java.util.List;
import java.util.Objects;

public class Utente {

    private String fname, lname, address, username, email, password, phoneNumber;
    private boolean isAdmin;
    private List<Acquisto> acquistoList;

    public Utente(String fname, String lname, String address, String username, String email, String password, String phoneNumber, boolean isAdmin, List<Acquisto> acquistoList) {
        this.fname = fname;
        this.lname = lname;
        this.address = address;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.isAdmin = isAdmin;
        this.acquistoList = acquistoList;
    }

    public Utente() {
        super();
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public List<Acquisto> getOrderList() {
        return acquistoList;
    }

    public void setOrderList(List<Acquisto> acquistoList) {
        this.acquistoList = acquistoList;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + fname + '\'' +
                ", surname='" + lname + '\'' +
                ", address='" + address + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", isAdmin=" + isAdmin +
                ", orderList=" + acquistoList +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Utente utente = (Utente) o;
        return isAdmin == utente.isAdmin && Objects.equals(fname, utente.fname) && Objects.equals(lname, utente.lname) && Objects.equals(address, utente.address) && Objects.equals(username, utente.username) && Objects.equals(email, utente.email) && Objects.equals(password, utente.password) && Objects.equals(phoneNumber, utente.phoneNumber) && Objects.equals(acquistoList, utente.acquistoList);
    }

}
