/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Michail Sitmalidis
 */
@Entity
@Table(name = "grade")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Grade.findAll", query = "SELECT g FROM Grade g")
    , @NamedQuery(name = "Grade.findById", query = "SELECT g FROM Grade g WHERE g.id = :id")
    , @NamedQuery(name = "Grade.findByGrade", query = "SELECT g FROM Grade g WHERE g.grade = :grade")})
public class Grade implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "grade")
    private int grade;
    @OneToMany(mappedBy = "technique")
    private Collection<FootballReview> footballReviewCollection;
    @OneToMany(mappedBy = "athletism")
    private Collection<FootballReview> footballReviewCollection1;
    @OneToMany(mappedBy = "teamwork")
    private Collection<FootballReview> footballReviewCollection2;

    public Grade() {
    }

    public Grade(Integer id) {
        this.id = id;
    }

    public Grade(Integer id, int grade) {
        this.id = id;
        this.grade = grade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
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
    public Collection<FootballReview> getFootballReviewCollection2() {
        return footballReviewCollection2;
    }

    public void setFootballReviewCollection2(Collection<FootballReview> footballReviewCollection2) {
        this.footballReviewCollection2 = footballReviewCollection2;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Grade)) {
            return false;
        }
        Grade other = (Grade) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Grade[ id=" + id + " ]";
    }
    
}
