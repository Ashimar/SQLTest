
/* app������ ���ȫ������*/
CREATE TABLE IF NOT EXISTS APP_PARAMETER(
   PARAMETER_KEY     VARCHAR(50)   NOT NULL,   /* ������ */
   PARAMETER_VALUE   VARCHAR(150)  NOT NULL,   /* ����ֵ */
   PARAMETER_EXPLAIN VARCHAR(150),             /* ����˵�� */
   PRIMARY KEY (PARAMETER_KEY)
);

/* �������ͱ� */
CREATE TABLE IF NOT EXISTS RENT_TYPE(
   RENT_TYPE_ID    TINYINT(1)  NOT NULL,  /* ��������id */
   RENT_TYPE_NAME  VARCHAR(10) NOT NULL,  /* ������������ */
   PRIMARY KEY (RENT_TYPE_ID)
);

/* ����ҵ�������ͱ� */
CREATE TABLE IF NOT EXISTS OWNER_TYPE(
   OWNER_TYPE_ID   TINYINT(1)  NOT NULL,  /* ҵ������id */
   OWNER_TYPE_NAME VARCHAR(10) NOT NULL,  /* �������� */
   PRIMARY KEY (OWNER_TYPE_ID)
);

/* ����������ʩ�� */
CREATE TABLE IF NOT EXISTS SUPPORTING_FACILITIES(
   FACILITIES_ID    TINYINT(1)  NOT NULL,  /* ��ʩid */
   FACILITIES_TYPE  TINYINT(1)  NOT NULL,  /* ��ʩ��Ϣ���� 0:����  1:����  2:�ⷿ */
   FACILITIES_NAME  VARCHAR(20) NOT NULL,  /* ��ʩ���� */
   PRIMARY KEY (FACILITIES_ID)
);

/* ����¥��� */
CREATE TABLE FLOOR_POS(
   POS_ID      TINYINT(1)  NOT NULL,  /* ¥��λ��id */
   POS_ID_NAME VARCHAR(20) NOT NULL,  /* ¥��λ��˵�� */
   PRIMARY KEY (POS_ID)
);

/* ¥��ṹ�� */
CREATE TABLE FLOOR_STRUCT(
   STRUCT_ID      TINYINT(1)  NOT NULL,  /* ¥��ṹid */
   STRUCT_ID_NAME VARCHAR(20) NOT NULL,  /* ¥��ṹ���� */
   PRIMARY KEY (STRUCT_ID)
);

/* ����Ȩ�� */
CREATE TABLE IF NOT EXISTS OWNERSHIP(
   OWNERSHIP_ID    INT(11)     NOT NULL,  /* ����Ȩ�� */
   OWNERSHIP_NAME  VARCHAR(20) NOT NULL,  /* ����Ȩ���� */
   PRIMARY KEY (OWNERSHIP_ID)
);

/* ������;�� */
CREATE TABLE IF NOT EXISTS PURPOSE(
   PURPOSE_ID    INT(11)     NOT NULL,  /* ��;id */
   PURPOSE_NAME  VARCHAR(20) NOT NULL,  /* ��;���� */
   PRIMARY KEY (PURPOSE_ID)
);

/* ��ǩ�� */
CREATE TABLE IF NOT EXISTS ATTRIBUTE_TAG(
   TAG_ID     TINYINT(1)   NOT NULL,  /* ��ǩID */
   TAG_TYPE   TINYINT(1)   NOT NULL,  /* ��ǩ���� */
   TAG_NAME   VARCHAR(50)  NOT NULL,  /* ��ǩ˵�� */
   PRIMARY KEY (TAG_ID)
);

/* װ�����ͱ� */
CREATE TABLE IF NOT EXISTS FITMENT_TYPE(
   FITMENT_TYPE_ID    TINYINT(1)   NOT NULL,  /* װ������id */
   FITMENT_TYPE_NAME  VARCHAR(20)  NOT NULL,  /* װ���������� */
   PRIMARY KEY (FITMENT_TYPE_ID)
);

/* ���������ͱ� */
CREATE TABLE IF NOT EXISTS TOILET_TYPE(
   TOILET_TYPE_ID     TINYINT(1)   NOT NULL,  /* ����������id */
   TOILET_TYPE_NAME   VARCHAR(20)  NOT NULL,  /* �������������� */
   PRIMARY KEY (TOILET_TYPE_ID)
);

