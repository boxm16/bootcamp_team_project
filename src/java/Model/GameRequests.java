/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "game_requests")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "GameRequests.findAll", query = "SELECT g FROM GameRequests g")
    , @NamedQuery(name = "GameRequests.findById", query = "SELECT g FROM GameRequests g WHERE g.id = :id")
    , @NamedQuery(name = "GameRequests.findByRequestId", query = "SELECT g FROM GameRequests g WHERE g.requestId = :requestId")
    , @NamedQuery(name = "GameRequests.findByStatus", query = "SELECT g FROM GameRequests g WHERE g.status = :status")
    , @NamedQuery(name = "GameRequests.findByText", query = "SELECT g FROM GameRequests g WHERE g.text = :text")})
public class GameRequests implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "request_id")
    private int requestId;
    @Basic(optional = false)
    @Column(name = "status")
    private String status;
    @Column(name = "text")
    private String text;
    @JoinColumn(name = "match", referencedColumnName = "CourtReservationID")
    @ManyToOne(optional = false)
    private CourtReservation match;
    @JoinColumn(name = "request_receiver", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User requestReceiver;

    public GameRequests() {
    }

    public GameRequests(Integer id) {
        this.id = id;
    }

    public GameRequests(Integer id, int requestId, String status) {
        this.id = id;
        this.requestId = requestId;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public CourtReservation getMatch() {
        return match;
    }

    public void setMatch(CourtReservation match) {
        this.match = match;
    }

    public User getRequestReceiver() {
        return requestReceiver;
    }

    public void setRequestReceiver(User requestReceiver) {
        this.requestReceiver = requestReceiver;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GameRequests)) {
            return false;
        }
        GameRequests other = (GameRequests) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.GameRequests[ id=" + id + " ]";
    }
    
}
