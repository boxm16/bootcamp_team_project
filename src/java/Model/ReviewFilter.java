/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = "review_filter")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReviewFilter.findAll", query = "SELECT r FROM ReviewFilter r")
    , @NamedQuery(name = "ReviewFilter.findByFilterreviewed", query = "SELECT r FROM ReviewFilter r WHERE r.reviewFilterPK.filterreviewed = :filterreviewed")
    , @NamedQuery(name = "ReviewFilter.findByFilterreviwerer", query = "SELECT r FROM ReviewFilter r WHERE r.reviewFilterPK.filterreviwerer = :filterreviwerer")
    , @NamedQuery(name = "ReviewFilter.findByGamedate", query = "SELECT r FROM ReviewFilter r WHERE r.reviewFilterPK.gamedate = :gamedate")
    , @NamedQuery(name = "ReviewFilter.findByGameId", query = "SELECT r FROM ReviewFilter r WHERE r.reviewFilterPK.gameId = :gameId")})
public class ReviewFilter implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ReviewFilterPK reviewFilterPK;
    @JoinColumn(name = "Filter_reviewed", referencedColumnName = "username", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "Filter_reviwerer", referencedColumnName = "username", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user1;

    public ReviewFilter() {
    }

    public ReviewFilter(ReviewFilterPK reviewFilterPK) {
        this.reviewFilterPK = reviewFilterPK;
    }

    public ReviewFilter(String filterreviewed, String filterreviwerer, Date gamedate, int gameId) {
        this.reviewFilterPK = new ReviewFilterPK(filterreviewed, filterreviwerer, gamedate, gameId);
    }

    public ReviewFilterPK getReviewFilterPK() {
        return reviewFilterPK;
    }

    public void setReviewFilterPK(ReviewFilterPK reviewFilterPK) {
        this.reviewFilterPK = reviewFilterPK;
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
        hash += (reviewFilterPK != null ? reviewFilterPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReviewFilter)) {
            return false;
        }
        ReviewFilter other = (ReviewFilter) object;
        if ((this.reviewFilterPK == null && other.reviewFilterPK != null) || (this.reviewFilterPK != null && !this.reviewFilterPK.equals(other.reviewFilterPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.ReviewFilter[ reviewFilterPK=" + reviewFilterPK + " ]";
    }
    
}
