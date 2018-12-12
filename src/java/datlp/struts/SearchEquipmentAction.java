/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.equipments.EquipmentDAO;
import datlp.equipments.EquipmentDTO;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "searchEquip")
@Result(name = "success", location = "/admin-equipment-search.jsp")
public class SearchEquipmentAction {
    private String searchValue;
    private List<EquipmentDTO> listEquips;
    private String deleteResult;
    private static final String SUCCESS = "success";
    
    public SearchEquipmentAction() {
    }
    
    public String execute() throws Exception {
        EquipmentDAO dao = new EquipmentDAO();
        listEquips = dao.searchByLikeName(searchValue);
        
        if(deleteResult != null) {
            HttpServletRequest request = ServletActionContext.getRequest();
            if(deleteResult.equals("success")) {
                request.setAttribute("delete", "Delete success!");
            } else {
                request.setAttribute("delete", "Delete failed because"
                        + " that equipment is being used on another mission. "
                        + "Please wait to the end of the mission.");
            }
        }   
        return SUCCESS;
    }

    public String getDeleteResult() {
        return deleteResult;
    }

    public void setDeleteResult(String deleteResult) {
        this.deleteResult = deleteResult;
    }

    

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public List<EquipmentDTO> getListEquips() {
        return listEquips;
    }
    
}
