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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "viewEquipDetail")
@Result(name = "success", location = "/admin-equipment-detail.jsp")
public class ViewEquipDetailAction {
    private String id;
    private EquipmentDTO dto;
    private Map<String,String> listMembers;
    private String owner, defaultOwner;
    private String searchValue;
    private boolean isUsing;
    private static final String SUCCESS = "success";
    
    public ViewEquipDetailAction() {
    }
    
    public String execute() throws Exception {
        EquipmentDAO dao = new EquipmentDAO();
        MemberDAO memberDAO = new MemberDAO();
        
        dto = dao.findByLikePrimarykey(id);
        if(dto != null) {
            owner = dto.getOwner();
            defaultOwner = owner;
            isUsing = dao.isUsing(id);
        }
        List<MemberDTO> list = memberDAO.getAll();
        listMembers = new HashMap<>();
        for (MemberDTO memberDTO : list) {
            listMembers.put(memberDTO.getUsername(), memberDTO.getFirstName() + " " + memberDTO.getLastName());
        }
        return SUCCESS;
    }

    public boolean isIsUsing() {
        return isUsing;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public String getDefaultOwner() {
        return defaultOwner;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public EquipmentDTO getDto() {
        return dto;
    }

    public Map<String, String> getListMembers() {
        return listMembers;
    }
    
}
