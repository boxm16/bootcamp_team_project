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
 * @author Michail Sitmalidis
 */
@Entity
@Table(name = "sports")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sports.findAll", query = "SELECT s FROM Sports s")
    , @NamedQuery(name = "Sports.findBySportsId", query = "SELECT s FROM Sports s WHERE s.sportsId = :sportsId")
    , @NamedQuery(name = "Sports.findBySports", query = "SELECT s FROM Sports s WHERE s.sports = :sports")})
public class Sports implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "sports_id")
    private Integer sportsId;
    @Basic(optional = false)
    @Column(name = "sports")
    private String sports;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sports")
    private Collection<Users> usersCollection;

    public Sports() {
    }

    public Sports(Integer sportsId) {
        this.sportsId = sportsId;
    }

    public Sports(Integer sportsId, String sports) {
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
    public Collection<Users> getUsersCollection() {
        return usersCollection;
    }

    public void setUsersCollection(Collection<Users> usersCollection) {
        this.usersCollection = usersCollection;
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
        if (!(object instanceof Sports)) {
            return false;
        }
        Sports other = (Sports) object;
        if ((this.sportsId == null && other.sportsId != null) || (this.sportsId != null && !this.sportsId.equals(other.sportsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Sports[ sportsId=" + sportsId + " ]";
    }
    
}
