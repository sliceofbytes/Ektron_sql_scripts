
SELECT --TOP 100
        ct.content_id
--       ,ct.private
--       ,ct.published
       ,mt.meta_name
--       ,cmt.meta_type_id
       ,cmt.meta_value
       ,ct.content_title
       ,ct.content_status
       ,fr.FolderPath
FROM
content                      AS ct
LEFT JOIN content_folder_tbl AS fr
ON ct.folder_id               = fr.folder_id
LEFT JOIN content_meta_tbl   AS cmt
ON ct.content_id              = cmt.content_id
LEFT JOIN metadata_type      AS mt
ON cmt.meta_type_id           = mt.meta_type_id

WHERE        
        fr.parent_id IN (
                SELECT folder_id
                FROM content_folder_tbl AS fr
                WHERE fr.FolderPath LIKE ('Studying at Brookes/courses/Undergraduate/0/')
                )
AND
        ct.content_title NOT LIKE '%DO NOT SET LIVE%'
AND
        ct.content_title NOT LIKE '%CLONE%'

AND     cmt.meta_type_id IN    ()
ORDER BY
        ct.content_title
       ,cmt.meta_type_id
;