/* ��Ѷ���ܱ� */
CREATE TABLE IF NOT EXISTS INFORMATION_FUNCTION(
   FUN_INDEX      TINYINT(2)   NOT NULL,    /* ��Ѷ�������� */
   FUN_EXPLAIN    VARCHAR(150) NOT NULL,    /* ��Ѷ�������� */
   PRIMARY KEY (FUN_INDEX)
);

/* ������ */
CREATE TABLE IF NOT EXISTS SEARCH(
   SEARCH_ID             TINYINT(3)  NOT NULL,   /* ����id */
   SEARCH_TYPE           TINYINT(3)  NOT NULL,   /* 0:��� 1:��� 2:¥�� 3:�ṹ 4:��ǩ 5:���� 6:���� 7:���� 8:��ʩ */
   SEARCH_TYPE_NAME      VARCHAR(50) NOT NULL,   /* ������������ */
   SEARCH_COME           TINYINT(3)  NOT NULL,   /* 1:���� 2:���� 3:�ⷿ */
   PRIMARY KEY (SEARCH_ID,SEARCH_TYPE,SEARCH_COME)
);

/* �ֵ��б� */
CREATE TABLE IF NOT EXISTS FACTORY_BRANCH(
   BRANCH_INDEX  TINYINT(3)   NOT NULL,  /* �ֵ��������� */
   BRANCH_URL    VARCHAR(150),           /* �ֵ�ͼƬurl */
   AREA_CODE     VARCHAR(20)  NOT NULL,  /* ��ֱ�� */
   BRANCH_NAME   VARCHAR(20)  NOT NULL,  /* �ֵ����� */
   PRIMARY KEY (AREA_CODE)
);

/* ����������ҵ�� */
CREATE TABLE IF NOT EXISTS APPLY_TRADE(
   TRADE_ID   TINYINT(1)  NOT NULL,  /* ��ҵid */
   TRADE_NAME VARCHAR(20) NOT NULL,  /* ��ҵ���� */
   PRIMARY KEY (TRADE_ID)
);

/* �������ͱ� */
CREATE TABLE IF NOT EXISTS HOUSE_TYPE(
   HOUSE_TYPE_ID     TINYINT(1)   NOT NULL,  /* ��������id */
   HOUSE_TYPE_NAME   VARCHAR(20)  NOT NULL,  /* ������������ */
   PRIMARY KEY (HOUSE_TYPE_ID)
);

/* appȫ�ֵĹ�����ҳurl�� */
CREATE TABLE IF NOT EXISTS APP_GLOBAL_PAGE(
   PAGE_INDEX    TINYINT(1)    NOT NULL,  /* ������������ */
   PAGE_URL      VARCHAR(150)  NOT NULL,  /* ͼƬurl */   
   PAGE_TYPE     VARCHAR(150)  NOT NULL,  /* 0:��ҳ 1:����ҳ 2.��Ѷ���а� */
   PAGE_EXPLAIN  LONGTEXT,                /* ˵�� */
   PRIMARY KEY (PAGE_INDEX,PAGE_TYPE)
);

/* �����û���Ϣ�� */
CREATE TABLE IF NOT EXISTS FACTORY_USER(
   USER_TOKEN   VARCHAR(50)   NOT NULL,   /* �û�token */
   INTEGRAL     BIGINT(20)    DEFAULT 0,  /* �û����� */
   BROKERAGE    DECIMAL(10,2) DEFAULT 0,  /* �û�ӵ�� */
   PHONE_NUM    VARCHAR(11)   NOT NULL,   /* �û�id(�ֻ���) */
   DEVICE_ID    VARCHAR(50),              /* �豸id */
   AVATAR_URL   VARCHAR(150),             /* ͷ��url */
   TAG          VARCHAR(150),             /* �û����˱�ǩ */
   GEOHASH      VARCHAR(30),              /* ���˾�ΰ�� */
   USER_TYPE    TINYINT(1)    DEFAULT 0,  /* �û����� 0:��ͨ  1:ҵ�� 2.������(��ҵ������) */
   AUTH_TYPE    TINYINT(3)    DEFAULT 0,  /* 0:����  ʹ��2���� */
   VERSION      TINYINT(3)    DEFAULT 0,  /* ���ݰ汾 */
   PRIMARY KEY (USER_TOKEN)
);

