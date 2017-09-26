/* show content id, title, status, path
   optionally filtered by status and title*/

--USE <database name>;

SELECT ct.content_id
      ,ct.content_title AS title
      ,ct.content_status AS status
--      ,ct.folder_id
--      ,ct.content_type
--      ,ct.content_subtype
--      ,fr.folder_name
--      ,fr.inherit_alias_from
      ,fr.FolderPath, fr.folder_id
      ,ct.content_html
--      ,ct.last_edit_date
--      ,ct.last_edit_lname + ', ' + ct.last_edit_fname as edited_by
--      ,*
FROM
		dbo.content AS ct,
		dbo.content_folder_tbl AS fr
WHERE	ct.folder_id = fr.folder_id
--AND	ct.content_status  = 'O'
--AND	ct.content_id      IN ()
--AND	fr.folder_name     LIKE '%%'
--AND	ct.content_html    LIKE '%%'
--AND	fr.FolderPath      LIKE '%%'
--AND	fr.folder_id       LIKE '%%'
--AND	ct.content_title   LIKE '%%'
--AND ct.xml_config_id    = 10
--AND	ct.last_edit_lname LIKE '%%'
ORDER BY
		fr.FolderPath
		,fr.folder_name
		,ct.content_title
		,ct.last_edit_date DESC
;