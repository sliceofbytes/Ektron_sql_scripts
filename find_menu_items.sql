SELECT
            mt.parent_id
           ,mt.mnu_id
           ,mt.mnu_name
           ,mt.mnu_link
FROM
            dbo.menu_tbl AS mt
WHERE
--AND          mt.mnu_link LIKE '%%'
            mt.mnu_name LIKE '%%'
--AND          mt.parent_id IN (0,)
--AND          mt.mnu_id = 0
--AND         (mt.ancestor_id = 0 OR mt.parent_id = 0 OR mt.mnu_id = 0)
ORDER BY mt.parent_id, mt.mnu_name
;

/*
SELECT DISTINCT '/' + LOWER(mnu_link) AS TARGET
FROM   dbo.menu_tbl
ORDER BY TARGET
;
*/