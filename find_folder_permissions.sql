SELECT   fr.FolderPath
		,groups.usergroup_name
		,groups.usercount
		,perms.read_only_pvlg
		,perms.add_pvlg
        ,perms.edit_pvlg
        ,perms.delete_pvlg
FROM
		dbo.permissions_tbl    AS perms,
		dbo.UserGroupList      AS groups,
		dbo.content_folder_tbl AS fr
WHERE   perms.usergroup_id = groups.usergroup_id
AND		perms.folder_id = fr.folder_id

AND perms.folder_id = 
AND perms.edit_pvlg = 1
;
