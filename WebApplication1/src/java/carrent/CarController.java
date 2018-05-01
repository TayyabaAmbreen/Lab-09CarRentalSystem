/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrent;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

/**
 *
 * @author Amal
 */
@ManagedBean
@SessionScoped
public class CarController {

    /**
     * Creates a new instance of CarController
     */
    
    int startId;
    int endId;
    DataModel carTitles;
    CarHelper helper;
    private int recordCount = 1000;
    private int pageSize = 10;

    private Cars current;
    private int selectedItemIndex;
    public CarController() {
        helper = new CarHelper();
        startId = 1;
        endId = 100000000;
    }
    public CarController(int startId, int endId) {
        helper = new CarHelper();
        this.startId = startId;
        this.endId = endId;
        
    }


    public Cars getSelected() {
        if (current == null) {
            current = new Cars();
            selectedItemIndex = -1;
        }
        return current;
    }


  

    void recreateModel() {
        carTitles = null;
    }
    
    public boolean isHasNextPage() {
        if (endId + pageSize <= recordCount) {
            return true;
        }
        return false;
    }

    public boolean isHasPreviousPage() {
        if (startId-pageSize > 0) {
            return true;
        }
        return false;
    }

    public String next() {
        startId = endId+1;
        endId = endId + pageSize;
        recreateModel();
        return "index";
    }

    public String previous() {
        startId = startId - pageSize;
        endId = endId - pageSize;
        recreateModel();
        return "index";
    }

    public int getPageSize() {
        return pageSize;
    }
    public DataModel getCarTitles() {
        if (carTitles == null) {
            carTitles = new ListDataModel(helper.getCarTitles(startId, endId));
        }
        return carTitles;
    }

    public String prepareView(){
        current = (Cars) getCarTitles().getRowData();
        return "Browse";
    }
    
     public String prepareLogin(){
       // current = (Cars) getCarTitles().getRowData();
        return "Login";
    }
      public String prepareSignup(){
       // current = (Cars) getCarTitles().getRowData();
        return "Signup";
    }
       public String prepareBooking(){
       // current = (Cars) getCarTitles().getRowData();
        return "Booking";
    }
     
    public String prepareList(){
        //recreateModel();
        return "index";
    }
    
}
