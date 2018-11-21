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
@Table(name = "court_reservation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CourtReservation.findAll", query = "SELECT c FROM CourtReservation c")
    , @NamedQuery(name = "CourtReservation.findByCourtname", query = "SELECT c FROM CourtReservation c WHERE c.courtReservationPK.courtname = :courtname")
    , @NamedQuery(name = "CourtReservation.findByHours", query = "SELECT c FROM CourtReservation c WHERE c.courtReservationPK.hours = :hours")
    , @NamedQuery(name = "CourtReservation.findByDate", query = "SELECT c FROM CourtReservation c WHERE c.courtReservationPK.date = :date")})
public class CourtReservation implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CourtReservationPK courtReservationPK;
    @JoinColumn(name = "booker", referencedColumnName = "username")
    @ManyToOne
    private User booker;
    @JoinColumn(name = "courtname", referencedColumnName = "name", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Court court;
    @JoinColumn(name = "hours", referencedColumnName = "hours_id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Hours hours1;

    public CourtReservation() {
    }

    public CourtReservation(CourtReservationPK courtReservationPK) {
        this.courtReservationPK = courtReservationPK;
    }

    public CourtReservation(String courtname, int hours, Date date) {
        this.courtReservationPK = new CourtReservationPK(courtname, hours, date);
    }

    public CourtReservationPK getCourtReservationPK() {
        return courtReservationPK;
    }

    public void setCourtReservationPK(CourtReservationPK courtReservationPK) {
        this.courtReservationPK = courtReservationPK;
    }

    public User getBooker() {
        return booker;
    }

    public void setBooker(User booker) {
        this.booker = booker;
    }

    public Court getCourt() {
        return court;
    }

    public void setCourt(Court court) {
        this.court = court;
    }

    public Hours getHours1() {
        return hours1;
    }

    public void setHours1(Hours hours1) {
        this.hours1 = hours1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (courtReservationPK != null ? courtReservationPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CourtReservation)) {
            return false;
        }
        CourtReservation other = (CourtReservation) object;
        if ((this.courtReservationPK == null && other.courtReservationPK != null) || (this.courtReservationPK != null && !this.courtReservationPK.equals(other.courtReservationPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.CourtReservation[ courtReservationPK=" + courtReservationPK + " ]";
    }
    
}
