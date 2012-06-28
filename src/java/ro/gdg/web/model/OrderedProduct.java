/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.model;

/**
 *
 * @author diana
 */
public class OrderedProduct {

    private long tableBillId;
    private long productId;
    private int stateId;
    private String extraInfo;

    public OrderedProduct(long tableBillId, long productId, int stateId,
            String extraInfo) {
        super();
        this.tableBillId = tableBillId;
        this.productId = productId;
        this.stateId = stateId;
        this.extraInfo = extraInfo;
    }
    
    public long getTableBillId() {
        return tableBillId;
    }

    public void setTableBillId(long tableBillId) {
        this.tableBillId = tableBillId;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getExtraInfo() {
        return extraInfo;
    }

    public void setExtraInfo(String extraInfo) {
        this.extraInfo = extraInfo;
    }
}
