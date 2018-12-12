/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.equipments;

import java.io.Serializable;

/**
 *
 * @author DAT
 */
public class EquipmentDTO implements Serializable {
    private String id, name, description, owner, img;
    private float weight;

    public EquipmentDTO() {
    }

    public EquipmentDTO(String id, String name, String description, String owner, String img, float weight) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.owner = owner;
        this.img = img;
        this.weight = weight;
    }

    public EquipmentDTO(String id, String name, String img) {
        this.id = id;
        this.name = name;
        this.img = img;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }
    
    
}
