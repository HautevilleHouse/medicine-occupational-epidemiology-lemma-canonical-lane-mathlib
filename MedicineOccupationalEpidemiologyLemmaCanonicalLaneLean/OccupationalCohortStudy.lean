import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure OccupationalCohortStudyPackage where
  cohortDefinition : Type u
  followUpComplete : Prop
  outcomeAscertainment : Prop
  exposureAssessmentIntegrated : Prop
  confounderControl : Prop
  statisticalPowerSufficient : Prop

structure OccupationalCohortStudyEvidence (O : OccupationalCohortStudyPackage) where
  followUpCompleteClosed : O.followUpComplete
  outcomeAscertainmentClosed : O.outcomeAscertainment
  exposureAssessmentIntegratedClosed : O.exposureAssessmentIntegrated
  confounderControlClosed : O.confounderControl
  statisticalPowerSufficientClosed : O.statisticalPowerSufficient

def OccupationalCohortStudyClosed (O : OccupationalCohortStudyPackage) : Prop :=
  O.followUpComplete ∧ O.outcomeAscertainment ∧ O.exposureAssessmentIntegrated ∧ O.confounderControl ∧ O.statisticalPowerSufficient

theorem occupational_cohort_study_closed_from_evidence (O : OccupationalCohortStudyPackage) (Ev : OccupationalCohortStudyEvidence O) : OccupationalCohortStudyClosed O :=
  And.intro Ev.followUpCompleteClosed
    (And.intro Ev.outcomeAscertainmentClosed
      (And.intro Ev.exposureAssessmentIntegratedClosed
        (And.intro Ev.confounderControlClosed Ev.statisticalPowerSufficientClosed)))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse