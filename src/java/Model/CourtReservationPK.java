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
public class CourtReservationPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "courtname")
    private String courtname;
    @Basic(optional = false)
    @Column(name = "hours")
    private int hours;
    @Basic(optional = false)
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;

    public CourtReservationPK() {
    }

    public CourtReservationPK(String courtname, int hours, Date date) {
        this.courtname = courtname;
        this.hours = hours;
        this.date = date;
    }

    public String getCourtname() {
        return courtname;
    }

    public void setCourtname(String courtname) {
        this.courtname = courtname;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (courtname != null ? courtname.hashCode() : 0);
        hash += (int) hours;
        hash += (date != null ? date.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CourtReservationPK)) {
            return false;
        }
        CourtReservationPK other = (CourtReservationPK) object;
        if ((this.courtname == null && other.courtname != null) || (this.courtname != null && !this.courtname.equals(other.courtname))) {
            return false;
        }
        if (this.hours != other.hours) {
            return false;
        }
        if ((this.date == null && other.date != null) || (this.date != null && !this.date.equals(other.date))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.CourtReservationPK[ courtname=" + courtname + ", hours=" + hours + ", date=" + date + " ]";
    }
    
}
