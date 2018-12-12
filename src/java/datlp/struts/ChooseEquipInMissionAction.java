/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import datlp.equipments.EquipmentDAO;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "chooseEquip")
@Result(name = "success", type = "redirectAction",
        params = {
            "actionName", "viewMemberMissionDetail",
            "id", "${missionId}"
        })
public class ChooseEquipInMissionAction {
    private String missionId;
    private String equip;
    private static final String SUCCESS = "success";
    
    public ChooseEquipInMissionAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        String username = (String) session.get("USERNAME");
        if(username != null) {
            EquipmentDAO dao = new EquipmentDAO();
            dao.setEquipInMission(equip, missionId, username);
        }
        return SUCCESS;
    }

    public String getMissionId() {
        return missionId;
    }

    public void setMissionId(String missionId) {
        this.missionId = missionId;
    }

    public String getEquip() {
        return equip;
    }

    public void setEquip(String equip) {
        this.equip = equip;
    }
    
}