/* �����˱� */
CREATE TABLE IF NOT EXISTS BROKER_USER(
   USER_TOKEN     VARCHAR(50)   NOT NULL,   /* �û�token */
   AREA_CODE      VARCHAR(20)   NOT NULL,   /* ������ֱ�� */
   AVATAR_URL     VARCHAR(150),             /* ͷ��url */
   EXPERIENCE     DECIMAL(3,1)  NOT NULL,   /* ������� */
   PUBLISH_COUNT  BIGINT(20)    DEFAULT 0,  /* �ɽ�����(����������) */
   PRIMARY KEY (USER_TOKEN)
);

/* ������Ϣ�� */
CREATE TABLE IF NOT EXISTS INFO_FACTORY(
   FACTORY_ID         INT(11)         NOT NULL,      /* ������Ϣid */
   USER_TOKEN         VARCHAR(50)     NOT NULL,      /* �û�token */
   TITLE              VARCHAR(100)    NOT NULL,      /* �������� */
   SELLING_POINT      LONGTEXT        NOT NULL,      /* �������� */

   AREA_CODE          VARCHAR(20)     NOT NULL,       /* ��ֱ�� */
   ADDRESS            VARCHAR(150)    NOT NULL,       /* ��ֵ�ַ */
   
   TOTAL_AREA         INT(11)         NOT NULL,       /* ��������� */
   OFFICE_AREA        INT(11)         DEFAULT 0,      /* �칫����� */
   DORM_AREA          INT(11)         DEFAULT 0,      /* ������� */
   
   FACTORY_TYPE       TINYINT(1) DEFAULT 0 NOT NULL,  /* �������� 0:��ͨ���� 1:���ʳ��� 2:��Ʒ���� */
   RENT_TYPE_ID       TINYINT(1) DEFAULT 0 NOT NULL,  /* ��������id */
   RENT_MODE_ID       TINYINT(1) DEFAULT 0 NOT NULL,  /* ���۷�ʽid */
   OWNER_TYPE_ID      TINYINT(1) DEFAULT 0 NOT NULL,  /* ҵ������id */
   STRUCT_ID          TINYINT(1) DEFAULT 1 NOT NULL,  /* ¥��ṹid Ĭ�� 1:��׼���� */
   FLOOR_HIGHT        VARCHAR(100),                   /* ¥��߶� */
   PHONE_NUM          VARCHAR(11)          NOT NULL,  /* ��ϵ�绰 */
   CONTACTS           VARCHAR(100)         NOT NULL,  /* ��ϵ�� */
   
   FOREGIFT_ID        TINYINT(1) DEFAULT 0 NOT NULL,  /* Ѻ��id Ĭ�� 0:һѺһ�� */     
   NEWOLD_ID          TINYINT(1) DEFAULT 0 NOT NULL,  /* �¾ɳ̶�id Ĭ�� 0:ȫ�� */   
   IS_UP_SHELVES      TINYINT(1) DEFAULT 0,           /* �Ƿ��ϼ� 0:�¼� 1:�ϼ�(��Чʱ��) */ 
   CANTEEN            TINYINT(1) DEFAULT 0,           /* ʳ�� 0:û�� 1:���� 2:˽�� */
   IS_ELEVATOR        TINYINT(1) DEFAULT 1,           /* �Ƿ��е��� 0:û�� 1:�� */
   IS_FIRE_PROTECTION TINYINT(1) DEFAULT 1,           /* �Ƿ������� 0:û�� 1:�� */
   GREEN_CARD         TINYINT(1) DEFAULT 1,           /* ����֤ 0:�� 1:�� 2:�ɰ� */
   FLOOR_POS_ID       TINYINT(1) DEFAULT 0,           /* ����¥�� Ĭ�� 0:���� */

   ENJOY              INT(11)   DEFAULT 0  NOT NULL,  /* ������� ��Ϊ��λ */
   PRICE              INT(11)   DEFAULT 0  NOT NULL,  /* ������� ��Ϊ��λ */
   DISTRIBUTION       INT(11)   NOT NULL,             /* ����� */

   THUMBNAILS         VARCHAR(150),                   /* ����ͼ����Ӧ��ϢͼƬ�� ���Ÿ��� ��: 1,2,3 */
   TAGS               VARCHAR(150),                   /* ���Ա�ǩ��Ӧ��ǩ�� ���Ÿ��� ��: 1,4,5 */
   FACILITIES         VARCHAR(150),                   /* ������ʩ��Ӧ��ʩ�� ���Ÿ��� ��: 1,4, */
   TRADES             VARCHAR(150),                   /* ������ҵ��Ӧ��ҵ�� ���Ÿ��� ��: 1,4, */
   GEOHASH            VARCHAR(30),                    /* ������ΰ�� */
   
   PANORAMA_URL       VARCHAR(150),                   /* ȫ���ܱ���Ƶurl */
   FACTORY_CODE       VARCHAR(30),                    /* ������� */

   BROWSE_COUNT       INT(10)       DEFAULT 0,        /* ������� */
   CREATE_TIME        VARCHAR(14)   NOT NULL,         /* ����ʱ�� */
   UPDATE_DATE        VARCHAR(14),                    /* ����ʱ�� */
   VERSION            TINYINT(3)    DEFAULT 0,        /* ���ݰ汾 */
   PRIMARY KEY (FACTORY_ID)
);

