import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : ℕ
  specificity : ℕ
  prevalence : ℕ
  positivePredictiveValue : ℕ
  negativePredictiveValue : ℕ
  likelihoodRatioPositive : ℕ
  likelihoodRatioNegative : ℕ

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity > 0 ∧ D.sensitivity ≤ 100
  specificityClosed : D.specificity > 0 ∧ D.specificity ≤ 100
  prevalenceClosed : D.prevalence > 0 ∧ D.prevalence ≤ 100
  positivePredictiveValueClosed : D.positivePredictiveValue > 0 ∧ D.positivePredictiveValue ≤ 100
  negativePredictiveValueClosed : D.negativePredictiveValue > 0 ∧ D.negativePredictiveValue ≤ 100
  likelihoodRatioPositiveClosed : D.likelihoodRatioPositive > 0
  likelihoodRatioNegativeClosed : D.likelihoodRatioNegative > 0

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  (D.sensitivity > 0 ∧ D.sensitivity ≤ 100) ∧
  (D.specificity > 0 ∧ D.specificity ≤ 100) ∧
  (D.prevalence > 0 ∧ D.prevalence ≤ 100) ∧
  (D.positivePredictiveValue > 0 ∧ D.positivePredictiveValue ≤ 100) ∧
  (D.negativePredictiveValue > 0 ∧ D.negativePredictiveValue ≤ 100) ∧
  D.likelihoodRatioPositive > 0 ∧ D.likelihoodRatioNegative > 0

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.prevalenceClosed
        (And.intro E.positivePredictiveValueClosed
          (And.intro E.negativePredictiveValueClosed
            (And.intro E.likelihoodRatioPositiveClosed E.likelihoodRatioNegativeClosed)))))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse