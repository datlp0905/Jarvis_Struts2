/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.missions;

import datlp.conn.MyConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 *
 * @author DAT
 */
public class MissionDAO implements Serializable {
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public MissionDAO() {
    }

    private void closeConnection() throws SQLException {
        if(rs != null) {
            rs.close();
        }
        if(preStm != null) {
            preStm.close();
        }
        if(conn != null) {
            conn.close();
        }
    }
    
    public List<MissionDTO> loadAllDoing() throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String missionId, name;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select missionId, name From tblMission "
                        + "Where missionId in (Select missionId From tblMissionDetail "
                        + "Where status = 'Doing') and isActive = 1";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    missionId = rs.getString("missionId");
                    name = rs.getString("name");
                    result.add(new MissionDTO(missionId, name));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<MissionDTO> loadAllDone() throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String missionId, name;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select missionId, name From tblMission "
                        + "Where missionId in (Select missionId From tblMissionDetail Where "
                        + "status = 'Done') and isActive = 1";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    missionId = rs.getString("missionId");
                    name = rs.getString("name");
                    result.add(new MissionDTO(missionId, name));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<MissionDTO> loadAllFinish() throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String missionId, name, status;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select missionId, name, status From tblMission "
                        + "Where status != 'In Progress' and isActive = 1";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    missionId = rs.getString("missionId");
                    name = rs.getString("name");
                    status = rs.getString("status");
                    result.add(new MissionDTO(missionId, name, status));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
     public List<MissionDTO> loadAllByUsername(String username) throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String missionId, name, status;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select missionId, name, status From tblMission "
                        + "Where isActive = 1 and missionId in (Select missionId From tblMissionDetail "
                        + "Where username = ?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    missionId = rs.getString("missionId");
                    name = rs.getString("name");
                    status = rs.getString("status");
                    result.add(new MissionDTO(missionId, name, status));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<MissionDTO> searchByLikeName(String search) throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String missionId, name, place, status;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select missionId, name, place, status From tblMission Where name LIKE ? and isActive = 1";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + search + "%");
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    missionId = rs.getString("missionId");
                    name = rs.getString("name");
                    place = rs.getString("place");
                    status = rs.getString("status");
                    result.add(new MissionDTO(missionId, name, null, place, null, null, status));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean delete(String id) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMission Set isActive = 0 Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean deleteDetail(String id) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMissionDetail Set status = 'Deleted' Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean update(MissionDTO dto) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMission Set name = ?, description = ?, place = ?, endTime = ? Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, dto.getName());
                preStm.setString(2, dto.getDescription());
                preStm.setString(3, dto.getPlace());
                preStm.setString(4, dto.getEndTime());
                preStm.setString(5, dto.getId());
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public MissionDTO findByLikePrimaryKey(String id) throws ClassNotFoundException, SQLException {
        MissionDTO dto = null;
        String name, description, beginTime, endTime, place, status, report, attachment, submitTime;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select name, description, beginTime, endTime, place, status, report, attachment, submitTime"
                        + " From tblMission Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    name = rs.getString("name");
                    description = rs.getString("description");
                    beginTime = rs.getString("beginTime");
                    endTime = rs.getString("endTime");
                    place = rs.getString("place");
                    status = rs.getString("status");
                    report = rs.getString("report");
                    attachment = rs.getString("attachment");
                    submitTime = rs.getString("submitTime");
                    dto = new MissionDTO(id, name, description, place, beginTime, endTime, status, report, attachment);
                    dto.setSubmitTime(submitTime);
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean insert(MissionDTO dto) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Insert into tblMission (missionId,name,description,place,beginTime,endTime,"
                        + "status,isActive) "
                        + "Values(?,?,?,?,?,?,'In Progress',1)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, dto.getId());
                preStm.setString(2, dto.getName());
                preStm.setString(3, dto.getDescription());
                preStm.setString(4, dto.getPlace());
                preStm.setString(5, dto.getBeginTime());
                preStm.setString(6, dto.getEndTime());
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean insertDetail(String missionId, Set<String> setUsename) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                conn.setAutoCommit(false);
                for (String username : setUsename) {
                    String sql = "Insert into tblMissionDetail (missionId,username,status) "
                            + "Values(?,?,'Doing')";
                    preStm = conn.prepareStatement(sql);
                    preStm.setString(1, missionId);
                    preStm.setString(2, username);
                    row = preStm.executeUpdate();
                }   
            }
            conn.commit();
        } catch (SQLException e) {
            conn.rollback();
            row = 0;
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean insertAttachment(String attachment, String missionId) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMission Set attachment = ? Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, attachment);
                preStm.setString(2, missionId);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean insertReport(String report, String missionId) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMission Set report = ? Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, report);
                preStm.setString(2, missionId);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public String getReport(String id) throws ClassNotFoundException, SQLException {
        String report = null;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select report From tblMission Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    report = rs.getString("report");
                }
            }
        } finally {
            closeConnection();
        }
        return report;
    }
  
    public boolean submitMission(String id) throws ClassNotFoundException, SQLException{
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMissionDetail Set status = 'Done' Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean setSubmitTime(String id, String submitTime) throws ClassNotFoundException, SQLException{
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMission Set submitTime = ? Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, submitTime);
                preStm.setString(2, id);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean judgeMission(String status, String id) throws ClassNotFoundException, SQLException{
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMissionDetail Set status = 'Checked' Where missionId = ? "
                        + "Update tblMission Set status = ? Where missionId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                preStm.setString(2, status);
                preStm.setString(3, id);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row >= 1;
    }
    
    public boolean deleteMemberFromMission(String username, String id) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Delete tblMissionDetail Where missionId = ? and username = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                preStm.setString(2, username);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean addMemberToMission(String username, String id) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Insert into tblMissionDetail (missionId,username,status) "
                        + "Values(?,?,'Doing')";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                preStm.setString(2, username);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public int count() throws ClassNotFoundException, SQLException {
        int count = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select COUNT(missionId) AS total From tblMission Where isActive = 1";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    count = rs.getInt("total");
                }
            }
        } finally {
            closeConnection();
        }
        return count;
    }
}
