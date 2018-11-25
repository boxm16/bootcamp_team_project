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
import javax.persistence.FetchType;
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
@Table(name = "court")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Court.findAll", query = "SELECT c FROM Court c")
    , @NamedQuery(name = "Court.findByName", query = "SELECT c FROM Court c WHERE c.name = :name")
    , @NamedQuery(name = "Court.findByAddress", query = "SELECT c FROM Court c WHERE c.address = :address")
    , @NamedQuery(name = "Court.findByPhone", query = "SELECT c FROM Court c WHERE c.phone = :phone")})
public class Court implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "address")
    private String address;
    @Column(name = "phone")
    private Integer phone;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "courtname", fetch = FetchType.EAGER)
    private Collection<CourtReservation> courtReservationCollection;

    public Court() {
    }

    public Court(String name) {
        this.name = name;
    }

    public Court(String name, String address) {
        this.name = name;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (name != null ? name.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Court)) {
            return false;
        }
        Court other = (Court) object;
        if ((this.name == null && other.name != null) || (this.name != null && !this.name.equals(other.name))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Court[ name=" + name + " ]";
    }
    
}
