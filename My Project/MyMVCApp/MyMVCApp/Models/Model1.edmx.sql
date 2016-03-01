
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/21/2014 11:15:48
-- Generated from EDMX file: D:\Profiles\itp2193\Desktop\My Project\MyMVCApp\MyMVCApp\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MySuperDuperProject];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProjectTask]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_ProjectTask];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK_ProjectUser];
GO
IF OBJECT_ID(N'[dbo].[FK_TaskCondition]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_TaskCondition];
GO
IF OBJECT_ID(N'[dbo].[FK_TaskStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_TaskStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_TaskUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_TaskUser];
GO
IF OBJECT_ID(N'[dbo].[FK_TaskUser1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_TaskUser1];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_UserUserRole];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Condition]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Condition];
GO
IF OBJECT_ID(N'[dbo].[Project]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Project];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Task]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Task];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[UserRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRole];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Condition'
CREATE TABLE [dbo].[Condition] (
    [ConditionID] int IDENTITY(1,1) NOT NULL,
    [ConditionName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Project'
CREATE TABLE [dbo].[Project] (
    [ProjectID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [CrateDate] datetime  NOT NULL,
    [AuthorID] int  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [StatusID] int IDENTITY(1,1) NOT NULL,
    [StatusName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Task'
CREATE TABLE [dbo].[Task] (
    [TaskID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [FinishDate] datetime  NULL,
    [ConditionID] int  NOT NULL,
    [StatusID] int  NOT NULL,
    [AuthorID] int  NOT NULL,
    [AssignedToID] int  NOT NULL,
    [ProjectID] int  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [UserSurname] nvarchar(max)  NOT NULL,
    [UserRoleID] int  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserRole'
CREATE TABLE [dbo].[UserRole] (
    [RoleID] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ConditionID] in table 'Condition'
ALTER TABLE [dbo].[Condition]
ADD CONSTRAINT [PK_Condition]
    PRIMARY KEY CLUSTERED ([ConditionID] ASC);
GO

-- Creating primary key on [ProjectID] in table 'Project'
ALTER TABLE [dbo].[Project]
ADD CONSTRAINT [PK_Project]
    PRIMARY KEY CLUSTERED ([ProjectID] ASC);
GO

-- Creating primary key on [StatusID] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([StatusID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [TaskID] in table 'Task'
ALTER TABLE [dbo].[Task]
ADD CONSTRAINT [PK_Task]
    PRIMARY KEY CLUSTERED ([TaskID] ASC);
GO

-- Creating primary key on [UserID] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [RoleID] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [PK_UserRole]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ConditionID] in table 'Task'
ALTER TABLE [dbo].[Task]
ADD CONSTRAINT [FK_TaskCondition]
    FOREIGN KEY ([ConditionID])
    REFERENCES [dbo].[Condition]
        ([ConditionID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TaskCondition'
CREATE INDEX [IX_FK_TaskCondition]
ON [dbo].[Task]
    ([ConditionID]);
GO

-- Creating foreign key on [ProjectID] in table 'Task'
ALTER TABLE [dbo].[Task]
ADD CONSTRAINT [FK_ProjectTask]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[Project]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectTask'
CREATE INDEX [IX_FK_ProjectTask]
ON [dbo].[Task]
    ([ProjectID]);
GO

-- Creating foreign key on [AuthorID] in table 'Project'
ALTER TABLE [dbo].[Project]
ADD CONSTRAINT [FK_ProjectUser]
    FOREIGN KEY ([AuthorID])
    REFERENCES [dbo].[User]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectUser'
CREATE INDEX [IX_FK_ProjectUser]
ON [dbo].[Project]
    ([AuthorID]);
GO

-- Creating foreign key on [StatusID] in table 'Task'
ALTER TABLE [dbo].[Task]
ADD CONSTRAINT [FK_TaskStatus]
    FOREIGN KEY ([StatusID])
    REFERENCES [dbo].[Status]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TaskStatus'
CREATE INDEX [IX_FK_TaskStatus]
ON [dbo].[Task]
    ([StatusID]);
GO

-- Creating foreign key on [AuthorID] in table 'Task'
ALTER TABLE [dbo].[Task]
ADD CONSTRAINT [FK_TaskUser]
    FOREIGN KEY ([AuthorID])
    REFERENCES [dbo].[User]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TaskUser'
CREATE INDEX [IX_FK_TaskUser]
ON [dbo].[Task]
    ([AuthorID]);
GO

-- Creating foreign key on [AssignedToID] in table 'Task'
ALTER TABLE [dbo].[Task]
ADD CONSTRAINT [FK_TaskUser1]
    FOREIGN KEY ([AssignedToID])
    REFERENCES [dbo].[User]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TaskUser1'
CREATE INDEX [IX_FK_TaskUser1]
ON [dbo].[Task]
    ([AssignedToID]);
GO

-- Creating foreign key on [UserRoleID] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [FK_UserUserRole]
    FOREIGN KEY ([UserRoleID])
    REFERENCES [dbo].[UserRole]
        ([RoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserRole'
CREATE INDEX [IX_FK_UserUserRole]
ON [dbo].[User]
    ([UserRoleID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------