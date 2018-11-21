/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
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
@Table(name = "court")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Court.findAll", query = "SELECT c FROM Court c")
    , @NamedQuery(name = "Court.findByName", query = "SELECT c FROM Court c WHERE c.courtPK.name = :name")
    , @NamedQuery(name = "Court.findByAddress", query = "SELECT c FROM Court c WHERE c.courtPK.address = :address")
    , @NamedQuery(name = "Court.findByPhone", query = "SELECT c FROM Court c WHERE c.phone = :phone")})
public class Court implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CourtPK courtPK;
    @Column(name = "phone")
    private Integer phone;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "court")
    private Collection<CourtReservation> courtReservationCollection;
    @JoinColumn(name = "type", referencedColumnName = "sports_id")
    @ManyToOne(optional = false)
    private Sport type;

    public Court() {
    }

    public Court(CourtPK courtPK) {
        this.courtPK = courtPK;
    }

    public Court(String name, String address) {
        this.courtPK = new CourtPK(name, address);
    }

    public CourtPK getCourtPK() {
        return courtPK;
    }

    public void setCourtPK(CourtPK courtPK) {
        this.courtPK = courtPK;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    @XmlTransient
    public Collection<CourtReservation> getCourtReservationCollection() {
        return courtReservationCollection;
    }

    public void setCourtReservationCollection(Collection<CourtReservation> courtReservationCollection) {
        this.courtReservationCollection = courtReservationCollection;
    }

    public Sport getType() {
        return type;
    }

    public void setType(Sport type) {
        this.type = type;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (courtPK != null ? courtPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Court)) {
            return false;
        }
        Court other = (Court) object;
        if ((this.courtPK == null && other.courtPK != null) || (this.courtPK != null && !this.courtPK.equals(other.courtPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Court[ courtPK=" + courtPK + " ]";
    }
    
}
