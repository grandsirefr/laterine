USE laterine;

CREATE TABLE state (
  idState INT NOT NULL AUTO_INCREMENT,
  libState VARCHAR(45) NOT NULL,
  PRIMARY KEY (idstate))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE type (
  idType INT NOT NULL AUTO_INCREMENT,
  libType VARCHAR(45) NOT NULL,
  PRIMARY KEY (idtype))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE equipment (
  idEquip INT NOT NULL AUTO_INCREMENT,
  pitLatrine INT NULL,
  waterClosed INT NULL,
  otherLatrine INT NULL,
  noLatrine INT NULL,
  PRIMARY KEY (idequip))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE materials (
  idMat INT NOT NULL AUTO_INCREMENT,
  mud INT NULL,
  wood INT NULL,
  brick INT NULL,
  stone INT NULL,
  cement INT NULL,
  mosaic INT NULL,
  any INT NULL,
  PRIMARY KEY (idmat))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE environment (
  idEnvi INT NOT NULL AUTO_INCREMENT,
  idState INT NULL,
  idType INT NULL,
  PRIMARY KEY (idenvi))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE environment
ADD UNIQUE (idState,idType);

CREATE TABLE equipenvi (
  idEnvi INT NULL,
  idEquip INT NULL,
  UNIQUE(idEnvi,idEquip))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE matenvi (
  idEnvi INT NULL,
  idMat INT NULL,
  UNIQUE(idEnvi,idMat))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;