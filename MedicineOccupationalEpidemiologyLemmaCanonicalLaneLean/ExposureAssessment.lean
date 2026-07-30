import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure ExposureAssessmentPackage where
  jobExposureMatrix : Type u
  cumulativeExposure : Type v
  exposureMetric : Type w
  exposureContrastAvailable : Prop
  temporalAlignment : Prop
  exposureAssessmentParameters : Prop

structure ExposureAssessmentEvidence (E : ExposureAssessmentPackage) where
  exposureContrastAvailableClosed : E.exposureContrastAvailable
  temporalAlignmentClosed : E.temporalAlignment
  exposureAssessmentParametersClosed : E.exposureAssessmentParameters

def ExposureAssessmentClosed (E : ExposureAssessmentPackage) : Prop :=
  E.exposureContrastAvailable ∧ E.temporalAlignment ∧ E.exposureAssessmentParameters

theorem exposure_assessment_closed_from_evidence (E : ExposureAssessmentPackage) (Ev : ExposureAssessmentEvidence E) : ExposureAssessmentClosed E :=
  And.intro Ev.exposureContrastAvailableClosed (And.intro Ev.temporalAlignmentClosed Ev.exposureAssessmentParametersClosed)

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse