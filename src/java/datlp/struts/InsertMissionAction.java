/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import datlp.missions.MissionDAO;
import datlp.missions.MissionDTO;
import datlp.utils.Utils;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "insertMission")
@Results({
    @Result(name = "success", type = "redirectAction",
            params = {
                "actionName", "viewMissionDetail",
                "action", "view",
                "id", "${id}"
            }),
    @Result(name = "input", location = "/admin-mission-insert.jsp")
})
public class InsertMissionAction {
    private String id;
    private String num;
    private String name, description, place, endTime, member1, member2, member3, member4;
    private static final String SUCCESS = "success";
    private static final String INPUT = "input";
    private Map<String, String> members1, members2, members3, members4;
    
    public InsertMissionAction() {
    }
    
    public String execute() throws Exception {
        id = "MS-" + Utils.getRandomId();
        MissionDAO missionDAO = new MissionDAO();
        StringTokenizer stk = new StringTokenizer(endTime, "-");
        String year = stk.nextToken();
        String month = stk.nextToken();
        String day = stk.nextToken();
        endTime = day + "-" + month + "-" + year;
        String beginTime = Calendar.getInstance().get(Calendar.DAY_OF_MONTH) + "-" + 
                (Calendar.getInstance().get(Calendar.MONTH) + 1) + "-" +
                Calendar.getInstance().get(Calendar.YEAR);
        MissionDTO dto = new MissionDTO(id, name, description, place, beginTime, endTime, null);
        Map<String,String> memberList = new HashMap<>();
        switch(num) {
            case "4":
                memberList.put(member4, "");
            case "3":
                memberList.put(member3, "");
            case "2":
                memberList.put(member2, "");
            case "1":
                memberList.put(member1, "");
        }
        Set<String> set = memberList.keySet();
        if(missionDAO.insert(dto)) {
            missionDAO.insertDetail(id, set);
        }
        return SUCCESS;
    }

    @Action(value = "initMission")
    public String init() throws Exception {
        MemberDAO dao = new MemberDAO();
        List<MemberDTO> listMember = dao.getAvaiableMember();
        members1 = new HashMap<>();
        members2 = new HashMap<>();
        members3 = new HashMap<>();
        members4 = new HashMap<>();
        for (MemberDTO memberDTO : listMember) {
            members1.put(memberDTO.getUsername(), memberDTO.getFirstName() + " " + memberDTO.getLastName());
            members2.put(memberDTO.getUsername(), memberDTO.getFirstName() + " " + memberDTO.getLastName());
            members3.put(memberDTO.getUsername(), memberDTO.getFirstName() + " " + memberDTO.getLastName());
            members4.put(memberDTO.getUsername(), memberDTO.getFirstName() + " " + memberDTO.getLastName());
        }
        return INPUT;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getMember1() {
        return member1;
    }

    public void setMember1(String member1) {
        this.member1 = member1;
    }

    public String getMember2() {
        return member2;
    }

    public void setMember2(String member2) {
        this.member2 = member2;
    }

    public String getMember3() {
        return member3;
    }

    public void setMember3(String member3) {
        this.member3 = member3;
    }

    public String getMember4() {
        return member4;
    }

    public void setMember4(String member4) {
        this.member4 = member4;
    }

    public Map<String, String> getMembers1() {
        return members1;
    }

    public Map<String, String> getMembers2() {
        return members2;
    }

    public Map<String, String> getMembers3() {
        return members3;
    }

    public Map<String, String> getMembers4() {
        return members4;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getId() {
        return id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    
}
