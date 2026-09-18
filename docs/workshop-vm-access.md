# Workshop VM access

The workshop VM uses Google Cloud OS Login over IAP. Every participant signs
in with their own Google account and receives a distinct non-root Linux user.
Participants must not receive sudo or project administration access.

## Canonical resources

- Project: `np-codex-workshop`
- VM: `codex-vm`
- Zone: `us-east4-c`
- Infrastructure owner: `npatta01@gmail.com`

## Participant IAM

Grant each participant exactly these roles:

| Scope | Role | Purpose |
| --- | --- | --- |
| Project | `roles/compute.osLogin` | SSH as a standard user without sudo |
| Project | `roles/iap.tunnelResourceAccessor` | Reach SSH through IAP |
| Attached VM service account | `roles/iam.serviceAccountUser` | Satisfy OS Login for a VM with an attached service account |

Do not grant participants any of the following:

- `roles/compute.osAdminLogin`
- `roles/owner`
- `roles/editor`
- `roles/iap.admin` or `roles/iap.policyAdmin`
- `roles/compute.instanceAdmin.v1`

Keep the attached service account, but do not give it broad project roles such
as Editor. `Service Account User` is safe only when the service account itself
does not carry privileges participants should not inherit.

If the project belongs to an organization and a participant is external to
that organization, an organization administrator might also need to grant
`roles/compute.osLoginExternalUser` at the organization level.

## Network requirement

IAP SSH requires ingress TCP 22 from `35.235.240.0/20`. Do not expose TCP 22
from `0.0.0.0/0`. The separate public prototype rule permits only TCP
3000-3999 and targets only the `codex-workshop-preview` VM tag.

## Participant connection

```bash
gcloud auth login
gcloud config set project np-codex-workshop
gcloud compute ssh codex-vm \
  --project=np-codex-workshop \
  --zone=us-east4-c \
  --tunnel-through-iap
```

After connecting, `whoami` must show the participant's OS Login username, not
`npatta01_gmail_com`. `sudo -n true` must fail for a participant. Do not ask a
participant to enter a sudo password as a workaround.

## Audit checklist

- `enable-oslogin` is `TRUE` on `codex-vm`.
- Only the infrastructure owner retains project Owner.
- Participants have OS Login, not OS Admin Login.
- Participants have no Owner, Editor, IAP Admin, or Instance Admin role.
- The attached service account has no project Editor role.
- Every participant uses a separate Google identity and Linux account.
- GitHub, Google Cloud, and Codex authentication remain per user.
