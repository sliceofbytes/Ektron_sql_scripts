/* All Course Combination Meta Fields */
SELECT --TOP 50
        ct.content_id
       ,cmt.meta_type_id
       ,cmt.meta_value
       ,mt.meta_name
       ,ct.content_title
       ,ct.content_type
       ,ct.content_subtype
       ,ct.content_status
--        ,*
FROM
		content_meta_tbl AS cmt,
		content          AS ct,
        metadata_type    AS mt,
        content_folder_tbl AS fr
--        ,custom_field_folder_tbl AS cff
WHERE   cmt.content_id   = ct.content_id
AND     cmt.meta_type_id = mt.meta_type_id
AND     ct.folder_id     = fr.folder_id
--AND     cff.folder_id = fr.folder_id
/*
AND
		cmt.meta_type_id IN (
			SELECT meta_type_id
			FROM   metadata_type
			WHERE meta_name LIKE '%combination%'
		)
*/
--AND     ct.xml_config_id IN (7)
AND	fr.FolderPath LIKE ('Studying at Brookes/courses/%/0/Biological Anthropology/%')
--AND     ct.content_title = 'Biological Anthropology'
--AND
--        ct.content_id = 
ORDER BY
        meta_value,meta_name,ct.content_id
;
SELECT 
        cff.*,cf.FolderPath,cf.FolderIdPath
FROM
        custom_field_folder_tbl AS cff,
        content_folder_tbl      AS cf
WHERE   cff.folder_id = cf.folder_id
AND	cf.FolderPath LIKE ('Studying at Brookes/courses/%')--%/0/Biological Anthropology/%')
;
select * from metadata_type
where meta_name like '%accred%'
-- where meta_type_id = 2147483649;
/*
select top 5 * from custom_field_folder_tbl;
select * from xml_collection_tbl;
select distinct form_field_name from form_data_tbl order by form_field_name;
select distinct meta_name from content_meta_tbl AS cmt, metadata_type AS mt
where cmt.meta_type_id = mt.meta_type_id order by meta_name;
select * from content where
 content_html like '%accreditation%'
or
 content_html like '%aztitle3%'
 */
/* Filtered Course Combination meta fields by folder */
/*SELECT --TOP 50
        ct.content_id
       ,cmt.meta_type_id
       ,cmt.meta_value
       ,mt.meta_name
       ,ct.content_title
       ,fr.FolderPath
       ,ct.content_type
       ,ct.content_subtype
       ,ct.content_status
--        ,*
FROM
		content_meta_tbl   AS cmt,
		content            AS ct,
        metadata_type      AS mt,
        content_folder_tbl AS fr
WHERE   cmt.content_id     = ct.content_id
AND     cmt.meta_type_id   = mt.meta_type_id
AND     ct.folder_id       = fr.folder_id
AND
		cmt.meta_type_id IN (141)--,2147483667)
AND
        ct.content_id > 100000
AND
        fr.FolderPath LIKE ('Studying at Brookes/courses/%/0/%/')
AND
        cmt.meta_value != 'false'
AND
        ct.xml_config_id IN (7)  -- this prevents inclusion of fieldsets. Fieldsets are id 6
--AND
--        fr.folder_name != 'Fieldsets'
ORDER BY
        ct.content_title, mt.meta_name
;*/