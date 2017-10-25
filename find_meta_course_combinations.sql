
SELECT --TOP 100
        ct.content_id
       ,cmt.meta_type_id
       ,cmt.meta_value
       ,mt.meta_name
       ,ct.content_title
       ,ct.content_status
       ,fr.FolderPath
--       ,*
FROM
	content_meta_tbl   AS cmt,
	content            AS ct,
        metadata_type      AS mt,
        content_folder_tbl AS fr
WHERE   cmt.content_id      = ct.content_id
AND     cmt.meta_type_id    = mt.meta_type_id
and    ct.folder_id         = fr.folder_id
AND
		cmt.meta_type_id IN (
			SELECT meta_type_id
			FROM   metadata_type
			WHERE meta_name LIKE '%combination%'
		)
AND
        ct.content_id IN (
                SELECT content_id
                FROM content_meta_tbl AS cmt2
                WHERE cmt2.meta_type_id = 141
                AND meta_value = 'true'
                )
AND
		fr.parent_id IN (
                        SELECT folder_id
                        FROM content_folder_tbl AS fr
                        WHERE fr.FolderPath LIKE ('Studying at Brookes/courses/%/0/')
                        )
ORDER BY
        fr.FolderPath
       ,ct.content_title
       ,mt.meta_name
;
