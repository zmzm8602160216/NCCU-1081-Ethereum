pragma solidity ^0.5.11;

contract Fish {
    // 合約擁有者
    address private owner;
    
    struct UserStruct{
        string userName;
        string userPwd;
        bool isUser;
    }
    mapping (address => UserStruct) public userStructs;

    struct UserCard_Easy{
        uint cardID_1;
        uint cardID_2;
        uint cardID_3;
        uint cardID_4;
        uint cardID_5;
        uint cardID_6;
        uint cardID_7;
        uint cardID_8;
        uint cardID_9;
        uint cardID_10;
    }
    mapping (address => UserCard_Easy) public userCards_Easy;
    
    struct UserCard_Medium{
        uint cardID_11;
        uint cardID_12;
        uint cardID_13;
        uint cardID_14;
        uint cardID_15;
        uint cardID_16;
        uint cardID_17;
        uint cardID_18;
        uint cardID_19;
        uint cardID_20;
    }
    mapping (address => UserCard_Medium) public userCards_Medium;
    
    struct UserCard_Hard{
        uint cardID_21;
        uint cardID_22;
        uint cardID_23;
        uint cardID_24;
        uint cardID_25;
        uint cardID_26;
        uint cardID_27;
        uint cardID_28;
        uint cardID_29;
        uint cardID_30;
    }
    mapping (address => UserCard_Hard) public userCards_Hard;

    // 事件們，用於通知前端 web3.js
    event newUserEvent(address indexed from, string name, uint256 timestamp);
    event deleteUserEvent(address indexed from, string name, uint256 timestamp);
    event updateUserEvent(address indexed from, string name, uint256 timestamp);
    event LoginEvent(address indexed from, string name, uint256 timestamp);
    event newCardEvent(address indexed from, uint id, uint256 timestamp);

    modifier isOwner() {
        require(owner == msg.sender, "you are not owner");
        _;
    }

    // 建構子
    constructor() public payable {
        owner = msg.sender;
    }
    
    // 確認用戶是否已存在
    function isUser(address userAddress) public returns (bool) {
        return userStructs[userAddress].isUser;
    }

    // 註冊新用戶
    function newUser(string memory userName, string memory userPwd) public returns (bool) {
        if(isUser(msg.sender)) revert(); 
        userStructs[msg.sender].userName = userName;
        userStructs[msg.sender].userPwd = userPwd;
        userStructs[msg.sender].isUser = true;
        
        emit newUserEvent(msg.sender, userName, now);
        return true;
    }

    // 刪除用戶
    function deleteUser() public returns (bool) {
        if(!isUser(msg.sender)) revert();
        userStructs[msg.sender].isUser = false;
        
        emit deleteUserEvent(msg.sender, userStructs[msg.sender].userName, now);
        return true;
    }
    
    // 更新用戶資訊
    function updateUser(string memory userPwd) public returns(bool success) {
        if(!isUser(msg.sender)) revert();
        userStructs[msg.sender].userPwd = userPwd;
        
        emit updateUserEvent(msg.sender, userStructs[msg.sender].userName, now);
        return true;
    }
    
    // 登入
    function Login(string memory userName, string memory userPwd) public returns (bool) {
        if(keccak256(abi.encodePacked(userStructs[msg.sender].userName)) == keccak256(abi.encodePacked(userName)))
            if(keccak256(abi.encodePacked(userStructs[msg.sender].userPwd)) == keccak256(abi.encodePacked(userPwd))){
                emit LoginEvent(msg.sender, userName, now);
                return true;
            }
        return false;
    }
    
    // 取得帳戶資料
    function getData() public view returns (string memory){
        return userStructs[msg.sender].userName;
    }

    // 用戶取得新卡
    function newCard_Easy(uint id) public returns (bool) {
        if(id == 1) userCards_Easy[msg.sender].cardID_1++;
        if(id == 2) userCards_Easy[msg.sender].cardID_2++;
        if(id == 3) userCards_Easy[msg.sender].cardID_3++;
        if(id == 4) userCards_Easy[msg.sender].cardID_4++;
        if(id == 5) userCards_Easy[msg.sender].cardID_5++;
        if(id == 6) userCards_Easy[msg.sender].cardID_6++;
        if(id == 7) userCards_Easy[msg.sender].cardID_7++;
        if(id == 8) userCards_Easy[msg.sender].cardID_8++;
        if(id == 9) userCards_Easy[msg.sender].cardID_9++;
        if(id == 10) userCards_Easy[msg.sender].cardID_10++;
        
        emit newCardEvent(msg.sender, id, now);
        return true;
    }
    
    function newCard_Medium(uint id) public returns (bool) {
        if(id == 11) userCards_Medium[msg.sender].cardID_11++;
        if(id == 12) userCards_Medium[msg.sender].cardID_12++;
        if(id == 13) userCards_Medium[msg.sender].cardID_13++;
        if(id == 14) userCards_Medium[msg.sender].cardID_14++;
        if(id == 15) userCards_Medium[msg.sender].cardID_15++;
        if(id == 16) userCards_Medium[msg.sender].cardID_16++;
        if(id == 17) userCards_Medium[msg.sender].cardID_17++;
        if(id == 18) userCards_Medium[msg.sender].cardID_18++;
        if(id == 19) userCards_Medium[msg.sender].cardID_19++;
        if(id == 20) userCards_Medium[msg.sender].cardID_20++;
        
        emit newCardEvent(msg.sender, id, now);
        return true;
    }
    
    function newCard_Hard(uint id) public returns (bool) {
        if(id == 21) userCards_Hard[msg.sender].cardID_21++;
        if(id == 22) userCards_Hard[msg.sender].cardID_22++;
        if(id == 23) userCards_Hard[msg.sender].cardID_23++;
        if(id == 24) userCards_Hard[msg.sender].cardID_24++;
        if(id == 25) userCards_Hard[msg.sender].cardID_25++;
        if(id == 26) userCards_Hard[msg.sender].cardID_26++;
        if(id == 27) userCards_Hard[msg.sender].cardID_27++;
        if(id == 28) userCards_Hard[msg.sender].cardID_28++;
        if(id == 29) userCards_Hard[msg.sender].cardID_29++;
        if(id == 30) userCards_Hard[msg.sender].cardID_30++;
        
        emit newCardEvent(msg.sender, id, now);
        return true;
    }

    // 取得用戶卡片資訊
    function getCard_Easy() public view returns (uint[] memory) {
        uint[] memory count = new uint[](10);
        if(userCards_Easy[msg.sender].cardID_1 > 0){
            count[0] = userCards_Easy[msg.sender].cardID_1;
        }
        if(userCards_Easy[msg.sender].cardID_2 > 0){
            count[1] = userCards_Easy[msg.sender].cardID_2;
        }
        if(userCards_Easy[msg.sender].cardID_3 > 0){
            count[2] = userCards_Easy[msg.sender].cardID_3;
        }
        if(userCards_Easy[msg.sender].cardID_4 > 0){
            count[3] = userCards_Easy[msg.sender].cardID_4;
        }
        if(userCards_Easy[msg.sender].cardID_5 > 0){
            count[4] = userCards_Easy[msg.sender].cardID_5;
        }
        if(userCards_Easy[msg.sender].cardID_6 > 0){
            count[5] = userCards_Easy[msg.sender].cardID_6;
        }
        if(userCards_Easy[msg.sender].cardID_7 > 0){
            count[6] = userCards_Easy[msg.sender].cardID_7;
        }
        if(userCards_Easy[msg.sender].cardID_8 > 0){
            count[7] = userCards_Easy[msg.sender].cardID_8;
        }
        if(userCards_Easy[msg.sender].cardID_9 > 0){
            count[8] = userCards_Easy[msg.sender].cardID_9;
        }
        if(userCards_Easy[msg.sender].cardID_10 > 0){
            count[9] = userCards_Easy[msg.sender].cardID_10;
        }

        return count;
    }
    
    function getCard_Medium() public view returns (uint[] memory) {
        uint[] memory count = new uint[](10);
        if(userCards_Medium[msg.sender].cardID_11 > 0){
            count[0] = userCards_Medium[msg.sender].cardID_11;
        }
        if(userCards_Medium[msg.sender].cardID_12 > 0){
            count[1] = userCards_Medium[msg.sender].cardID_12;
        }
        if(userCards_Medium[msg.sender].cardID_13 > 0){
            count[2] = userCards_Medium[msg.sender].cardID_13;
        }
        if(userCards_Medium[msg.sender].cardID_14 > 0){
            count[3] = userCards_Medium[msg.sender].cardID_14;
        }
        if(userCards_Medium[msg.sender].cardID_15 > 0){
            count[4] = userCards_Medium[msg.sender].cardID_15;
        }
        if(userCards_Medium[msg.sender].cardID_16 > 0){
            count[5] = userCards_Medium[msg.sender].cardID_16;
        }
        if(userCards_Medium[msg.sender].cardID_17 > 0){
            count[6] = userCards_Medium[msg.sender].cardID_17;
        }
        if(userCards_Medium[msg.sender].cardID_18 > 0){
            count[7] = userCards_Medium[msg.sender].cardID_18;
        }
        if(userCards_Medium[msg.sender].cardID_19 > 0){
            count[8] = userCards_Medium[msg.sender].cardID_19;
        }
        if(userCards_Medium[msg.sender].cardID_20 > 0){
            count[9] = userCards_Medium[msg.sender].cardID_20;
        }

        return count;
    }
    
    function getCard_Hard() public view returns (uint[] memory) {
        uint[] memory count = new uint[](10);
        if(userCards_Hard[msg.sender].cardID_21 > 0){
            count[0] = userCards_Hard[msg.sender].cardID_21;
        }
        if(userCards_Hard[msg.sender].cardID_22 > 0){
            count[1] = userCards_Hard[msg.sender].cardID_22;
        }
        if(userCards_Hard[msg.sender].cardID_23 > 0){
            count[2] = userCards_Hard[msg.sender].cardID_23;
        }
        if(userCards_Hard[msg.sender].cardID_24 > 0){
            count[3] = userCards_Hard[msg.sender].cardID_24;
        }
        if(userCards_Hard[msg.sender].cardID_25 > 0){
            count[4] = userCards_Hard[msg.sender].cardID_25;
        }
        if(userCards_Hard[msg.sender].cardID_26 > 0){
            count[5] = userCards_Hard[msg.sender].cardID_26;
        }
        if(userCards_Hard[msg.sender].cardID_27 > 0){
            count[6] = userCards_Hard[msg.sender].cardID_27;
        }
        if(userCards_Hard[msg.sender].cardID_28 > 0){
            count[7] = userCards_Hard[msg.sender].cardID_28;
        }
        if(userCards_Hard[msg.sender].cardID_29 > 0){
            count[8] = userCards_Hard[msg.sender].cardID_29;
        }
        if(userCards_Hard[msg.sender].cardID_30 > 0){
            count[9] = userCards_Hard[msg.sender].cardID_30;
        }

        return count;
    }
}