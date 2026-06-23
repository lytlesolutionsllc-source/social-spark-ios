# Social Spark Engineering Workflow

This document defines how we keep Social Spark stable while iterating quickly.

## 1) Single Source of Truth

- Use exactly one Xcode project file at repository root:
  - `SocialSpark.xcodeproj`
- Do not create nested project files (for example `SocialSpark/SocialSpark.xcodeproj`).
- If a nested `.xcodeproj` appears, remove or rename it immediately.

## 2) Branching Model

- `main` must remain buildable.
- Create one feature/checkpoint branch per logical milestone.

Examples:
- `mvp-checkpoint-01-navigation`
- `mvp-checkpoint-02-creator-flow`
- `mvp-checkpoint-03-brand-flow`
- `mvp-checkpoint-04-admin-flow`

## 3) Commit Strategy

- Keep commits small and scoped to one concern.
- Use clear messages:
  - `creator: fix dashboard navigation to wallet`
  - `wallet: add SparkWalletViewModel`
  - `build: remove duplicate type redeclarations`

## 4) Tag Known-Good Builds

After a successful local build + smoke check, tag the commit:

```bash
git tag mvp-v0.1-working-nav
git push origin mvp-v0.1-working-nav
```

Tag naming examples:
- `mvp-v0.1-working-nav`
- `mvp-v0.2-creator-flow`
- `mvp-v0.3-brand-flow`

## 5) Definition of Done (per flow)

A flow is complete only when all are true:
- Builds clean in Xcode with no compile errors
- Navigation path works end-to-end
- No duplicate symbol/type definitions
- New/changed files follow folder conventions
- CI passes on the PR

## 6) File & Naming Conventions

- Views:
  - Path: `SocialSpark/Views/...`
  - Name suffix: `*View.swift`
- View models:
  - Path: `SocialSpark/ViewModels/...`
  - Name suffix: `*ViewModel.swift`
- Models:
  - Path: `SocialSpark/Models/...`
- Mock data/services:
  - Path: `SocialSpark/MockData`, `SocialSpark/Services`

Never place view code in `ViewModels` files.
Never define the same type name in more than one file.

## 7) Pull Request Discipline

- Even when working solo, prefer PRs into `main`.
- Validate the changed-files list before merge.
- Merge only when CI is green.

## 8) Build Recovery Checklist

If build breaks:
1. Confirm correct project path: `SocialSpark.xcodeproj` at repo root.
2. Search for duplicate type names (for example `CreatorDashboardView`).
3. Verify target membership for new files.
4. Clean build folder and rebuild.
5. Restore specific files from a known-good commit if needed.

Useful commands:

```bash
git status
git log --oneline -20
git restore --source <good_sha> -- <path/to/file>
```

## 9) Session Handoff Log

Keep `docs/BUILD_STATUS.md` updated after each working checkpoint with:
- Current branch
- Last known-good commit SHA
- Current blocker (if any)
- Next planned action

## 10) CI Guardrail

- GitHub Actions workflow at `.github/workflows/ios-build.yml` validates build on pushes and PRs.
- Treat failing CI as a stop sign before merging to `main`.
