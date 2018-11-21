/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Herc
 */
@Embeddable
public class ReviewFilterPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "Filter_reviewed")
    private String filterreviewed;
    @Basic(optional = false)
    @Column(name = "Filter_reviwerer")
    private String filterreviwerer;
    @Basic(optional = false)
    @Column(name = "Game_date")
    @Temporal(TemporalType.DATE)
    private Date gamedate;
    @Basic(optional = false)
    @Column(name = "game_id")
    private int gameId;

    public ReviewFilterPK() {
    }

    public ReviewFilterPK(String filterreviewed, String filterreviwerer, Date gamedate, int gameId) {
        this.filterreviewed = filterreviewed;
        this.filterreviwerer = filterreviwerer;
        this.gamedate = gamedate;
        this.gameId = gameId;
    }

    public String getFilterreviewed() {
        return filterreviewed;
    }

    public void setFilterreviewed(String filterreviewed) {
        this.filterreviewed = filterreviewed;
    }

    public String getFilterreviwerer() {
        return filterreviwerer;
    }

    public void setFilterreviwerer(String filterreviwerer) {
        this.filterreviwerer = filterreviwerer;
    }

    public Date getGamedate() {
        return gamedate;
    }

    public void setGamedate(Date gamedate) {
        this.gamedate = gamedate;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (filterreviewed != null ? filterreviewed.hashCode() : 0);
        hash += (filterreviwerer != null ? filterreviwerer.hashCode() : 0);
        hash += (gamedate != null ? gamedate.hashCode() : 0);
        hash += (int) gameId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReviewFilterPK)) {
            return false;
        }
        ReviewFilterPK other = (ReviewFilterPK) object;
        if ((this.filterreviewed == null && other.filterreviewed != null) || (this.filterreviewed != null && !this.filterreviewed.equals(other.filterreviewed))) {
            return false;
        }
        if ((this.filterreviwerer == null && other.filterreviwerer != null) || (this.filterreviwerer != null && !this.filterreviwerer.equals(other.filterreviwerer))) {
            return false;
        }
        if ((this.gamedate == null && other.gamedate != null) || (this.gamedate != null && !this.gamedate.equals(other.gamedate))) {
            return false;
        }
        if (this.gameId != other.gameId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.ReviewFilterPK[ filterreviewed=" + filterreviewed + ", filterreviwerer=" + filterreviwerer + ", gamedate=" + gamedate + ", gameId=" + gameId + " ]";
    }
    
}
