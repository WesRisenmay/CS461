/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.group;

/**
 *
 * @author Wes
 */
public class Group {
    private double size;
    private double lengthFromOuterEdges;
    private double caliber;
    
    
    public Group()
    {
        size = 0.0; 
        lengthFromOuterEdges = 0.0;
        caliber = 0.0;
    }
    
    /**
     * 
     * @param lengthFromOuterEdges
     * @param caliber
     * @return the calculated group size
     */
    public double calculateGroupSize()
    {
        if(size == 0.0)
        {
            size = lengthFromOuterEdges - caliber;
        }
        
        return size;        
    }

    /**
     * @return the size
     */
    public double getSize() {
        return size;
    }

    /**
     * @param size the size to set
     */
    public void setSize(double size) {
        this.size = size;
    }

    /**
     * @return the lengthFromOuterEdges
     */
    public double getLengthFromOuterEdges() {
        return lengthFromOuterEdges;
    }

    /**
     * @param lengthFromOuterEdges the lengthFromOuterEdges to set
     */
    public void setLengthFromOuterEdges(double lengthFromOuterEdges) {
        this.lengthFromOuterEdges = lengthFromOuterEdges;
    }

    /**
     * @return the caliber
     */
    public double getCaliber() {
        return caliber;
    }

    /**
     * @param caliber the caliber to set
     */
    public void setCaliber(double caliber) {
        this.caliber = caliber;
    }

}
