/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import datlp.equipments.EquipmentDAO;
import datlp.equipments.EquipmentDTO;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "loadMemberEquip")
@Results({
    @Result(name = "input", location = "/login.jsp"),
    @Result(name = "success", location = "/member-equipment.jsp")
})
public class LoadMemberEquipAction {
    private List<EquipmentDTO> listEquips;
    private static final String SUCCESS = "success";
    private static final String INPUT = "input";
    
    public LoadMemberEquipAction() {
    }
    
    public String execute() throws Exception {
        String url = INPUT;
        Map session = ActionContext.getContext().getSession();
        String username = (String) session.get("USERNAME");
        if(username != null) {
            EquipmentDAO dao = new EquipmentDAO();
            listEquips = dao.findByLikeUsername(username);
            url = SUCCESS;
        }
        return url;
    }

    public List<EquipmentDTO> getListEquips() {
        return listEquips;
    }

    
}
