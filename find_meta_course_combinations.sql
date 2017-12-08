
SELECT --TOP 100
        ct.content_id
       ,ct.content_title
       ,ct.content_status
       ,mt.meta_name
       ,cmt.meta_value
--       ,ct.private
--       ,ct.published
--       ,cmt.meta_type_id
--       ,fr.FolderPath
FROM      content            AS ct
LEFT JOIN content_folder_tbl AS fr
ON        ct.folder_id        = fr.folder_id
LEFT JOIN content_meta_tbl   AS cmt
ON        ct.content_id       = cmt.content_id
LEFT JOIN metadata_type      AS mt
ON        cmt.meta_type_id    = mt.meta_type_id

WHERE        
        fr.parent_id IN (
                SELECT folder_id
                FROM   content_folder_tbl AS fr
                WHERE  fr.FolderPath      LIKE ('Studying at Brookes/courses/Undergraduate/0/')
                )
AND
        ct.content_title NOT LIKE '%DO NOT SET LIVE%'
AND
        ct.content_title NOT LIKE '%CLONE%'

AND     cmt.meta_type_id IN    (139,141,142,143,144,145,146,147,155,157,159,
                                2147483665,2147483667,2147483668,2147483669,
                                2147483670,6442450943)
ORDER BY
        ct.content_title
       ,cmt.meta_type_id
;
