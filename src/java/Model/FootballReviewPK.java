/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author aroum
 */
@Embeddable
public class FootballReviewPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "game")
    private int game;
    @Basic(optional = false)
    @Column(name = "reviewed")
    private String reviewed;
    @Basic(optional = false)
    @Column(name = "reviewer")
    private String reviewer;

    public FootballReviewPK() {
    }

    public FootballReviewPK(int game, String reviewed, String reviewer) {
        this.game = game;
        this.reviewed = reviewed;
        this.reviewer = reviewer;
    }

    public int getGame() {
        return game;
    }

    public void setGame(int game) {
        this.game = game;
    }

    public String getReviewed() {
        return reviewed;
    }

    public void setReviewed(String reviewed) {
        this.reviewed = reviewed;
    }

    public String getReviewer() {
        return reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) game;
        hash += (reviewed != null ? reviewed.hashCode() : 0);
        hash += (reviewer != null ? reviewer.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FootballReviewPK)) {
            return false;
        }
        FootballReviewPK other = (FootballReviewPK) object;
        if (this.game != other.game) {
            return false;
        }
        if ((this.reviewed == null && other.reviewed != null) || (this.reviewed != null && !this.reviewed.equals(other.reviewed))) {
            return false;
        }
        if ((this.reviewer == null && other.reviewer != null) || (this.reviewer != null && !this.reviewer.equals(other.reviewer))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.FootballReviewPK[ game=" + game + ", reviewed=" + reviewed + ", reviewer=" + reviewer + " ]";
    }
    
}
