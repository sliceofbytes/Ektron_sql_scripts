/* list users sorted by last login date */

SELECT-- TOP 5
     u.user_id
    ,u.user_name
    ,u.first_name + ' ' + u.last_name AS name
    ,u.email_address1 as email
--    ,user_deleted
--    ,user_domain
--    ,auth_guid
    ,u.last_login_date
--    ,last_password_change
--*
    ,u.date_created
FROM
    dbo.users AS u
WHERE
    email_address1 != ''
AND
    user_domain    != ''
AND
    user_deleted   != 1
ORDER BY
    last_login_date DESC
;