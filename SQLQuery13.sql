CREATE DATABASE StandVoca
GO
USE StandVoca
GO

CREATE TABLE Voce(
	IDVoce int CONSTRAINT PK_Voce PRIMARY KEY IDENTITY,
	Naziv nvarchar(50) CONSTRAINT UQ_Voce_Naziv UNIQUE NOT NULL
)

CREATE TABLE Sorta(
	IDSorta int CONSTRAINT PK_Sorta PRIMARY KEY IDENTITY,
	Naziv nvarchar(50),
	MinimalnaKolicina int CONSTRAINT CH_MinimalnaKolicina CHECK (MinimalnaKolicina >=0),
	TrenutnaKolicina int,
	NabavnaCijena decimal(10,2) CONSTRAINT CH_NabavnaCijena CHECK (NabavnaCijena > 0),
	ProdajnaCijena decimal(10,2) CONSTRAINT CH_ProdajnaCijena CHECK (ProdajnaCijena > 0),
	CONSTRAINT CK_ProdajnaCijena_Greather_Than_NabavnaCijena CHECK (ProdajnaCijena > NabavnaCijena),
	VoceID int CONSTRAINT FK_Sorta_Voce FOREIGN KEY REFERENCES Voce(IDVoce) NOT NULL
)

CREATE TABLE Dobavljac(
	IDDobavljac int CONSTRAINT PK_Dobavljac PRIMARY KEY IDENTITY,
	Ime nvarchar(50),
	Prezime nvarchar(50),
	Adresa nvarchar(100),
	BrojMobitela nvarchar(20)
)

CREATE TABLE DobavljacSorta(
	IDDobavljacSorta int CONSTRAINT PK_DobavljacSorta PRIMARY KEY IDENTITY,
	DobavljacID int CONSTRAINT FK_DobavljacSorta_Dobavljac FOREIGN KEY REFERENCES Dobavljac(IDDobavljac) NOT NULL,
	SortaID int CONSTRAINT FK_DobavljacSorta_Sorta FOREIGN KEY REFERENCES Sorta(IDSorta) NOT NULL
	)