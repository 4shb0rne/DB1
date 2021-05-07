CREATE DATABASE studynetwork
use studynetwork
CREATE TABLE Users(
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    School VARCHAR(100),
    [Address] VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(100),
    [Location] VARCHAR(100),
    DOB VARCHAR(100),
    Gender VARCHAR(100)
);
CREATE TABLE Pages(
    PageID INT PRIMARY KEY,
    PageName VARCHAR(100),
    PageContent VARCHAR(100)
);
CREATE TABLE PageLikes(
    UserID INT,
    PageID INT
    CONSTRAINT PK_PL
        PRIMARY KEY (PageID)
    CONSTRAINT FK_Pages
        FOREIGN KEY (PageID)
        REFERENCES Pages (PageID)
);
CREATE TABLE Friends(
    FriendID INT,
    UserID INT
    CONSTRAINT PK_Friends
        PRIMARY KEY (FriendID)
    CONSTRAINT FK_User
        FOREIGN    KEY (UserID)
        REFERENCES Users (UserID)
);
CREATE TABLE Posts(
    UserID INT,
	FriendID INT,
    PostDate VARCHAR(100),
    PostContent VARCHAR(100),
    PostID INT
    CONSTRAINT PK_Posts
        PRIMARY KEY (PostID)
    CONSTRAINT FK_Posts
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),
        FOREIGN KEY (FriendID)
        REFERENCES Friends(FriendID)
);
CREATE TABLE Shares(
    PostID INT,
    UserID INT
    CONSTRAINT PK_Shares
        PRIMARY KEY(PostID)
    CONSTRAINT FK_Shares
        FOREIGN KEY(PostID)
        REFERENCES Posts(PostID),
        FOREIGN KEY (UserID)
        REFERENCES Posts(UserID)
);


CREATE TABLE Comments(
    PostID INT,
    CommentID INT,
    CommentDate VARCHAR(100),
    UserID INT,
    CommentContent VARCHAR(255)
    CONSTRAINT PK_Comments
        PRIMARY KEY (CommentID)
    CONSTRAINT FK_Comments
        FOREIGN KEY (PostID)
        REFERENCES Posts (PostID),
        FOREIGN KEY (UserID)
        REFERENCES Posts(UserID)
);
CREATE TABLE CommentLikes(
    CommentID INT,
    UserID INT
    CONSTRAINT PK_CommentLikes
        PRIMARY KEY (CommentID)
    CONSTRAINT FK_CommentLikes
        FOREIGN KEY (CommentID)
        REFERENCES Comments (CommentID),
        FOREIGN KEY (UserID)
        REFERENCES Comments(UserID)
);
CREATE TABLE PostLikes(
    PostID INT,
    UserID INT
    CONSTRAINT PK_PostLikes
        PRIMARY KEY (PostID)
    CONSTRAINT FK_PostLikes
        FOREIGN KEY (PostID)
        REFERENCES Posts (PostID),
        FOREIGN KEY (UserID)
        REFERENCES Posts(UserID)
);
CREATE TABLE Photos(
    PostID INT,
    PhotoID INT,
    ImageContent VARCHAR(255)
    CONSTRAINT PK_Photos
        PRIMARY KEY (PhotoID)
    CONSTRAINT FK_Photos
        Foreign KEY (PostID)
        REFERENCES Posts (PostID)
);