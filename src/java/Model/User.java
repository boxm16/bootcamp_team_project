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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Herc
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<ReviewFilter> reviewFilterCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user1")
    private Collection<ReviewFilter> reviewFilterCollection1;
    @OneToMany(mappedBy = "booker")
    private Collection<CourtReservation> courtReservationCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<FootballReview> footballReviewCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user1")
    private Collection<FootballReview> footballReviewCollection1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receiver")
    private Collection<Message> messageCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sender")
    private Collection<Message> messageCollection1;
    @JoinColumn(name = "sports", referencedColumnName = "sports_id")
    @ManyToOne(optional = false)
    private Sport sports;

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

    @XmlTransient
    public Collection<ReviewFilter> getReviewFilterCollection() {
        return reviewFilterCollection;
    }

    public void setReviewFilterCollection(Collection<ReviewFilter> reviewFilterCollection) {
        this.reviewFilterCollection = reviewFilterCollection;
    }

    @XmlTransient
    public Collection<ReviewFilter> getReviewFilterCollection1() {
        return reviewFilterCollection1;
    }

    public void setReviewFilterCollection1(Collection<ReviewFilter> reviewFilterCollection1) {
        this.reviewFilterCollection1 = reviewFilterCollection1;
    }

    @XmlTransient
    public Collection<CourtReservation> getCourtReservationCollection() {
        return courtReservationCollection;
    }

    public void setCourtReservationCollection(Collection<CourtReservation> courtReservationCollection) {
        this.courtReservationCollection = courtReservationCollection;
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

    @XmlTransient
    public Collection<Message> getMessageCollection() {
        return messageCollection;
    }

    public void setMessageCollection(Collection<Message> messageCollection) {
        this.messageCollection = messageCollection;
    }

    @XmlTransient
    public Collection<Message> getMessageCollection1() {
        return messageCollection1;
    }

    public void setMessageCollection1(Collection<Message> messageCollection1) {
        this.messageCollection1 = messageCollection1;
    }

    public Sport getSports() {
        return sports;
    }

    public void setSports(Sport sports) {
        this.sports = sports;
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
