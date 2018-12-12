/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.equipments.EquipmentDAO;
import datlp.equipments.EquipmentDTO;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "loadAllEquip")
@Result(name = "success", location = "/admin-equipment.jsp")
public class LoadAllEquipAction {
    private List<EquipmentDTO> listEquips;
    private static final String SUCCESS = "success";
    
    public LoadAllEquipAction() {
    }
    
    public String execute() throws Exception {
        EquipmentDAO dao = new EquipmentDAO();
        listEquips = dao.loadAll();
        return SUCCESS;
    }

    public List<EquipmentDTO> getListEquips() {
        return listEquips;
    }
    
}
