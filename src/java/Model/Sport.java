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
@Table(name = "sport")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sport.findAll", query = "SELECT s FROM Sport s")
    , @NamedQuery(name = "Sport.findBySportsId", query = "SELECT s FROM Sport s WHERE s.sportsId = :sportsId")
    , @NamedQuery(name = "Sport.findBySports", query = "SELECT s FROM Sport s WHERE s.sports = :sports")})
public class Sport implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "sports_id")
    private Integer sportsId;
    @Basic(optional = false)
    @Column(name = "sports")
    private String sports;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sports")
    private Collection<User> userCollection;

    public Sport() {
    }

    public Sport(Integer sportsId) {
        this.sportsId = sportsId;
    }

    public Sport(Integer sportsId, String sports) {
        this.sportsId = sportsId;
        this.sports = sports;
    }

    public Integer getSportsId() {
        return sportsId;
    }

    public void setSportsId(Integer sportsId) {
        this.sportsId = sportsId;
    }

    public String getSports() {
        return sports;
    }

    public void setSports(String sports) {
        this.sports = sports;
    }

    @XmlTransient
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sportsId != null ? sportsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sport)) {
            return false;
        }
        Sport other = (Sport) object;
        if ((this.sportsId == null && other.sportsId != null) || (this.sportsId != null && !this.sportsId.equals(other.sportsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Sport[ sportsId=" + sportsId + " ]";
    }
    
}
