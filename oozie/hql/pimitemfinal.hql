Create TABLE item_data_lib.reltemp(products string) STORED AS TEXTFILE;
LOAD DATA lOCAL INPATH '/home_dir/svidl01s/multi_item/DEPT_249_CLEANED_2.xml' OVERWRITE INTO TABLE item_data_lib.reltemp;

CREATE TABLE item_data_lib.relationshipfinal (key string,p1 string,p2 string,p3 string, p4 string ,p5 string,p6 string,p7 string,p8 string,p9 string) STORED AS TEXTFILE;

INSERT INTO TABLE item_data_lib.relationshipfinal SELECT
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Name/text()'),
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="ITEM_DESC_GEN_T"]/text()'),
"DEFAULT_BARCODE",
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="ITEM_TYPE_I"]/text()'),
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="MDSE_DEPT_I"]/text()'),
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="MDSE_CLAS_I"]/text()'),
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="MDSE_SBCL_I"]/text()'),
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="MDSE_STYL_I"]/text()'),
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="BRND_I"]/@ID'),
xpath_string(products, '/Products/Product[@UserTypeID="IMNUniqueItem"]/Values/Value[@AttributeID="PRIM_VEND_I"]/text()')
FROM item_data_lib.reltemp;
