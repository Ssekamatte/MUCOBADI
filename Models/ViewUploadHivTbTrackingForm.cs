﻿using System;
using System.Collections.Generic;

#nullable disable

namespace MUCOBADI.Models
{
    public partial class ViewUploadHivTbTrackingForm
    {
        public int HivTbTrackingFormId { get; set; }
        public int? HouseHoldMemberId { get; set; }
        public string HouseHoldMemberCode { get; set; }
        public DateTime? FollowUpDate { get; set; }
        public int? HivstatusId { get; set; }
        public int? OnArt { get; set; }
        public string Artnumber { get; set; }
        public DateTime? CohortNo { get; set; }
        public int? ClientMemberStatusId { get; set; }
        public string ClientMemberStatusOther { get; set; }
        public int? CientClassificationId { get; set; }
        public double? Weight { get; set; }
        public int? FacilityId { get; set; }
        public double? TreatmentDuration { get; set; }
        public int? RegimenCategoryId { get; set; }
        public int? RegimenId { get; set; }
        public int? ClientCareModalityId { get; set; }
        public string ClientCareModalityIdOther { get; set; }
        public int? DrugDispensingModalityId { get; set; }
        public int? CurrentCarePointSubCountyId { get; set; }
        public int? CurrentCarePointDistrictId { get; set; }
        public DateTime? LastAppointmentDate { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public int? IsClientEligibleForViralload { get; set; }
        public int? ViralloadTestDone { get; set; }
        public int? ViralloadResultsReceived { get; set; }
        public string ViralloadTestResults { get; set; }
        public int? ViralLoadSuppressedId { get; set; }
        public DateTime? LastViralloadTestDate { get; set; }
        public DateTime? NextViralloadTestDate { get; set; }
        public int? ClientHasPresumptiveOrActiveTb { get; set; }
        public int? ClientReceivedTbscreeningSession { get; set; }
        public int? ClientAtTbinfectionRisk { get; set; }
        public int? ClientRefferedTestedForTb { get; set; }
        public int? TbtestResultId { get; set; }
        public int? IsOnTbtreatment { get; set; }
        public int? TbtreatmentDuration { get; set; }
        public int? IsOnTbpreventiveTreatment { get; set; }
        public int? TptTreatmentDuration { get; set; }
        public int? FollowupMeansId { get; set; }
        public int? ClientSuccessfullyContactedOrSeen { get; set; }
        public int? AnotherPersonContactedOnBehalfOfClient { get; set; }
        public int? PersonContactedId { get; set; }
        public string OtherPersonContacted { get; set; }
        public string ServiceProvidedId { get; set; }
        public string OtherServiceProvided { get; set; }
        public string NotSuppressingReasonId { get; set; }
        public string OtherNotSuppressingReason { get; set; }
        public string NonAdherenceId { get; set; }
        public string NonAdherenceOther { get; set; }
        public string SocialWorkerNextActionTaken { get; set; }
        public string SocialWorkerName { get; set; }
        public string SocialWorkerTitle { get; set; }
        public string SocialWorkerContact { get; set; }
        public DateTime? SocialWorkerEntryDate { get; set; }
        public string ReviewedBy { get; set; }
        public string ReviewedTitle { get; set; }
        public string ReviewedContact { get; set; }
        public DateTime? ReviewDate { get; set; }
        public string PhoneNumber { get; set; }
        public string Surname { get; set; }
        public string Givenname { get; set; }
        public string GenderId { get; set; }
        public DateTime? DoB { get; set; }
        public int? Age { get; set; }
        public int? KnownRiskFactorId { get; set; }
        public int? ProgramParticipationId { get; set; }
        public int? IsCareGiver { get; set; }
        public int? IsEnrolledInSchool { get; set; }
        public int? IsAttendingSchoolRegularly { get; set; }
        public int? EducationLevelId { get; set; }
        public string NameofSchool { get; set; }
        public int? IsOrphaned { get; set; }
        public int? IsChildUnder5Malnourished { get; set; }
        public int? DoesChildHaveBirthCertificate { get; set; }
        public int? IsDisabled { get; set; }
        public string DisabilityDescription { get; set; }
        public int? Ischildimmunised { get; set; }
        public int? CurrentlyonArt { get; set; }
        public DateTime? Cohort { get; set; }
        public int? HasanIga { get; set; }
        public int? IsinSavingsGroup { get; set; }
        public int? Isinschoolcompletingapprenticeship { get; set; }
        public DateTime? EnrollmentDate { get; set; }
        public string HouseHoldCode { get; set; }
    }
}
