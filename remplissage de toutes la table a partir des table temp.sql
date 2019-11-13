INSERT INTO state(libState)
SELECT DISTINCT(state)
FROM tempstate;

INSERT INTO type(libType)
SELECT DISTINCT(type)
FROM tempstate;

INSERT INTO equipment(pitLatrine,waterCloset,otherLatrine,noLatrine)
SELECT pitLatrine,waterCloset,otherLatrine,noLatrine
FROM tempstate;

INSERT INTO materials(mud,wood,brick,stone,cement,mosaic,any)
SELECT mud,wood,brick,stone,cement,mosaic,any
FROM tempmat;

INSERT INTO environment(idState,idType)
SELECT stat.idState,typ.idType
FROM state stat
INNER JOIN tempstate tmpst ON stat.libState=tmpst.state
INNER JOIN type typ ON tmpst.type=typ.libType;

INSERT INTO equipenvi(idEnvi,idEquip)
SELECT envi.idEnvi,equip.idEquip
FROM tempstate tmpstat
INNER JOIN state stat ON stat.libState=tmpstat.state
INNER JOIN environment envi ON stat.idState=envi.idEnvi
INNER JOIN equipment equip ON   (tmpstat.pitLatrine=equip.pitLatrine
								AND tmpstat.waterCloset=equip.waterCloset
                                AND tmpstat.otherLatrine=equip.otherLatrine
                                AND tmpstat.noLatrine=equip.noLatrine);
                                
INSERT INTO matenvi(idEnvi,idMat)
SELECT envi.idEnvi,mat.idMat
FROM tempmat tmpmat
INNER JOIN state stat ON stat.libState=tmpmat.state
INNER JOIN environment envi ON stat.idState=envi.idEnvi
INNER JOIN materials mat ON   (tmpmat.mud=mat.mud
								AND tmpmat.wood=mat.wood
                                AND tmpmat.brick=mat.brick
                                AND tmpmat.stone=mat.stone
                                AND tmpmat.cement=mat.cement
                                AND tmpmat.mosaic=mat.mosaic
                                AND tmpmat.any=mat.any);