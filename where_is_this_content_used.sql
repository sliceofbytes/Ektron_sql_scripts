SELECT
         ct.content_id
        ,pto.page_id
        ,fr.FolderPath         AS content_folder
        ,fr2.FolderPath        AS page_folder
        ,ct.content_title
        ,ct2.content_title     AS page_title
        ,ct.content_status
        ,ct2.content_status    AS page_status
        ,ct.private            AS content_private
        ,ct2.private           AS page_private
        ,ct.last_edit_fname + ' ' + ct.last_edit_lname   AS content_editor
        ,convert(varchar,ct.last_edit_date,103)          AS content_edited
        ,ct2.last_edit_fname + ' ' + ct2.last_edit_lname AS page_editor
        ,convert(varchar,ct2.last_edit_date,103)         AS page_edited
        ,'https://www.brookes.ac.uk/' + lower(clv.AliasLink) AS url_alias
--        ,clv.*
FROM
        dbo.content            AS ct,
        dbo.content_folder_tbl AS fr,
        dbo.page_to_object     AS pto,
        dbo.content            AS ct2,
        dbo.content_folder_tbl AS fr2,
        dbo.ContentListView    AS clv
WHERE ct.folder_id         = fr.folder_id
AND   ct.content_id        = pto.object_id
AND   pto.page_id          = ct2.content_id
AND   ct2.folder_id        = fr2.folder_id
AND   pto.page_id        = clv.content_id
AND   fr.FolderPath     LIKE '%%'
--AND   ct.content_title like '%%'
--AND   ct.content_status = ''
--AND   ct.content_id in ()
ORDER BY
        page_folder, page_title
;