/* ����ͼƬ�� */
CREATE TABLE IF NOT EXISTS PHOTO_FACTORY(
   PHOTO_ID   INT(11)      NOT NULL,  /* ��Ϣ����id */
   PHOTO_URL  VARCHAR(150) NOT NULL,   /* ��ϢͼƬ */
   VERSION    TINYINT(3)   DEFAULT 0,  /* ���ݰ汾 */
   PRIMARY KEY (PHOTO_ID)
);

/* ����ԤԼ */
CREATE TABLE IF NOT EXISTS FACTORY_BOOK(
   USER_TOKEN     VARCHAR(50)   NOT NULL,    /* �û�token */
   BOOK_DAY       TINYINT(3),                /* ��ǰԤԼ���� */
   BOOK_EXPLAIN   LONGTEXT,                  /* Ԥ��˵�� */
   MATCHING       TINYINT(3)    DEFAULT 0,   /* ƥ���� 0:ƥ���� 1:ƥ����� 2:ƥ��ʧ�� */
   PHONE_NUM      VARCHAR(11)   NOT NULL,    /* ��ϵ�绰 */
   CONTACTS       VARCHAR(100)  NOT NULL,    /* ��ϵ�� */
   CREATE_TIME    VARCHAR(14)   NOT NULL,    /* ����ʱ�� */
   VERSION        TINYINT(3)    DEFAULT 0,   /* ���ݰ汾 */
   PRIMARY KEY (USER_TOKEN,CREATE_TIME)
);

/* ������Ϣ��¼�� */
CREATE TABLE IF NOT EXISTS FACTORY_RECORD(
   USER_TOKEN   VARCHAR(50) NOT NULL,    /* �û�token */
   RECORD_ID    INT(11)     NOT NULL,    /* ��¼id(������������Ϣ��) */
   RECORD_TYPE  TINYINT(1)  DEFAULT 0,   /* ������¼���� 0:�����ղ�  1:������ʷ 2:�ⷿ�ղ� 3:������� */
   CREATE_TIME  VARCHAR(14) NOT NULL,    /* ����ʱ�� */
   PRIMARY KEY (USER_TOKEN,RECORD_TYPE,RECORD_ID)
);

/* ��Ѷ����� */
CREATE TABLE IF NOT EXISTS INFORMATION_MARKET(
   TITLE        VARCHAR(150)  NOT NULL,   /* ���� */
   TITLE_URL    VARCHAR(150),             /* ����ͼƬurl */
   CLICK_URL    VARCHAR(150),             /* �����ת��url */
   BROWSE_COUNT INT(11)       DEFAULT 0,  /* ������� */
   CREATE_TIME  VARCHAR(14)   NOT NULL,   /* ����ʱ�� */
   CONTENT      LONGTEXT,                 /* ���ݿ���html */
   PRIMARY KEY (CREATE_TIME)
);

