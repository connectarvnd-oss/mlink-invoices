# Setting up the shared cloud (Supabase)

This takes about 5 minutes and is free.

1. **Create a project.** Sign up at https://supabase.com, click **New project**, give it a name (e.g. `mlink-invoices`), set a database password, and pick the region closest to you.
2. **Create the tables.** Open **SQL Editor > New query**, paste everything from [`setup.sql`](setup.sql), and click **Run**.
3. **Turn off public sign-ups** so only people you add can get in: **Authentication > Sign In / Providers > Email**, switch off **Allow new users to sign up** (keep Email enabled), and save.
4. **Add your team.** **Authentication > Users > Add user > Create new user**. Enter each person's email and a password and tick **Auto Confirm User**. Share the password with them.
5. **Connect the site.** Open **Project Settings > API** (or **Data API**) and copy the **Project URL** and the **anon public** key. Put them in `index.html` near the top:

   ```js
   window.MLINK_CONFIG = {
     SUPABASE_URL: "https://xxxx.supabase.co",
     SUPABASE_ANON_KEY: "eyJ...",
   };
   ```

   The anon key is designed to be public. Your data is protected by sign-in and the row-level security rules in `setup.sql`. Never put the `service_role` key in the site.

Once the values are in, the site shows a sign-in screen, and everyone who signs in sees the same invoices, live.
