
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/26/2025 21:12:33
-- Generated from EDMX file: C:\Users\Zeynep Tuna Tosun\Downloads\VetClinicWeb\DataAccess\seng.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [VetClinic_Group6];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Animal__OwnerID__3F466844]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Animal] DROP CONSTRAINT [FK__Animal__OwnerID__3F466844];
GO
IF OBJECT_ID(N'[dbo].[FK__Appointme__Anima__4316F928]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointment] DROP CONSTRAINT [FK__Appointme__Anima__4316F928];
GO
IF OBJECT_ID(N'[dbo].[FK__Appointme__VetID__440B1D61]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointment] DROP CONSTRAINT [FK__Appointme__VetID__440B1D61];
GO
IF OBJECT_ID(N'[dbo].[FK__Diagnosis__Appoi__46E78A0C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Diagnosis] DROP CONSTRAINT [FK__Diagnosis__Appoi__46E78A0C];
GO
IF OBJECT_ID(N'[dbo].[FK__Diagnosis__Disea__47DBAE45]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Diagnosis] DROP CONSTRAINT [FK__Diagnosis__Disea__47DBAE45];
GO
IF OBJECT_ID(N'[dbo].[FK__Invoice__Appoint__4CA06362]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoice] DROP CONSTRAINT [FK__Invoice__Appoint__4CA06362];
GO
IF OBJECT_ID(N'[dbo].[FK__InvoiceIt__Invoi__4F7CD00D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK__InvoiceIt__Invoi__4F7CD00D];
GO
IF OBJECT_ID(N'[dbo].[FK__InvoiceIt__Treat__5070F446]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK__InvoiceIt__Treat__5070F446];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Animal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Animal];
GO
IF OBJECT_ID(N'[dbo].[Appointment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Appointment];
GO
IF OBJECT_ID(N'[dbo].[Diagnosis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Diagnosis];
GO
IF OBJECT_ID(N'[dbo].[Disease]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Disease];
GO
IF OBJECT_ID(N'[dbo].[Invoice]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoice];
GO
IF OBJECT_ID(N'[dbo].[InvoiceItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvoiceItem];
GO
IF OBJECT_ID(N'[dbo].[Owner]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Owner];
GO
IF OBJECT_ID(N'[dbo].[Treatment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Treatment];
GO
IF OBJECT_ID(N'[dbo].[Veterinarian]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Veterinarian];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Animals'
CREATE TABLE [dbo].[Animals] (
    [AnimalID] int IDENTITY(1,1) NOT NULL,
    [OwnerID] int  NOT NULL,
    [Name] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [AppointmentID] int IDENTITY(1,1) NOT NULL,
    [AnimalID] int  NOT NULL,
    [VetID] int  NOT NULL,
    [StartAt] datetime  NOT NULL,
    [Status] nvarchar(20)  NOT NULL,
    [Notes] nvarchar(200)  NULL
);
GO

-- Creating table 'Diagnosis'
CREATE TABLE [dbo].[Diagnosis] (
    [DiagnosisID] int IDENTITY(1,1) NOT NULL,
    [AppointmentID] int  NOT NULL,
    [DiseaseID] int  NOT NULL,
    [Notes] nvarchar(200)  NULL
);
GO

-- Creating table 'Diseases'
CREATE TABLE [dbo].[Diseases] (
    [DiseaseID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [InvoiceID] int IDENTITY(1,1) NOT NULL,
    [AppointmentID] int  NOT NULL,
    [Total] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'InvoiceItems'
CREATE TABLE [dbo].[InvoiceItems] (
    [InvoiceItemID] int IDENTITY(1,1) NOT NULL,
    [InvoiceID] int  NOT NULL,
    [TreatmentID] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [LineTotal] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'Owners'
CREATE TABLE [dbo].[Owners] (
    [OwnerID] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'Treatments'
CREATE TABLE [dbo].[Treatments] (
    [TreatmentID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [UnitPrice] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'Veterinarians'
CREATE TABLE [dbo].[Veterinarians] (
    [VetID] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(100)  NOT NULL,
    [Specialty] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AnimalID] in table 'Animals'
ALTER TABLE [dbo].[Animals]
ADD CONSTRAINT [PK_Animals]
    PRIMARY KEY CLUSTERED ([AnimalID] ASC);
GO

-- Creating primary key on [AppointmentID] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [PK_Appointments]
    PRIMARY KEY CLUSTERED ([AppointmentID] ASC);
GO

-- Creating primary key on [DiagnosisID] in table 'Diagnosis'
ALTER TABLE [dbo].[Diagnosis]
ADD CONSTRAINT [PK_Diagnosis]
    PRIMARY KEY CLUSTERED ([DiagnosisID] ASC);
GO

-- Creating primary key on [DiseaseID] in table 'Diseases'
ALTER TABLE [dbo].[Diseases]
ADD CONSTRAINT [PK_Diseases]
    PRIMARY KEY CLUSTERED ([DiseaseID] ASC);
GO

-- Creating primary key on [InvoiceID] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([InvoiceID] ASC);
GO

-- Creating primary key on [InvoiceItemID] in table 'InvoiceItems'
ALTER TABLE [dbo].[InvoiceItems]
ADD CONSTRAINT [PK_InvoiceItems]
    PRIMARY KEY CLUSTERED ([InvoiceItemID] ASC);
GO

-- Creating primary key on [OwnerID] in table 'Owners'
ALTER TABLE [dbo].[Owners]
ADD CONSTRAINT [PK_Owners]
    PRIMARY KEY CLUSTERED ([OwnerID] ASC);
GO

-- Creating primary key on [TreatmentID] in table 'Treatments'
ALTER TABLE [dbo].[Treatments]
ADD CONSTRAINT [PK_Treatments]
    PRIMARY KEY CLUSTERED ([TreatmentID] ASC);
GO

-- Creating primary key on [VetID] in table 'Veterinarians'
ALTER TABLE [dbo].[Veterinarians]
ADD CONSTRAINT [PK_Veterinarians]
    PRIMARY KEY CLUSTERED ([VetID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OwnerID] in table 'Animals'
ALTER TABLE [dbo].[Animals]
ADD CONSTRAINT [FK__Animal__OwnerID__3F466844]
    FOREIGN KEY ([OwnerID])
    REFERENCES [dbo].[Owners]
        ([OwnerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Animal__OwnerID__3F466844'
CREATE INDEX [IX_FK__Animal__OwnerID__3F466844]
ON [dbo].[Animals]
    ([OwnerID]);
GO

-- Creating foreign key on [AnimalID] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK__Appointme__Anima__4316F928]
    FOREIGN KEY ([AnimalID])
    REFERENCES [dbo].[Animals]
        ([AnimalID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Appointme__Anima__4316F928'
CREATE INDEX [IX_FK__Appointme__Anima__4316F928]
ON [dbo].[Appointments]
    ([AnimalID]);
GO

-- Creating foreign key on [VetID] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK__Appointme__VetID__440B1D61]
    FOREIGN KEY ([VetID])
    REFERENCES [dbo].[Veterinarians]
        ([VetID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Appointme__VetID__440B1D61'
CREATE INDEX [IX_FK__Appointme__VetID__440B1D61]
ON [dbo].[Appointments]
    ([VetID]);
GO

-- Creating foreign key on [AppointmentID] in table 'Diagnosis'
ALTER TABLE [dbo].[Diagnosis]
ADD CONSTRAINT [FK__Diagnosis__Appoi__46E78A0C]
    FOREIGN KEY ([AppointmentID])
    REFERENCES [dbo].[Appointments]
        ([AppointmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Diagnosis__Appoi__46E78A0C'
CREATE INDEX [IX_FK__Diagnosis__Appoi__46E78A0C]
ON [dbo].[Diagnosis]
    ([AppointmentID]);
GO

-- Creating foreign key on [AppointmentID] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK__Invoice__Appoint__4CA06362]
    FOREIGN KEY ([AppointmentID])
    REFERENCES [dbo].[Appointments]
        ([AppointmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Invoice__Appoint__4CA06362'
CREATE INDEX [IX_FK__Invoice__Appoint__4CA06362]
ON [dbo].[Invoices]
    ([AppointmentID]);
GO

-- Creating foreign key on [DiseaseID] in table 'Diagnosis'
ALTER TABLE [dbo].[Diagnosis]
ADD CONSTRAINT [FK__Diagnosis__Disea__47DBAE45]
    FOREIGN KEY ([DiseaseID])
    REFERENCES [dbo].[Diseases]
        ([DiseaseID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Diagnosis__Disea__47DBAE45'
CREATE INDEX [IX_FK__Diagnosis__Disea__47DBAE45]
ON [dbo].[Diagnosis]
    ([DiseaseID]);
GO

-- Creating foreign key on [InvoiceID] in table 'InvoiceItems'
ALTER TABLE [dbo].[InvoiceItems]
ADD CONSTRAINT [FK__InvoiceIt__Invoi__4F7CD00D]
    FOREIGN KEY ([InvoiceID])
    REFERENCES [dbo].[Invoices]
        ([InvoiceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__InvoiceIt__Invoi__4F7CD00D'
CREATE INDEX [IX_FK__InvoiceIt__Invoi__4F7CD00D]
ON [dbo].[InvoiceItems]
    ([InvoiceID]);
GO

-- Creating foreign key on [TreatmentID] in table 'InvoiceItems'
ALTER TABLE [dbo].[InvoiceItems]
ADD CONSTRAINT [FK__InvoiceIt__Treat__5070F446]
    FOREIGN KEY ([TreatmentID])
    REFERENCES [dbo].[Treatments]
        ([TreatmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__InvoiceIt__Treat__5070F446'
CREATE INDEX [IX_FK__InvoiceIt__Treat__5070F446]
ON [dbo].[InvoiceItems]
    ([TreatmentID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------