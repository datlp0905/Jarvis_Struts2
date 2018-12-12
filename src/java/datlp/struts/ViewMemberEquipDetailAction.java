/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.equipments.EquipmentDAO;
import datlp.equipments.EquipmentDTO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "viewMemberEquipDetail")
@Result(name = "success", location = "/member-equipment-detail.jsp")
public class ViewMemberEquipDetailAction {
    private String id;
    private EquipmentDTO dto;
    private static final String SUCCESS = "success";
    
    public ViewMemberEquipDetailAction() {
    }
    
    public String execute() throws Exception {
        EquipmentDAO dao = new EquipmentDAO();
        dto = dao.findByLikePrimarykey(id);
        return SUCCESS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public EquipmentDTO getDto() {
        return dto;
    }
    
}
