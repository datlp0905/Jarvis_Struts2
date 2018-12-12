/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import datlp.equipments.EquipmentDAO;
import datlp.equipments.EquipmentDTO;
import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import datlp.missions.MissionDAO;
import datlp.missions.MissionDTO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "viewMemberMissionDetail")
@Result(name = "success", location = "/member-mission-detail.jsp")
public class ViewMemberMissionDetailAction {
    private String id;
    private MissionDTO missionDTO;
    private List<MemberDTO> listMembers;
    private Map<String, String> listEquips;
    private EquipmentDTO equipDTO;
    private static final String SUCCESS = "success";
    
    public ViewMemberMissionDetailAction() {
    }
    
    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        missionDTO = dao.findByLikePrimaryKey(id);
        if(missionDTO != null) {
            MemberDAO memberDAO = new MemberDAO();
            EquipmentDAO equipDAO = new EquipmentDAO();
            listMembers = memberDAO.findByLikeMission(id);
            Map session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            if(username != null) {
                //Get the equipments of this user
                List<EquipmentDTO> list = equipDAO.findByLikeUsername(username);
                if(list != null) {
                    listEquips = new HashMap<>();
                    for (EquipmentDTO equip : list) {
                        listEquips.put(equip.getId(), equip.getName());
                    }
                } 
            }
            equipDTO = equipDAO.findByLikeMission(id, username);
        }   
        return SUCCESS;
    }

    public List<MemberDTO> getListMembers() {
        return listMembers;
    }

    public Map<String, String> getListEquips() {
        return listEquips;
    }

    public String getEquipId() {
        return equipDTO.getId();
    }

    public EquipmentDTO getEquipDTO() {
        return equipDTO;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public MissionDTO getMissionDTO() {
        return missionDTO;
    }
    
}
