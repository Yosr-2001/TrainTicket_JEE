package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "billet")
public class Billet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dateEmission;

    

    @OneToOne
    private Reservation reservation;
 
    public Billet() {}

    public Billet(Date dateEmission, Reservation reservation) {
        this.dateEmission = dateEmission;
        this.reservation = reservation;
    }

    

    public int getId() {
        return id;
    }

    public Date getDateEmission() {
        return dateEmission;
    }

    public void setDateEmission(Date dateEmission) {
        this.dateEmission = dateEmission;
    }

  

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public void setId(int id) {
        this.id = id;
    }
}
