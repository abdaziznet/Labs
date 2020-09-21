
SELECT  *
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
                    CASE WHEN STAT.ERROR > 0 THEN 'Error'
                         WHEN STAT.WARNING > 0 THEN 'Info'
                    END AS MigrationStatus
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
                                M.categoryId
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
                                                  WHERE     userCategory = 2
                                                ) SUBBDS
                                      GROUP BY  MigrationId
                                    ) BDS ON A.migrationId = BDS.migrationId
                    LEFT OUTER JOIN ( SELECT    fpId ,
                                                SUM(ERROR) AS ERROR ,
                                                SUM(WARNING) AS WARNING
                                      FROM      ( SELECT    fpId ,
                                                            ISNULL(( CASE
                                                              WHEN [STATUS] = 1
                                                              THEN 1
                                                              END ), 0) ERROR ,
                                                            ISNULL(( CASE
                                                              WHEN [STATUS] = 2
                                                              OR [STATUS] = 3
                                                              THEN 1
                                                              END ), 0) WARNING
                                                  FROM      dbo.migrationlog
                                                            WITH ( NOLOCK )
                                                  WHERE     [STATUS] <> 0
                                                ) X
                                      GROUP BY  X.fpId
                                    ) STAT ON A.fpId = STAT.fpId
          WHERE     ( STAT.ERROR > 0
                      OR STAT.WARNING > 0
                    )
        ) AS B