/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.equipments.EquipmentDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "deleteEquip")
@Results({
    @Result(name = "search", type = "redirectAction",
            params = {
                "actionName", "searchEquip",
                "searchValue", "${searchValue}",
                "deleteResult", "${deleteResult}"
            }),
    @Result(name = "load", type = "redirectAction",
            params = {
                "actionName", "loadAllEquip"
            })
})
public class DeleteEquipAction {
    private String id;
    private String searchValue;
    private String deleteResult;
    private static final String SEARCH = "search";
    private static final String LOAD = "load";
    
    public DeleteEquipAction() {
    }
    
    public String execute() throws Exception {
        String url = LOAD;
        EquipmentDAO dao = new EquipmentDAO();
        if(!dao.isUsing(id)) {
            if(dao.delete(id)) {
                deleteResult = "success";
            }
        } else {
            deleteResult = "failed";
        }
        
        if(searchValue != null) {
            url = SEARCH;
        }
        return url;
    }

    public String getDeleteResult() {
        return deleteResult;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }
    
}
