# MLink Overseas Invoices

A single-page invoice app for MLink Overseas students: create invoices, track status (draft, sent, paid, overdue), and download branded PDFs.

Live site: https://connectarvnd-oss.github.io/mlink-invoices/

## Where your data is kept

Invoices are stored in a shared Supabase database: everyone on the team signs in and sees the same invoices. See [SETUP.md](SETUP.md) to connect it. Until it is connected, the site falls back to saving invoices in the browser.

## Updating

Everything lives in `index.html`. Edit it and push to `main`; GitHub Pages republishes within a minute or two.

## Signing in

Team members sign in with the email and password created for them in Supabase (Authentication > Users). Public sign-up is turned off.
