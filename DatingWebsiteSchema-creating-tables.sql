CREATE TABLE User_Account(
    User_Id INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(200) NOT NULL,
    Email_Id VARCHAR(100) NOT NULL UNIQUE,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Date_Of_Birth DATE,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100),
    Registration_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Profiles(
    Profile_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_Id_FK INT,
    Profile_Type ENUM('Dating', 'Friendship', 'Work') NOT NULL,
    Bio TEXT,
    Interests TEXT,
    FOREGIN KEY (User_Id_FK) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Preferences(
    Preference_Id VARCHAR(100) NOT NULL,
    Prefered_Gender VARCHAR(100),
    Prefered_Age VARCHAR(100),
    Height INT,
    Job VARCHAR(100),
    Nationality VARCHAR(100),
    Language VARCHAR(100),
    Religion VARCHAR(100),
    Bio VARCHAR(250),
    User_Id_FK INT,
    FOREGIN KEY (User_Id_FK) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Profile_Photos(
    Photo_Id INT PRIMARY KEY AUTO_INCREMENT,
    Photo_Data BLOB NOT NULL,
    Photo_Type VARCHAR(100),
    Upload_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    User_Id_FK INT,
    FOREGIN KEY (User_Id_FK) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Blocked_Accounts(
    BlockedAccountId INT PRIMARY KEY AUTO_INCREMENT,
    User_Id INT,
    BlockedUserId INT,
    Block_Reason VARCHAR(250),
    Blocked_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (User_Id) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BlockedUserId) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Success_Story(
    Story_Id INT PRIMARY KEY AUTOINCREMENT,
    Bride_Id INT NOT NULL,
    Groom_Id INT NOT NULL,
    Success_Date DATE NOT NULL,
    Story TEXT NOT NULL,
    FOREIGN KEY (Bride_Id) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Groom_Id) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Match(
    Match_Id INT AUTO_INCREMENT PRIMARY KEY,
    Initiator_Id INT NOT NULL,
    Receiver_Id INT NOT NULL,
    Date_Of_Match DATE NOT NULL,
    Interest_Sent_On TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (Initiator_Id) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Receiver_Id) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Feedback(
    Feedback_Id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    User_Id_FK INT NOT NULL,
    Feedback_Stars INT,
    Feedback_Comments TEXT NOT NULL,
    FOREIGN KEY (User_Id_FK) REFERENCES User_Account(User_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Subscription(
    SubscriptionId INT,
    SubscriptionName VARCHAR(100) NOT NULL,
    Validity INT NOT NULL,
    Price NUMERIC(19,2) NOT NULL,
);

CREATE TABLE UserSubscriptions(
    UserSubId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    User_Id_FK INT,
    SubscriptionId_FK INT,
    User_Discount NUMERIC(19,2),
    Subscribed_On DATE NOT NULL,
    Validity Date NOT NULL,
    FOREIGN KEY (User_Id_FK) REFERENCES User_Account(User_Id_FK) ON UPDATE CASCADE,
    FOREIGN KEY (SubscriptionId_FK) REFERENCES Subscription(SubscriptionId) ON UPDATE CASCADE
 );