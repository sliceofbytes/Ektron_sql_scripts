SELECT --TOP 3
     c.content_id      AS c__id
--    ,ce.content_id     AS ce_id
    ,c.content_status  AS c__status
    ,ce.content_status AS ce_status
    ,c.content_title   AS c__title
--    ,ce.content_title  AS ce_title
    ,cf.FolderPath
    ,cf.FolderIdPath
    ,c.last_edit_lname  + ', ' + c.last_edit_fname  AS editor
    ,ce.last_edit_lname + ', ' + ce.last_edit_fname AS editor_ce
    ,c.last_edit_date
    ,ce.last_edit_date
    ,c.last_edit_date - ce.last_edit_date           AS edit_diff
    ,c.content_type
    ,c.content_subtype
    --,*
FROM
    content AS c
LEFT JOIN
    content_edit AS ce
ON
    c.content_id = ce.content_id
LEFT JOIN
    content_folder_tbl AS cf
ON
    c.folder_id = cf.folder_id
WHERE
    c.content_status != ce.content_status

--AND ce.content_id IS NULL
--AND c.content_id IN ()
--AND cf.FolderPath NOT LIKE '%%'
--AND ce.last_edit_lname + ', ' + ce.last_edit_fname IN ()
--AND (c.content_status = '' OR ce.content_status = '')

ORDER BY
    cf.FolderPath,
    c.content_id
;