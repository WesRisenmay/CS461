// Copyright © 2013 Wesley Risenmay
// [This program is licensed under the GNU GPL]
// Please see the file LICENSE in the source
// distribution of this software for license terms.
// Repo: https://github.com/WesRisenmay/CS461
// Contact: wrr@pdx.edu
package org.mypackage.group;

/**
 *
 * @author Wes
 */
public class Group implements java.io.Serializable{
    private double size;
    private int shots;
    
    
    public Group()
    {
        size = 0.0; 
        shots = 0;
    }
    
    /**
     * 
     * @param lengthFromOuterEdges
     * @param caliber
     * @return the calculated group size
     */
    /*public Group calculateGroupSize(double lengthFromOuterEdges, double caliber, double size, int shots)
    {
        if(size == 0.0)
        {
            this.size = lengthFromOuterEdges - caliber;
        }
        else{
            this.size = size;
        }
        
        this.shots = shots;
        
        return this;     
    }*/

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
     * @return the shots
     */
    public int getShots() {
        return shots;
    }

    /**
     * @param shots the shots to set
     */
    public void setShots(int shots) {
        this.shots = shots;
    }

}
