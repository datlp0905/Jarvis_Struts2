/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.equipments;

import datlp.conn.MyConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DAT
 */
public class EquipmentDAO implements Serializable {
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public EquipmentDAO() {
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
    
    public List<EquipmentDTO> loadAll() throws ClassNotFoundException, SQLException {
        List<EquipmentDTO> result = null;
        String equipId, name, img;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select equipId, name, img From tblEquipment Where isActive = 1";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    equipId = rs.getString("equipId");
                    name = rs.getString("name");
                    img = rs.getString("img");
                    result.add(new EquipmentDTO(equipId, name, img));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<EquipmentDTO> findByLikeMission(String missionId) throws ClassNotFoundException, SQLException {
        List<EquipmentDTO> result = null;
        String equipId, name, img, owner;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select equipId, name, img, owner From tblEquipment "
                        + "Where equipId in (Select equipId From tblMissionDetail "
                        + "Where missionId = ?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, missionId);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    equipId = rs.getString("equipId");
                    name = rs.getString("name");
                    img = rs.getString("img");
                    owner = rs.getString("owner");
                    result.add(new EquipmentDTO(equipId, name, null, owner, img, 0));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public EquipmentDTO findByLikePrimarykey(String id) throws ClassNotFoundException, SQLException {
        EquipmentDTO dto = null;
        String name, img, owner, description;
        float weight;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select name, img, weight, owner, description From tblEquipment"
                        + " Where isActive = 1 and equipId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                rs = preStm.executeQuery();
                while(rs.next()) {
                    name = rs.getString("name");
                    img = rs.getString("img");
                    weight = rs.getFloat("weight");
                    owner = rs.getString("owner");
                    description = rs.getString("description");
                    dto = new EquipmentDTO(id, name, description, owner, img, weight);
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public EquipmentDTO findByLikeMission(String missionId, String username) throws ClassNotFoundException, SQLException {
        EquipmentDTO dto = null;
        String equipId, name, img;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select equipId, name, img From tblEquipment"
                        + " Where equipId = (Select equipId From tblMissionDetail "
                        + "Where missionId = ? and username = ?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, missionId);
                preStm.setString(2, username);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    equipId = rs.getString("equipId");
                    name = rs.getString("name");
                    img = rs.getString("img");
                    dto = new EquipmentDTO(equipId, name, img);
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public List<EquipmentDTO> searchByLikeName(String search) throws ClassNotFoundException, SQLException {
        List<EquipmentDTO> result = null;
        String equipId, name, owner;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select equipId, name, owner From tblEquipment Where isActive = 1 "
                        + "and name LIKE ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + search + "%");
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    equipId = rs.getString("equipId");
                    name = rs.getString("name");
                    owner = rs.getString("owner");
                    result.add(new EquipmentDTO(equipId, name, null, owner, null, 0));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<EquipmentDTO> findByLikeUsername(String username) throws ClassNotFoundException, SQLException {
        List<EquipmentDTO> result = null;
        String equipId, name, img;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select equipId, name, img From tblEquipment Where isActive = 1 "
                        + "and owner = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    equipId = rs.getString("equipId");
                    name = rs.getString("name");
                    img = rs.getString("img");
                    result.add(new EquipmentDTO(equipId, name, img));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean update(EquipmentDTO dto) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblEquipment Set name = ?, weight = ?, description = ?, owner = ? "
                        + "Where equipId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, dto.getName());
                preStm.setFloat(2, dto.getWeight());
                preStm.setString(3, dto.getDescription());
                preStm.setString(4, dto.getOwner());
                preStm.setString(5, dto.getId());
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean insert(EquipmentDTO dto) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Insert into tblEquipment (equipId, name, description, weight, owner, isActive) "
                        + "Values(?,?,?,?,?,1)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, dto.getId());
                preStm.setString(2, dto.getName());
                preStm.setString(3, dto.getDescription());
                preStm.setFloat(4, dto.getWeight());
                preStm.setString(5, dto.getOwner());
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean uploadImg(String id, String img) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblEquipment Set img = ? Where equipId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, img);
                preStm.setString(2, id);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean delete(String id) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblEquipment Set isActive = 0 "
                        + "Where equipId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean setEquipInMission(String equipId, String missionId, String username) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMissionDetail Set equipId = ? "
                        + "Where missionId = ? and username = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, equipId);
                preStm.setString(2, missionId);
                preStm.setString(3, username);
                
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean isUsing(String id) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select equipId From tblMissionDetail "
                        + "Where status = 'Doing' and equipId = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, id);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    row = 1;
                }
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
                String sql = "Select COUNT(equipId) AS total From tblEquipment Where isActive = 1";
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
