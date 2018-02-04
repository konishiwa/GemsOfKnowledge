CREATE DATABASE `quiz_app_development` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE DATABASE `quiz_app_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE DATABASE `quiz_app_production` /*!40100 DEFAULT CHARACTER SET utf8 */;

create user quiz_app@localhost identified by 'notsecure';

grant all on quiz_app_development.* to quiz_app@localhost;
grant all on quiz_app_test.* to quiz_app@localhost;
grant all on quiz_app_production.* to quiz_app@localhost;