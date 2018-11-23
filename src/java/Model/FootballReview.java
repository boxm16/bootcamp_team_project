/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Michail Sitmalidis
 */
@Entity
@Table(name = "football_review")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FootballReview.findAll", query = "SELECT f FROM FootballReview f")
    , @NamedQuery(name = "FootballReview.findByFbreviewID", query = "SELECT f FROM FootballReview f WHERE f.fbreviewID = :fbreviewID")
    , @NamedQuery(name = "FootballReview.findByGame", query = "SELECT f FROM FootballReview f WHERE f.game = :game")
    , @NamedQuery(name = "FootballReview.findByTeamwork", query = "SELECT f FROM FootballReview f WHERE f.teamwork = :teamwork")
    , @NamedQuery(name = "FootballReview.findByAthletism", query = "SELECT f FROM FootballReview f WHERE f.athletism = :athletism")
    , @NamedQuery(name = "FootballReview.findByTechnique", query = "SELECT f FROM FootballReview f WHERE f.technique = :technique")
    , @NamedQuery(name = "FootballReview.findByComments", query = "SELECT f FROM FootballReview f WHERE f.comments = :comments")})
public class FootballReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "fb_reviewID")
    private Integer fbreviewID;
    @Basic(optional = false)
    @Column(name = "game")
    private int game;
    @Column(name = "teamwork")
    private Integer teamwork;
    @Column(name = "athletism")
    private Integer athletism;
    @Column(name = "technique")
    private Integer technique;
    @Column(name = "comments")
    private String comments;
    @JoinColumn(name = "reviewed", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User reviewed;
    @JoinColumn(name = "reviewer", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User reviewer;

    public FootballReview() {
    }

    public FootballReview(Integer fbreviewID) {
        this.fbreviewID = fbreviewID;
    }

    public FootballReview(Integer fbreviewID, int game) {
        this.fbreviewID = fbreviewID;
        this.game = game;
    }

    public Integer getFbreviewID() {
        return fbreviewID;
    }

    public void setFbreviewID(Integer fbreviewID) {
        this.fbreviewID = fbreviewID;
    }

    public int getGame() {
        return game;
    }

    public void setGame(int game) {
        this.game = game;
    }

    public Integer getTeamwork() {
        return teamwork;
    }

    public void setTeamwork(Integer teamwork) {
        this.teamwork = teamwork;
    }

    public Integer getAthletism() {
        return athletism;
    }

    public void setAthletism(Integer athletism) {
        this.athletism = athletism;
    }

    public Integer getTechnique() {
        return technique;
    }

    public void setTechnique(Integer technique) {
        this.technique = technique;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public User getReviewed() {
        return reviewed;
    }

    public void setReviewed(User reviewed) {
        this.reviewed = reviewed;
    }

    public User getReviewer() {
        return reviewer;
    }

    public void setReviewer(User reviewer) {
        this.reviewer = reviewer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fbreviewID != null ? fbreviewID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FootballReview)) {
            return false;
        }
        FootballReview other = (FootballReview) object;
        if ((this.fbreviewID == null && other.fbreviewID != null) || (this.fbreviewID != null && !this.fbreviewID.equals(other.fbreviewID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.FootballReview[ fbreviewID=" + fbreviewID + " ]";
    }
    
}
