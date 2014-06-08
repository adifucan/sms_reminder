CREATE TABLE IF NOT EXISTS 'contacts' (
  'id' int(11) NOT NULL AUTO_INCREMENT,
  'publish_date' datetime DEFAULT NULL,
  'first_name' varchar(64) DEFAULT NULL,
  'last_name' varchar(64) DEFAULT NULL,
  'number' int(12) DEFAULT NULL,
  'user_id' int(11) DEFAULT NULL,
  PRIMARY KEY ('id'),
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE table IF NOT EXISTS 'user'

