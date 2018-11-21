/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Herc
 */
@Entity
@Table(name = "football_review")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FootballReview.findAll", query = "SELECT f FROM FootballReview f")
    , @NamedQuery(name = "FootballReview.findByGame", query = "SELECT f FROM FootballReview f WHERE f.footballReviewPK.game = :game")
    , @NamedQuery(name = "FootballReview.findByReviewed", query = "SELECT f FROM FootballReview f WHERE f.footballReviewPK.reviewed = :reviewed")
    , @NamedQuery(name = "FootballReview.findByReviewer", query = "SELECT f FROM FootballReview f WHERE f.footballReviewPK.reviewer = :reviewer")
    , @NamedQuery(name = "FootballReview.findByComments", query = "SELECT f FROM FootballReview f WHERE f.comments = :comments")})
public class FootballReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected FootballReviewPK footballReviewPK;
    @Column(name = "comments")
    private String comments;
    @JoinColumn(name = "technique", referencedColumnName = "id")
    @ManyToOne
    private Grade technique;
    @JoinColumn(name = "athletism", referencedColumnName = "id")
    @ManyToOne
    private Grade athletism;
    @JoinColumn(name = "teamwork", referencedColumnName = "id")
    @ManyToOne
    private Grade teamwork;
    @JoinColumn(name = "reviewed", referencedColumnName = "username", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "reviewer", referencedColumnName = "username", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user1;

    public FootballReview() {
    }

    public FootballReview(FootballReviewPK footballReviewPK) {
        this.footballReviewPK = footballReviewPK;
    }

    public FootballReview(int game, String reviewed, String reviewer) {
        this.footballReviewPK = new FootballReviewPK(game, reviewed, reviewer);
    }

    public FootballReviewPK getFootballReviewPK() {
        return footballReviewPK;
    }

    public void setFootballReviewPK(FootballReviewPK footballReviewPK) {
        this.footballReviewPK = footballReviewPK;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Grade getTechnique() {
        return technique;
    }

    public void setTechnique(Grade technique) {
        this.technique = technique;
    }

    public Grade getAthletism() {
        return athletism;
    }

    public void setAthletism(Grade athletism) {
        this.athletism = athletism;
    }

    public Grade getTeamwork() {
        return teamwork;
    }

    public void setTeamwork(Grade teamwork) {
        this.teamwork = teamwork;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (footballReviewPK != null ? footballReviewPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FootballReview)) {
            return false;
        }
        FootballReview other = (FootballReview) object;
        if ((this.footballReviewPK == null && other.footballReviewPK != null) || (this.footballReviewPK != null && !this.footballReviewPK.equals(other.footballReviewPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.FootballReview[ footballReviewPK=" + footballReviewPK + " ]";
    }
    
}
