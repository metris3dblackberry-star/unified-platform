# Unified Platform

Deployolhato kozos shell a ket Railway app ele:

- CRM: `knb-crm`
- ERP: `PLANETA-ERP`

## Mire valo

- Egyetlen kezdooldal
- Ketto tab: `CRM` es `ERP`
- A ket Railway alkalmazast iframe-ben nyitja meg
- Kulon uj fulben is megnyithato mindket rendszer

## Szukseges Railway valtozok

### Unified shell app

```env
CRM_PUBLIC_URL=https://web-production-5755d.up.railway.app/
ERP_PUBLIC_URL=https://planeta-erp-production.up.railway.app/
SHELL_TITLE=KNB CRM + PLANETA ERP
```

### CRM app

```env
EMBED_ALLOWED_ORIGINS=https://<unified-shell-domain>
```

### ERP app

```env
EMBED_ALLOWED_ORIGINS=https://<unified-shell-domain>
```

Tobb origin is megadhato vesszovel elvalasztva.

## Helyi inditas

```powershell
py -3 -m pip install -r requirements.txt
py -3 app.py
```

## Railway deploy

1. Uj GitHub repo a shellnek.
2. Railway-en `Deploy from GitHub`.
3. Allitsd be a `CRM_PUBLIC_URL`, `ERP_PUBLIC_URL`, `SHELL_TITLE` valtozokat.
4. A shell publikus domainjet masold be a CRM es ERP `EMBED_ALLOWED_ORIGINS` valtozojaba.
5. Redeployold a CRM-et es az ERP-t.

## Start command

`Procfile`:

```text
web: python app.py
```
