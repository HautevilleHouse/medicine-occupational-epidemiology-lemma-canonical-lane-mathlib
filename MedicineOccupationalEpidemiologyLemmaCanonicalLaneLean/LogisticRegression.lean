import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure LogisticRegressionPackage where
  logOddsFunction : Type u
  maximumLikelihoodEstimable : Prop
  convergenceGuaranteed : Prop
  standardErrorsComputable : Prop
  goodnessOfFit : Prop

structure LogisticRegressionEvidence (L : LogisticRegressionPackage) where
  maximumLikelihoodEstimableClosed : L.maximumLikelihoodEstimable
  convergenceGuaranteedClosed : L.convergenceGuaranteed
  standardErrorsComputableClosed : L.standardErrorsComputable
  goodnessOfFitClosed : L.goodnessOfFit

def LogisticRegressionClosed (L : LogisticRegressionPackage) : Prop :=
  L.maximumLikelihoodEstimable ∧ L.convergenceGuaranteed ∧ L.standardErrorsComputable ∧ L.goodnessOfFit

theorem logistic_regression_closed_from_evidence (L : LogisticRegressionPackage) (Ev : LogisticRegressionEvidence L) : LogisticRegressionClosed L :=
  And.intro Ev.maximumLikelihoodEstimableClosed
    (And.intro Ev.convergenceGuaranteedClosed
      (And.intro Ev.standardErrorsComputableClosed Ev.goodnessOfFitClosed))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse