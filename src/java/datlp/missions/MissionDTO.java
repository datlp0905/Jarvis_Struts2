/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.missions;

import java.io.Serializable;

/**
 *
 * @author DAT
 */
public class MissionDTO implements Serializable {
    private String id, name, description, place, beginTime, endTime, status, report, attachment, submitTime;

    public MissionDTO() {
    }

    public MissionDTO(String id, String name, String status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public MissionDTO(String id, String name, String description, String place, String beginTime, String endTime, String status, String report, String attachment) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.place = place;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.status = status;
        this.report = report;
        this.attachment = attachment;
    }

    public MissionDTO(String id, String name, String description, String place, String beginTime, String endtime, String status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.place = place;
        this.beginTime = beginTime;
        this.endTime = endtime;
        this.status = status;
    }

    public MissionDTO(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(String submitTime) {
        this.submitTime = submitTime;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
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

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }  
}