/* ��Ѷ fm url �� */
CREATE TABLE IF NOT EXISTS INFORMATION_FM(
   FM_INDEX         TINYINT(1)    NOT NULL,  /* ������������ */
   FM_SOUND_URL     VARCHAR(150)  NOT NULL,  /* fm url */
   FM_PICS_URL      VARCHAR(150)  NOT NULL,  /* ͼƬurl */   
   CITY_CODE        VARCHAR(20)   NOT NULL,  /* ���б�� */
   FM_EXPLAIN       LONGTEXT ,               /* ˵�� */
   PRIMARY KEY (CITY_CODE)
);

/* ��ѶFM�ղر� */
CREATE TABLE IF NOT EXISTS INFORMATION_FM_COLLECT(
   USER_TOKEN    VARCHAR(50)   NOT NULL,   /* �û�token */
   CITY_CODE     VARCHAR(20)   NOT NULL,  /* ���б�� */
   CREATE_TIME   VARCHAR(14)   NOT NULL,  /* �ղ�ʱ�� */
   PRIMARY KEY (USER_TOKEN,CITY_CODE)
);

/* ��̬ͼƬ�� */
CREATE TABLE IF NOT EXISTS PHOTO_DYNAMIC(
   PHOTO_ID   INT(11)      NOT NULL,   /* ��Ϣ����id */
   PHOTO_URL  VARCHAR(150) NOT NULL,   /* ��ϢͼƬ */
   VERSION    TINYINT(3)   DEFAULT 0,  /* ���ݰ汾 */
   PRIMARY KEY (PHOTO_ID)
);

/* �¾ɳ���� */
CREATE TABLE NEWOLD_DEGREE(
   DEGREE_ID    TINYINT(1)  NOT NULL,   /* �̶�id */
   DEGREE_NAME  VARCHAR(50) NOT NULL,   /* �¾����� */
   PRIMARY KEY (DEGREE_ID)
);

/* Ѻ������ �� */
CREATE TABLE FOREGIFT_TYPE(
   FOREGIFT_ID      TINYINT(1)  NOT NULL,   /* Ѻ������id */
   FOREGIFT_NAME    VARCHAR(50) NOT NULL,   /* Ѻ������˵�� */
   PRIMARY KEY (FOREGIFT_ID)
);

/* �ٱ�˵���� */
CREATE TABLE REPORT_EXPLAIN(
   EXPLAIN_INDEX  TINYINT(1)   NOT NULL,  /* ˵������ */
   EXPLAIN_TEXT   VARCHAR(100) NOT NULL,  /* ˵�� */
   PRIMARY KEY (EXPLAIN_INDEX)
);

/* �ֻ�����ǰ׺�� */
CREATE TABLE PHONE_PREFIX(
   PREFIX_CODE     VARCHAR(3)  NOT NULL,  /* �ֻ���ǰ׺*/
   PRIMARY KEY (PREFIX_CODE)
);

DELETE FROM APP_PARAMETER;
DELETE FROM RENT_TYPE;
DELETE FROM OWNER_TYPE;
DELETE FROM SUPPORTING_FACILITIES;
DELETE FROM FLOOR_POS;
DELETE FROM FLOOR_STRUCT;
DELETE FROM OWNERSHIP;
DELETE FROM FACTORY_BRANCH;
DELETE FROM PURPOSE;
DELETE FROM ATTRIBUTE_TAG;
DELETE FROM HOUSE_TYPE;
DELETE FROM FITMENT_TYPE;
DELETE FROM TOILET_TYPE;
DELETE FROM SEARCH;
DELETE FROM INFORMATION_FUNCTION;
DELETE FROM RENT_MODE;
DELETE FROM NEWOLD_DEGREE;
DELETE FROM APPLY_TRADE;
DELETE FROM FOREGIFT_TYPE;
DELETE FROM REPORT_EXPLAIN;
DELETE FROM SEARCH;
DELETE FROM PHONE_PREFIX;

INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_MAX_PAGE',           '5',            '���ͼƬ��ʾ����');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACILITIES_MAX_NUM',         '4',            '������ʩ�����');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('TAG_MAX_NUM',                '10',           '��ǩ�����');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('TRADE_MAX_NUM',              '10',           '��Ӧ��ҵ�����');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_VALID_TIME',         '15',           '������Ϣ��Чʱ��(��)');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_BOOK_MAX_TIME',      '180',          '�������Ԥ��ʱ��(��)');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_BOOK_MAX_TEXT',      '400',          '�������Ԥ���������');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('GEOGRAPHY_MAX_RANGE',        '1',            '����λ�����뾶(km)');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('AGREEMENT',                  'http://',      'ʹ��Э��');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_INFO_MAX_NUM',       '10',           'һ��ȡ���������������');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_MASTERWORK_MAX_NUM', '5',            'һ��ȡ��Ʒ���������������');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_SAVANT_MAX_NUM',     '5',            'һ��ȡ�ֵ��������');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('BROKER_MAX_NUM',             '3',            '������������ʾ�����');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('BROKER_USER_MAX_NUM',        '10',           '�ֵ꾭������ʾ�����');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('USER_PWD_NUM',               '6',            '�û����볤��');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('TOKEN_VALID_TIMR',           '7',            '�û�token��Чʱ��(��)');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('LIMIT_STRING',         'Pz48JyI6e30sXC9bXQ==','����ʹ�õ��ַ�base64,��Ϊjosn����ֱ�Ӷ�ȡ');

/* ��֤����� */
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('VERIFY_VALID_TIME',         '2',               '������֤���ʱ�䳤(����)');
INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('USER_DEFAULT_PWD',          '123456',          'Ĭ������');


/* �ֻ�����ǰ׺ */
INSERT INTO PHONE_PREFIX (PREFIX_CODE) VALUES ('130'),('131'),('132'),('133'),('134'),('135'),('136'),('137'),('138'),('139'),('150'),('151'),('152'),('153'),
                                              ('156'),('158'),('159'),('170'),('175'),('176'),('177'),('178'),('183'),('182'),('185'),('186'),('188'),('189');



/* ===================  �����Ѷ��� ==================== */
/* ���ⷽʽ�� */
INSERT INTO RENT_TYPE (RENT_TYPE_ID,RENT_TYPE_NAME) VALUES ('0','����');
INSERT INTO RENT_TYPE (RENT_TYPE_ID,RENT_TYPE_NAME) VALUES ('1','����');

/* ���۷�ʽ */
INSERT INTO RENT_MODE (RENT_MODE_ID,RENT_MODE_NAME) VALUES ('0','����');
INSERT INTO RENT_MODE (RENT_MODE_ID,RENT_MODE_NAME) VALUES ('1','����');
INSERT INTO RENT_MODE (RENT_MODE_ID,RENT_MODE_NAME) VALUES ('2','�������');

/* ����ҵ������ */
INSERT INTO OWNER_TYPE (OWNER_TYPE_ID,OWNER_TYPE_NAME) VALUES ('0','ҵ��');
INSERT INTO OWNER_TYPE (OWNER_TYPE_ID,OWNER_TYPE_NAME) VALUES ('1','��ί��');
INSERT INTO OWNER_TYPE (OWNER_TYPE_ID,OWNER_TYPE_NAME) VALUES ('2','������');
INSERT INTO OWNER_TYPE (OWNER_TYPE_ID,OWNER_TYPE_NAME) VALUES ('3','������');
INSERT INTO OWNER_TYPE (OWNER_TYPE_ID,OWNER_TYPE_NAME) VALUES ('4','������');
INSERT INTO OWNER_TYPE (OWNER_TYPE_ID,OWNER_TYPE_NAME) VALUES ('5','������');

/* ������ʩ */
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('0','0','����');
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('1','0','ͣ����');
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('2','0','����');
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('3','0','ͼ���');
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('4','0','��������');
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('5','0','����');
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('6','0','��Ա�����');
INSERT INTO SUPPORTING_FACILITIES (FACILITIES_ID,FACILITIES_TYPE,FACILITIES_NAME) VALUES ('7','0','������');

