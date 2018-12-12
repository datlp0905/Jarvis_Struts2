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
@Action(value = "updateEquip")
@Result(name = "success", type = "redirectAction",
        params = {
            "actionName", "viewEquipDetail",
            "id", "${id}"
        })
public class UpdateEquipAction {
    private String id, name, weight, description, owner;
    private static final String SUCCESS = "success";
    
    public UpdateEquipAction() {
    }
    
    public String execute() throws Exception {
        EquipmentDAO dao = new EquipmentDAO();
        float fWeight = -1;
        try {
            fWeight = Float.parseFloat(weight);
        } catch(NumberFormatException e) {
            
        }
        EquipmentDTO dto = new EquipmentDTO(id, name, description, owner, id, fWeight);
        dao.update(dto);
        return SUCCESS;
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

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
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
    
}
