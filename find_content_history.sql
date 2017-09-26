/* show history for content item(s) */

--USE <database name>;

SELECT --TOP 15 
--        history_id
--        ,content_id
--        content_title
        content_html
FROM
        dbo.content_history
WHERE   content_id = 
AND     content_status = 'A'
ORDER BY
        date_modified DESC
;