/* ����¥�� */
INSERT INTO FLOOR_POS (POS_ID,POS_ID_NAME) VALUES ('0','����');
INSERT INTO FLOOR_POS (POS_ID,POS_ID_NAME) VALUES ('1','һ¥');
INSERT INTO FLOOR_POS (POS_ID,POS_ID_NAME) VALUES ('2','��¥����');
INSERT INTO FLOOR_POS (POS_ID,POS_ID_NAME) VALUES ('3','����');
INSERT INTO FLOOR_POS (POS_ID,POS_ID_NAME) VALUES ('4','��Ժ');

/* ¥��ṹ�� */
INSERT INTO FLOOR_STRUCT (STRUCT_ID,STRUCT_ID_NAME) VALUES ('0','����');
INSERT INTO FLOOR_STRUCT (STRUCT_ID,STRUCT_ID_NAME) VALUES ('1','��׼����');
INSERT INTO FLOOR_STRUCT (STRUCT_ID,STRUCT_ID_NAME) VALUES ('2','���׳���');
INSERT INTO FLOOR_STRUCT (STRUCT_ID,STRUCT_ID_NAME) VALUES ('3','�ֽṹ');

/* ����Ȩ���� */
INSERT INTO OWNERSHIP (OWNERSHIP_ID,OWNERSHIP_NAME) VALUES ('0','����');
INSERT INTO OWNERSHIP (OWNERSHIP_ID,OWNERSHIP_NAME) VALUES ('1','����');

/* ��; */
INSERT INTO PURPOSE (PURPOSE_ID,PURPOSE_NAME) VALUES ('0','סլ�õ�');
INSERT INTO PURPOSE (PURPOSE_ID,PURPOSE_NAME) VALUES ('1','��ҵ�õ�');

/* ���Ա�ǩ */
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('0', '0','С���');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('1', '0','�����');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('2', '0','¥���');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('3', '0','��Ժ');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('4', '0','������');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('5', '0','��װ��');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('6', '0','���칫');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('7', '0','ԭ����');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('8', '0','һ¥');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('9', '0','������');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('10', '0','�½���');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('11', '0','��׼��');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('12', '0','�ֹ���');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('13', '0','λ�ú�');
INSERT INTO ATTRIBUTE_TAG (TAG_ID,TAG_TYPE,TAG_NAME) VALUES ('14', '0','�ͼ�');

/* װ������ */
INSERT INTO FITMENT_TYPE (FITMENT_TYPE_ID,FITMENT_TYPE_NAME) VALUES ('0','��װ��');
INSERT INTO FITMENT_TYPE (FITMENT_TYPE_ID,FITMENT_TYPE_NAME) VALUES ('1','��װ��');

/* ���������� */
INSERT INTO TOILET_TYPE (TOILET_TYPE_ID,TOILET_TYPE_NAME) VALUES ('0','����');
INSERT INTO TOILET_TYPE (TOILET_TYPE_ID,TOILET_TYPE_NAME) VALUES ('1','����');

/* ��Ѷ���ܱ� */
INSERT INTO INFORMATION_FUNCTION (FUN_INDEX,FUN_EXPLAIN) VALUES ('0','FM');
INSERT INTO INFORMATION_FUNCTION (FUN_INDEX,FUN_EXPLAIN) VALUES ('1','�Ƽ�');
INSERT INTO INFORMATION_FUNCTION (FUN_INDEX,FUN_EXPLAIN) VALUES ('2','����');
INSERT INTO INFORMATION_FUNCTION (FUN_INDEX,FUN_EXPLAIN) VALUES ('3','���а�');
INSERT INTO INFORMATION_FUNCTION (FUN_INDEX,FUN_EXPLAIN) VALUES ('4','С��Ƶ');
INSERT INTO INFORMATION_FUNCTION (FUN_INDEX,FUN_EXPLAIN) VALUES ('5','����');

