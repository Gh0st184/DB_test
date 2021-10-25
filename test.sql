SELECT SUM(ll.likes_count)
FROM (
    SELECT COUNT(p.`user_id`) likes_count
    FROM `likes` l,
        `profiles` p
    WHERE
        l.`target_type_id` = (SELECT id FROM target_types WHERE `name` = 'users' LIMIT 1)
        AND l.`desc_id` = p.`user_id`
    GROUP BY p.`user_id`
    ORDER BY p.birthday DESC
    LIMIT 10
) ll
;
