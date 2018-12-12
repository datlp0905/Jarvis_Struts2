/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.members;

import datlp.conn.MyConnection;
import datlp.missions.MissionDTO;
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
public class MemberDAO implements Serializable{
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public MemberDAO() {
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
    
    public String checkLogin(String username, String password) throws ClassNotFoundException, SQLException {
        String role = "failed";
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select role From tblMember Where username = ? and password = ? and isActive = 1";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                preStm.setString(2, password);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    role = rs.getString("role");
                }
            }
        } finally {
            closeConnection();
        }
        return role;
    }
    
    public List<MemberDTO> findByLikeFullname(String search) throws ClassNotFoundException, SQLException {
        List<MemberDTO> result = null;
        String username, firstname, lastname, heroname;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select username, firstname, lastname, heroname From tblMember "
                        + "Where (firstname LIKE ? or lastname LIKE ?) and isActive = 1 and role <> 'Admin'";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, "%" + search + "%");
                preStm.setString(2, "%" + search + "%");
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    username = rs.getString("username");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    heroname = rs.getString("heroname");
                    result.add(new MemberDTO(username, firstname, lastname, heroname, null, null, null, null, null));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public MemberDTO findByLikePrimarykey(String username) throws ClassNotFoundException, SQLException {
        MemberDTO dto = null;
        String firstname, lastname, heroname, gender, joinDate, avatar, birthdate;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select firstname, lastname, heroname, gender, joinDate, avatar, birthdate"
                        + " From tblMember Where username = ? and isActive = 1";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                rs = preStm.executeQuery();
                while(rs.next()) {
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    heroname = rs.getString("heroname");
                    gender = rs.getString("gender");
                    joinDate = rs.getDate("joinDate").toString();
                    avatar = rs.getString("avatar");
                    birthdate = rs.getDate("birthdate").toString();
                    dto = new MemberDTO(username, firstname, lastname, heroname, gender, null, birthdate, joinDate, avatar);
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public List<MemberDTO> getAll() throws ClassNotFoundException, SQLException {
        List<MemberDTO> result = null;
        String username, firstname, lastname, avatar;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select username, firstname, lastname, avatar From tblMember "
                        + "Where isActive = 1 and role <> 'Admin'";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    username = rs.getString("username");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    avatar = rs.getString("avatar");
                    result.add(new MemberDTO(username, firstname, lastname, avatar));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insert(MemberDTO dto) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Insert into tblMember (username,password,firstname,lastname,heroname,"
                        + "gender,birthdate,joinDate,isActive,role,avatar) "
                        + "Values (?,?,?,?,?,?,?,CURRENT_TIMESTAMP,1,'Member','default.png')";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, dto.getUsername());
                preStm.setString(2, dto.getPassword());
                preStm.setString(3, dto.getFirstName());
                preStm.setString(4, dto.getLastName());
                preStm.setString(5, dto.getHeroName());
                preStm.setString(6, dto.getGender());
                preStm.setString(7, dto.getBirthdate());
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public String getFirstname(String username) throws ClassNotFoundException, SQLException {
        String firstname = null;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select firstname From tblMember Where username = ? and isActive = 1";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    firstname = rs.getString("firstname");
                }
            }
        } finally {
            closeConnection();
        }
        return firstname;
    }
    
    public boolean resetPassword(String username, String password) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
             conn = MyConnection.getMyConnection();
             if(conn != null) {
                 String sql = "Update tblMember Set password = ? Where username = ?";
                 preStm = conn.prepareStatement(sql);
                 preStm.setString(1, password);
                 preStm.setString(2, username);
                 row = preStm.executeUpdate();
             }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean update(MemberDTO dto) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMember Set firstname = ?, lastname = ?, birthdate = ?, heroname = ?,"
                        + "gender = ? Where username = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, dto.getFirstName());
                preStm.setString(2, dto.getLastName());
                preStm.setString(3, dto.getBirthdate());
                preStm.setString(4, dto.getHeroName());
                preStm.setString(5, dto.getGender());
                preStm.setString(6, dto.getUsername());
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean ban(String username) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMember Set isActive = 0 Where username = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean changeAvatar(String username, String avatar) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
             conn = MyConnection.getMyConnection();
             if(conn != null) {
                 String sql = "Update tblMember Set avatar = ? Where username = ?";
                 preStm = conn.prepareStatement(sql);
                 preStm.setString(1, avatar);
                 preStm.setString(2, username);
                 row = preStm.executeUpdate();
             }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public List<MemberDTO> findByLikeMission(String missionId) throws ClassNotFoundException, SQLException {
        List<MemberDTO> result = null;
        String username, firstname, lastname, avatar;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select username, firstname, lastname, avatar From tblMember "
                        + "Where username in (Select username From tblMissionDetail Where missionId = ?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, missionId);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    username = rs.getString("username");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    avatar = rs.getString("avatar");
                    result.add(new MemberDTO(username, firstname, lastname, avatar));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    //Get members who are not doing any mission
    public List<MemberDTO> getAvaiableMember() throws ClassNotFoundException, SQLException {
        List<MemberDTO> result = null;
        String username, firstname, lastname;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select username, firstname, lastname From tblMember "
                        + "Where isActive = 1 and username NOT IN (Select username From tblMissionDetail "
                        + "Where status = 'Doing') and role != 'Admin'";
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                result = new ArrayList<>();
                while(rs.next()) {
                    username = rs.getString("username");
                    firstname = rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    result.add(new MemberDTO(username, firstname, lastname, null));
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public MissionDTO getOnWorkingMission(String username) throws ClassNotFoundException, SQLException {
        MissionDTO dto = null;
        String missionId, name;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select missionId, name From tblMission "
                        + "Where missionId = (Select missionId From tblMissionDetail Where username = ? "
                        + "and status = 'Doing') and isActive = 1";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                rs = preStm.executeQuery();
                if(rs.next()) {
                    missionId = rs.getString("missionId");
                    name = rs.getString("name");
                    dto = new MissionDTO(missionId, name);
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean changePassword(String username, String newPassword) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Update tblMember Set password = ? Where username = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, newPassword);
                preStm.setString(2, username);
                row = preStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
        return row == 1;
    }
    
    public boolean checkPassword(String username, String password) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select username From tblMember Where password = ? and username = ? and isActive = 1";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, password);
                preStm.setString(2, username);
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
    
    public boolean isWorking(String username) throws ClassNotFoundException, SQLException {
        int row = 0;
        try {
            conn = MyConnection.getMyConnection();
            if(conn != null) {
                String sql = "Select username From tblMissionDetail "
                        + "Where status = 'Doing' and username = ?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
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
                String sql = "Select COUNT(username) AS total From tblMember Where isActive = 1";
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
