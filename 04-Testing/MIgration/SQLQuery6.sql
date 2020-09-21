SELECT  Nip ,
        name ,
        groupId ,
        quality ,
        subType ,
        userCategory ,
        userFAR
FROM    ( SELECT    A.migrationId ,
                    A.fpId ,
                    A.Nip ,
                    A.name ,
                    A.[Status] ,
                    A.[Group] ,
                    A.[GroupId] ,
                    categoryId ,
                    BDS.bdsId1 ,
                    BDS.bdsId2 ,
                    '' AS MigrationStatus ,
                    quality ,
                    subType ,
                    userCategory ,
                    userFAR
          FROM      ( SELECT    M.migrationId ,
                                M.fpId ,
                                MD.userName AS Nip ,
                                M.name ,
                                CASE WHEN MD.userType = 2 THEN 'Tetap'
                                     WHEN MD.userType = 3 THEN 'Bakti'
                                     WHEN MD.userType = 4 THEN 'Alih Daya'
                                END AS [Status] ,
                                CASE WHEN M.groupId = 1 THEN 'User'
                                     WHEN M.groupId = 2 THEN 'Enroller'
                                     WHEN M.groupId = 3 THEN 'Reporter'
                                     WHEN M.groupId = 4 THEN 'Manager'
                                END AS [Group] ,
                                M.groupId ,
                                M.categoryId ,
                                quality ,
                                subType ,
                                userCategory ,
                                userFAR ,
                                userType
                      FROM      migration AS M WITH ( NOLOCK )
                                INNER JOIN migrationdetail AS MD WITH ( NOLOCK ) ON M.migrationId = MD.migrationId
                      WHERE     M.IsDelete = 0
                                AND MD.userCategory = 1
                    ) A
                    LEFT OUTER JOIN ( SELECT    MigrationId ,
                                                ISNULL(MAX(CASE
                                                              WHEN RowNum = 1
                                                              THEN userName
                                                           END), '') bdsId1 ,
                                                ISNULL(MAX(CASE
                                                              WHEN RowNum = 2
                                                              THEN userName
                                                           END), '') bdsId2
                                      FROM      ( SELECT    ROW_NUMBER() OVER ( PARTITION BY migrationId ORDER BY migrationId ) AS RowNum ,
                                                            migrationId ,
                                                            a.userName
                                                  FROM      migrationdetail a
                                                            WITH ( NOLOCK )
                                                  WHERE     userCategory = 2
                                                ) SUBBDS
                                      GROUP BY  MigrationId
                                    ) BDS ON A.migrationId = BDS.migrationId
        ) AS A