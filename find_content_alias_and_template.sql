SELECT TOP 100
    'https://www.brookes.ac.uk/' + lower(clv.AliasLink) AS url_alias,
    clv.content_id,
    clv.content_title,
    clv.Path,
    clv.template_id,
    tt.template_filename,
    tt.template_name,
    clv.content_type,
    clv.content_subtype,
    clv.private,
    clv.IsArchived,
    clv.published

FROM ContentListView AS clv, templates_tbl AS tt
WHERE clv.template_id = tt.template_id
AND AliasLink != ''
AND clv.private != 1
AND clv.IsArchived != 1
AND clv.published = 1
;