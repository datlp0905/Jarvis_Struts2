/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.missions.MissionDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "deleteMission")
@Results({
    @Result(name = "load", type = "redirectAction",
            params = {
                "actionName", "loadAllMission"
            }),
    @Result(name = "search", type = "redirectAction",
            params = {
                "actionName", "searchMission",
                "searchValue", "${searchValue}"
            })
})
public class DeleteMissionAction {
    private String id;
    private String searchValue;
    private static final String LOAD = "load";
    private static final String SEARCH = "search";
    
    public DeleteMissionAction() {
    }
    
    public String execute() throws Exception {
        String url = LOAD;
        MissionDAO dao = new MissionDAO();
        if(dao.delete(id)) {
            if(searchValue != null) {
                url = SEARCH;
            }
            dao.deleteDetail(id);
        }
        return url;
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
    
}
