 -- CREATE DIRECTORY Directory1 AS 'D:\PLSQLREPO\Working_With_LOBs\Photos';
 --GRANT read,write ON DIRECTORY Directory1 TO c##ankitdb; 

CREATE TABLE image_table 
(
    image_id NUMBER(4) PRIMARY KEY,
    image_name VARCHAR2(20),
    image_data BFILE
);


INSERT INTO  image_table VALUES(1,'Image1',BFILENAME('Directory1','parrot.jpg'));

INSERT INTO  image_table VALUES(2,'Image2',BFILENAME('Directory1','Theme.jpeg'));

COMMIT;

DELETE FROM image_table WHERE image_id=1;

SELECT * FROM image_table;
