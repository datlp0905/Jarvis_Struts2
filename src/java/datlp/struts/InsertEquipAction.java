/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionSupport;
import datlp.equipments.EquipmentDAO;
import datlp.equipments.EquipmentDTO;
import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import datlp.utils.Utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "insertEquip")
@Results({
    @Result(name = "success", type = "redirectAction",
            params = {
                "actionName", "viewEquipDetail",
                "id", "${id}",
            }),
    @Result(name = "input", location = "/admin-equipment-insert.jsp")
})
public class InsertEquipAction extends ActionSupport {
    private String id, name, description, owner;
    private float weight;
    private Map<String,String> listMembers;
    private static final String SUCCESS = "success";
    private static final String INPUT = "input";
    
    public InsertEquipAction() {
    }
    
    public String execute() throws Exception {
        String url = INPUT;
        EquipmentDAO dao = new EquipmentDAO();
        id = "EQ-" + Utils.getRandomId();
        EquipmentDTO dto = new EquipmentDTO(id, name, description, owner, null, weight);
        if(dao.insert(dto)) {
            url = SUCCESS;
        }
        return url;
    }

    @Action(value = "initEquip")
    public String init() throws Exception {
        MemberDAO dao = new MemberDAO();
        listMembers = new HashMap<>();
        List<MemberDTO> list = dao.getAll();
        for (MemberDTO memberDTO : list) {
            listMembers.put(memberDTO.getUsername(), memberDTO.getFirstName() + " " + memberDTO.getLastName());
        }
        return INPUT;
    }
    public Map<String, String> getListMembers() {
        return listMembers;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }
    
}
