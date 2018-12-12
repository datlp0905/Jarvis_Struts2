/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.equipments.EquipmentDAO;
import datlp.equipments.EquipmentDTO;
import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import datlp.missions.MissionDAO;
import datlp.missions.MissionDTO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "viewMissionDetail")
@Results({
    @Result(name = "view", location = "/admin-mission-detail.jsp"),
    @Result(name = "update", location = "/admin-mission-update.jsp"),
    @Result(name = "edit", location = "/admin-mission-update-member.jsp")
    
})
public class ViewMissionDetailAction {
    private String id, day, month, year;
    private MissionDTO missionDTO;
    private List<MemberDTO> membersDTO;
    private List<EquipmentDTO> equipsDTO;
    private Map<String, String> membersAvailable;
    private String searchValue;
    private String action;
    private static final String VIEW = "view";
    private static final String UPDATE = "update";
    private static final String EDIT = "edit";
    
    public ViewMissionDetailAction() {
    }
    
    public String execute() throws Exception {
        String url = VIEW;
        MissionDAO missionDAO = new MissionDAO();
        missionDTO = missionDAO.findByLikePrimaryKey(id);
        MemberDAO memberDAO = new MemberDAO();
        if(missionDTO != null) {
            membersDTO = memberDAO.findByLikeMission(id);
            String endTime = missionDTO.getEndTime();
            StringTokenizer stk = new StringTokenizer(endTime, "-");
            day = stk.nextToken(); month = stk.nextToken(); year = stk.nextToken();
        }
        if(action.equals("update")) {
            url = UPDATE;
        } else if(action.equals("edit")) {
            List<MemberDTO> list = memberDAO.getAvaiableMember();
            membersAvailable = new HashMap<>();
            for (MemberDTO dto : list) {
                membersAvailable.put(dto.getUsername(), dto.getFirstName() + " " + dto.getLastName());
            }
            url = EDIT;
        } else if(action.equals("view")) {
            EquipmentDAO equipDAO = new EquipmentDAO();
            equipsDTO = equipDAO.findByLikeMission(id);
        }
        return url;
    }

    public Map<String, String> getMembersAvailable() {
        return membersAvailable;
    }

    public List<EquipmentDTO> getEquipsDTO() {
        return equipsDTO;
    }
    
    public String getDay() {
        return day;
    }

    public String getMonth() {
        return month;
    }

    public String getYear() {
        return year;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
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

    public MissionDTO getMissionDTO() {
        return missionDTO;
    }

    public List<MemberDTO> getMembersDTO() {
        return membersDTO;
    }


    
}
