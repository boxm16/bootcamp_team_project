/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Michail Sitmalidis
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
    , @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username")
    , @NamedQuery(name = "User.findByFirstname", query = "SELECT u FROM User u WHERE u.firstname = :firstname")
    , @NamedQuery(name = "User.findByLastname", query = "SELECT u FROM User u WHERE u.lastname = :lastname")
    , @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @Column(name = "lastname")
    private String lastname;
    @Lob
    @Column(name = "profileimage")
    private byte[] profileimage;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;

    @Transient
    private String password_confirmation;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reviewed")
    private Collection<FootballReview> footballReviewCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reviewer")
    private Collection<FootballReview> footballReviewCollection1;
    @JoinColumn(name = "sports", referencedColumnName = "sports_id")
    @ManyToOne(optional = false)
    private Sport sport;

    public User() {
    }

    public User(String username) {
        this.username = username;
    }

    public User(String username, String firstname, String lastname, String password) {
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public byte[] getProfileimage() {
        return profileimage;
    }

    public void setProfileimage(byte[] profileimage) {
        this.profileimage = profileimage;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword_confirmation() {
        return password_confirmation;
    }

    public void setPassword_confirmation(String password_confirmation) {
        this.password_confirmation = password_confirmation;
    }
    

    @XmlTransient
    public Collection<FootballReview> getFootballReviewCollection() {
        return footballReviewCollection;
    }

    public void setFootballReviewCollection(Collection<FootballReview> footballReviewCollection) {
        this.footballReviewCollection = footballReviewCollection;
    }

    @XmlTransient
    public Collection<FootballReview> getFootballReviewCollection1() {
        return footballReviewCollection1;
    }

    public void setFootballReviewCollection1(Collection<FootballReview> footballReviewCollection1) {
        this.footballReviewCollection1 = footballReviewCollection1;
    }

    public Sport getSport() {
        return sport;
    }

    public void setSport(Sport sport) {
        this.sport = sport;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.User[ username=" + username + " ]";
    }

}
