--In the snowchrome directory I have run the two commands below
-- snowchrome % openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8 -nocrypt
-- snowchrome % openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub

create role chrome_extension;
grant role chrome_extension to role sysadmin;

CREATE USER chrome_extension PASSWORD='' DEFAULT_ROLE = chrome_extension ;
grant role chrome_extension to user chrome_extension;

ALTER USER chrome_extension SET RSA_PUBLIC_KEY='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2gA7CZMq4tB9g4XDnmUR
PhipjhtXmj51XWx8dDENrzyQqrBcsYo+80sHAANn+hbrT5dfk0bgQSEFapswYPfr
+xQjb787R7AKJEmwTgxt1Wuioj8O8isKlHE/s+EhU/vj3gFRoTBCkXzxIZ+vd1Jb
B+j6ctY+hJy/xg5hEiusV0yp7Acp1
jT0wJirX0Ku49CFHC5hpLIeuBGr1gOhqLa0FpReQOwWl2d/acMi8h75KiarlVo+K
AlZQ5CyAx7sJnM9F63MIQ+3IYF4rbCRXFCtlV9Art5IepeUi6Q8TFu4ORUlXs/ez
nwIDAQAB';

DESC USER chrome_extension;
SELECT SUBSTR((SELECT "value" FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()))
  WHERE "property" = 'RSA_PUBLIC_KEY_FP'), LEN('SHA256:') + 1);

--openssl rsa -pubin -in rsa_key.pub -outform DER | openssl dgst -sha256 -binary | openssl enc -base64



--Can use this to verify the public key fingerprint

select current_account();
