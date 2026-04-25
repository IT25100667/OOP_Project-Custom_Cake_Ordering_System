package DTOs;

import com.example.jooq.tables.records.TblUsersRecord;

import java.util.Map;

public class UserDTO {
    public int id;
    private String password;
    public String username;
    public boolean employee;
    public String email;
    public String user_address;
    public String phone_number;

    public UserDTO(int id, String password, String username, boolean employee, String email, String user_address, String phone_number) {
        this.id = id;
        this.password = password;
        this.username = username;
        this.employee = employee;
        this.email = email;
        this.user_address = user_address;
        this.phone_number = phone_number;
    }

    public UserDTO(boolean employee, String email, String user_address, String phone_number, Integer id) {
        this.employee = employee;
        this.email = email;
        this.user_address = user_address;
        this.phone_number = phone_number;
        this.id = id;
    }

    public UserDTO(TblUsersRecord tblUsersRecord, boolean includePwrd) {
        this.email = tblUsersRecord.getEmail();
        this.user_address = tblUsersRecord.getUserAddress();
        this.employee = tblUsersRecord.getEmployee();
        this.phone_number = tblUsersRecord.getPhoneNumber();
        this.id = tblUsersRecord.getId();
        if(includePwrd){
            this.password = tblUsersRecord.getPassword();
        }
    }

    public TblUsersRecord getRecord(){
        return getRecord(false);
    }

    public TblUsersRecord getRecord(boolean includeID) {
        TblUsersRecord record = new TblUsersRecord();
        if(includeID) record.setId(id);
        record.setUsername(username);
        record.setPassword(password);
        record.setEmployee(employee);
        record.setEmail(email);
        record.setUserAddress(user_address);
        record.setPhoneNumber(phone_number);
        return record;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