/* ���������� */
INSERT INTO SEARCH (SEARCH_COME,SEARCH_TYPE,SEARCH_TYPE_NAME,JUDGE_TYPE,JUDGE_FIELD) VALUES ('0','1','���','1','TOTAL_AREA');
INSERT INTO SEARCH (SEARCH_COME,SEARCH_TYPE,SEARCH_TYPE_NAME,JUDGE_TYPE,JUDGE_FIELD) VALUES ('0','2','���','1','PRICE');
INSERT INTO SEARCH (SEARCH_COME,SEARCH_TYPE,SEARCH_TYPE_NAME,JUDGE_TYPE,JUDGE_FIELD) VALUES ('0','3','¥��','2','FLOOR_POS_ID');
INSERT INTO SEARCH (SEARCH_COME,SEARCH_TYPE,SEARCH_TYPE_NAME,JUDGE_TYPE,JUDGE_FIELD) VALUES ('0','4','�ṹ','2','STRUCT_ID');
INSERT INTO SEARCH (SEARCH_COME,SEARCH_TYPE,SEARCH_TYPE_NAME,JUDGE_TYPE,JUDGE_FIELD) VALUES ('0','5','��ǩ','3','TAGS');
INSERT INTO SEARCH (SEARCH_COME,SEARCH_TYPE,SEARCH_TYPE_NAME,JUDGE_TYPE,JUDGE_FIELD) VALUES ('0','6','����','4','AREA_CODE');
INSERT INTO SEARCH (SEARCH_COME,SEARCH_TYPE,SEARCH_TYPE_NAME,JUDGE_TYPE,JUDGE_FIELD) VALUES ('0','8','��ʩ','3','FACILITIES');

/* �¾ɳ��� */
INSERT INTO NEWOLD_DEGREE (DEGREE_ID,DEGREE_NAME) VALUES ('1','ȫ��');
INSERT INTO NEWOLD_DEGREE (DEGREE_ID,DEGREE_NAME) VALUES ('2','�ų���');
INSERT INTO NEWOLD_DEGREE (DEGREE_ID,DEGREE_NAME) VALUES ('3','�˳���');
INSERT INTO NEWOLD_DEGREE (DEGREE_ID,DEGREE_NAME) VALUES ('4','�߳���');
INSERT INTO NEWOLD_DEGREE (DEGREE_ID,DEGREE_NAME) VALUES ('5','������');

/* ������ҵ */
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('0','����');
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('1','ҽҩ����');
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('2','��е����');
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('3','�ṤʳƷ');
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('4','��װ��֯');
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('5','�칫�Ľ�');
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('6','���ӵ繤');
INSERT INTO APPLY_TRADE (TRADE_ID,TRADE_NAME) VALUES ('7','�Ҿ���Ʒ');

/* Ѻ������ */
INSERT INTO FOREGIFT_TYPE (FOREGIFT_ID,FOREGIFT_NAME) VALUES ('1','һѺһ��');
INSERT INTO FOREGIFT_TYPE (FOREGIFT_ID,FOREGIFT_NAME) VALUES ('2','��Ѻһ��');
INSERT INTO FOREGIFT_TYPE (FOREGIFT_ID,FOREGIFT_NAME) VALUES ('3','��Ѻһ��');
INSERT INTO FOREGIFT_TYPE (FOREGIFT_ID,FOREGIFT_NAME) VALUES ('4','�׽�����');
INSERT INTO FOREGIFT_TYPE (FOREGIFT_ID,FOREGIFT_NAME) VALUES ('5','�׽�һ��');

/* �ٱ� */
INSERT INTO REPORT_EXPLAIN (EXPLAIN_INDEX,EXPLAIN_TEXT) VALUES ('0','����');
INSERT INTO REPORT_EXPLAIN (EXPLAIN_INDEX,EXPLAIN_TEXT) VALUES ('1','����λ������');
INSERT INTO REPORT_EXPLAIN (EXPLAIN_INDEX,EXPLAIN_TEXT) VALUES ('2','��Դ�۸񲻷�');
INSERT INTO REPORT_EXPLAIN (EXPLAIN_INDEX,EXPLAIN_TEXT) VALUES ('3','�����˵绰����');
INSERT INTO REPORT_EXPLAIN (EXPLAIN_INDEX,EXPLAIN_TEXT) VALUES ('4','ͼƬ���������');

/* ������ */
INSERT INTO HOUSE_TYPE (HOUSE_TYPE_ID,HOUSE_TYPE_NAME) VALUES ('0','2��2��1��');
INSERT INTO HOUSE_TYPE (HOUSE_TYPE_ID,HOUSE_TYPE_NAME) VALUES ('1','2��1��');