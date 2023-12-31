USE [MUCOBADI]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICAREPivot'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICAREPivot'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICARE'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICARE'
GO
/****** Object:  View [dbo].[View_DashboardBeneficiariesonICAREPivot]    Script Date: 16/08/2023 12:06:06 ******/
DROP VIEW [dbo].[View_DashboardBeneficiariesonICAREPivot]
GO
/****** Object:  View [dbo].[View_DashboardBeneficiariesonICARE]    Script Date: 16/08/2023 12:06:06 ******/
DROP VIEW [dbo].[View_DashboardBeneficiariesonICARE]
GO
/****** Object:  View [dbo].[View_DashboardBeneficiariesonICARE]    Script Date: 16/08/2023 12:06:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DashboardBeneficiariesonICARE]
AS
SELECT COUNT(HouseHoldId) AS TotalNumber, DistrictId, DistrictDescription, KnownRiskFactorId, RiskFactorsDescription, Qtr, VisitationYear
FROM   (SELECT HouseHoldId, ProgramParticipationId, ProgramParticipationDescription, VisitationDate, DATEPART(month, VisitationDate) AS VisitationMonth, CASE WHEN DATEPART(month, VisitationDate) BETWEEN 1 AND 3 THEN 2 WHEN DATEPART(month, VisitationDate) BETWEEN 
                           4 AND 6 THEN 3 WHEN DATEPART(month, VisitationDate) BETWEEN 7 AND 9 THEN 4 WHEN DATEPART(month, VisitationDate) BETWEEN 10 AND 12 THEN 1 ELSE '0' END AS Qtr, DATEPART(year, VisitationDate) AS VisitationYear, HouseHoldCode, DateofIdentification, 
                           IdentificationId, OtherIdentificationSource, Surname, GivenName, GenderId, GenderDescription, DoB, ActualAge, CASE WHEN ActualAge BETWEEN 0 AND 17 THEN '0-17 Years' WHEN ActualAge > 17 THEN '18+ Years' ELSE 'Not Defined' END AS AgeCategory, 
                           CASE WHEN ActualAge < 1 THEN '1 Year' WHEN ActualAge BETWEEN 1 AND 4 THEN '1-4 Years' WHEN ActualAge BETWEEN 5 AND 9 THEN '5-9 Years' WHEN ActualAge BETWEEN 10 AND 14 THEN '10-14 Years' WHEN ActualAge BETWEEN 15 AND 
                           17 THEN '15-17 Years' WHEN ActualAge BETWEEN 18 AND 24 THEN '18-24 Years' WHEN ActualAge > 24 THEN '25+ Years' ELSE 'Not Defined' END AS AgeBands, ParishId, VillageId, HIVStatusId, FacilityId, RegimenCategoryId, RegimenId, DispensingModelId, CurrentlyonART, 
                           Cohort, ARTNumber, Copies, ViralLoadSuppressedId, SourceDocumentId, OtherSourceDocument, SourceDocumentURL, SourceDocumentExt, DateAdded, AddedBy, TelephoneContact, VirallaodDate, OVC_VLR_Id, DistrictId, DistrictDescription, SubcountyId, 
                           SubcountyDescription, KnownRiskFactorId, RiskFactorsDescription, HIVStatusDescription
             FROM    (SELECT dbo.BeneficiaryIdentificationRegister.HouseHoldId, homevisit.ProgramParticipationId, programparticipate.ProgramParticipationDescription, homevisit.VisitationDate, dbo.BeneficiaryIdentificationRegister.HouseHoldCode, 
                                         dbo.BeneficiaryIdentificationRegister.DateofIdentification, dbo.BeneficiaryIdentificationRegister.IdentificationId, dbo.BeneficiaryIdentificationRegister.OtherIdentificationSource, dbo.BeneficiaryIdentificationRegister.Surname, 
                                         dbo.BeneficiaryIdentificationRegister.GivenName, dbo.BeneficiaryIdentificationRegister.GenderId, 
                                         CASE WHEN dbo.BeneficiaryIdentificationRegister.GenderId = 'F' THEN 'Female' WHEN dbo.BeneficiaryIdentificationRegister.GenderId = 'M' THEN 'Male' ELSE 'None' END AS GenderDescription, dbo.BeneficiaryIdentificationRegister.DoB, DATEDIFF(YY, 
                                         dbo.BeneficiaryIdentificationRegister.DoB, GETDATE()) - CASE WHEN DATEADD(YY, DATEDIFF(YY, dbo.BeneficiaryIdentificationRegister.DoB, GETDATE()), dbo.BeneficiaryIdentificationRegister.DoB) > GETDATE() THEN 1 ELSE 0 END AS ActualAge, 
                                         dbo.BeneficiaryIdentificationRegister.ParishId, dbo.BeneficiaryIdentificationRegister.VillageId, ISNULL(dbo.BeneficiaryIdentificationRegister.HIVStatusId, 3) AS HIVStatusId, dbo.BeneficiaryIdentificationRegister.FacilityId, 
                                         dbo.BeneficiaryIdentificationRegister.RegimenCategoryId, dbo.BeneficiaryIdentificationRegister.RegimenId, dbo.BeneficiaryIdentificationRegister.DispensingModelId, dbo.BeneficiaryIdentificationRegister.CurrentlyonART, 
                                         dbo.BeneficiaryIdentificationRegister.Cohort, dbo.BeneficiaryIdentificationRegister.ARTNumber, dbo.BeneficiaryIdentificationRegister.Copies, dbo.BeneficiaryIdentificationRegister.ViralLoadSuppressedId, dbo.BeneficiaryIdentificationRegister.SourceDocumentId, 
                                         dbo.BeneficiaryIdentificationRegister.OtherSourceDocument, dbo.BeneficiaryIdentificationRegister.SourceDocumentURL, dbo.BeneficiaryIdentificationRegister.SourceDocumentExt, dbo.BeneficiaryIdentificationRegister.DateAdded, 
                                         dbo.BeneficiaryIdentificationRegister.AddedBy, dbo.BeneficiaryIdentificationRegister.TelephoneContact, dbo.BeneficiaryIdentificationRegister.VirallaodDate, dbo.BeneficiaryIdentificationRegister.OVC_VLR_Id, dbo.BeneficiaryIdentificationRegister.DistrictId, 
                                         dbo.A_District.DistrictDescription, dbo.BeneficiaryIdentificationRegister.SubcountyId, dbo.A_Subcounty.SubcountyDescription, dbo.BeneficiaryIdentificationRegister.KnownRiskFactorId, dbo.View_DashboardRiskFactorBinding.RiskFactorsDescription, 
                                         ISNULL(dbo.A_HIVStatus.HIVStatusDescription, '3=Unknown HIV Status') AS HIVStatusDescription
                           FROM    dbo.BeneficiaryIdentificationRegister INNER JOIN
                                         dbo.A_District ON dbo.BeneficiaryIdentificationRegister.DistrictId = dbo.A_District.DistrictId INNER JOIN
                                         dbo.A_Subcounty ON dbo.BeneficiaryIdentificationRegister.SubcountyId = dbo.A_Subcounty.SubcountyId LEFT OUTER JOIN
                                         dbo.A_HIVStatus ON dbo.BeneficiaryIdentificationRegister.HIVStatusId = dbo.A_HIVStatus.HIVStatusId LEFT OUTER JOIN
                                         dbo.View_DashboardRiskFactorBinding ON dbo.BeneficiaryIdentificationRegister.KnownRiskFactorId = dbo.View_DashboardRiskFactorBinding.KnownRiskFactorId INNER JOIN
                                         dbo.HomeVisitServiceReportingToolHeader AS homevisit ON dbo.BeneficiaryIdentificationRegister.HouseHoldId = homevisit.HouseHoldId LEFT OUTER JOIN
                                         dbo.A_ProgramParticipationStatus AS programparticipate ON homevisit.ProgramParticipationId = programparticipate.ProgramParticipationId) AS a) AS roar
WHERE (AgeCategory = '0-17 Years') AND (ProgramParticipationId = 1)
GROUP BY DistrictId, DistrictDescription, KnownRiskFactorId, RiskFactorsDescription, Qtr, VisitationYear
GO
/****** Object:  View [dbo].[View_DashboardBeneficiariesonICAREPivot]    Script Date: 16/08/2023 12:06:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_DashboardBeneficiariesonICAREPivot]
AS

SELECT  pvt.DistrictId,
        pvt.[DistrictDescription],
        pvt.[Qtr],
        pvt.[VisitationYear],
		isnull(pvt.[Adolescent Mother], 0) AS AdolescentMother, isnull(pvt.[C/ALHIV], 0) AS CALHIV, isnull(pvt.[Child of FSW], 0) AS ChildofFSW, isnull(pvt.[FSW], 0) AS FSW, isnull(pvt.[HEI], 0) AS HEI, 
             isnull(pvt.[Living in HH with Adolescent Mother], 0) AS LivinginHHwithAdolescentMother, isnull(pvt.[Living in HH with FSW], 0) AS LivinginHHwithFSW, isnull(pvt.[Living in HH with HEI], 0) AS LivinginHHwithHEI, isnull(pvt.[Living in HH with PLHIV], 0) AS LivinginHHwithPLHIV, 
             isnull(pvt.[Living in HH with SVAC], 0) AS LivinginHHwithSVAC, isnull(pvt.[Other], 0) AS Other, isnull(pvt.[PLHIV], 0) AS PLHIV, isnull(pvt.[SVAC], 0) AS SVAC

        --pvt.[Overheads]
FROM    (   SELECT  DistrictId,[DistrictDescription],[Qtr],[VisitationYear], [RiskFactorsDescription], TotalNumber
            FROM    View_DashboardBeneficiariesonICARE
        ) AS t
        PIVOT
        (   AVG(TotalNumber)
            FOR [RiskFactorsDescription] IN 
                ([Adolescent Mother], [C/ALHIV], [Child of FSW], [FSW], [HEI], [Living in HH with Adolescent Mother], [Living in HH with FSW], [Living in HH with HEI], [Living in HH with PLHIV], 
				[Living in HH with SVAC], [Other], [PLHIV], [SVAC]
                )
        ) AS pvt;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[6] 2[38] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "roar"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICARE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICARE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICAREPivot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DashboardBeneficiariesonICAREPivot'
GO
