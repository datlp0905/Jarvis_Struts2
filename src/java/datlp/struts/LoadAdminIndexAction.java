/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.equipments.EquipmentDAO;
import datlp.members.MemberDAO;
import datlp.missions.MissionDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "loadAdminIndex")
@Result(name = "success", location = "/admin-index.jsp")
public class LoadAdminIndexAction {
    private int countMember;
    private int countMission;
    private int countEquip;
    private static final String SUCCESS = "success";
    
    public LoadAdminIndexAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO memDAO = new MemberDAO();
        MissionDAO missDAO = new MissionDAO();
        EquipmentDAO equipDAO = new EquipmentDAO();
        countMember = memDAO.count();
        countMission = missDAO.count();
        countEquip = equipDAO.count();
        return SUCCESS;
    }

    public int getCountMember() {
        return countMember;
    }

    public int getCountMission() {
        return countMission;
    }

    public int getCountEquip() {
        return countEquip;
    }
    
}
