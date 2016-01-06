
AMO to Firefox Account Migration UX Specs
=========================================

So that I can reduce the numbers of logins I have, as a Mozilla Add-ons user, I want to switch from using my AMO login and start using a Firefox Account.

## User Flow Diagram
Red line denotes common post-migration login experience.
![User Flow Diagram](https://www.lucidchart.com/publicSegments/view/c45f10ff-5084-407d-8322-cbc8b6cd25be/image.png)

## Migrating from AMO
* When a currently authenticated AMO user returns to AMO, they will see a notice prompting them to upgrade their account.
* When a currently authenticated AMO user chooses the call to action in the notice, they are taken to the AMO login to confirm their identity.
* When an existing AMO user enters their email address, they are taken to the AMO login.
* When they log in successfully, they are shown a notice prompting them to upgrade their account.
* When they click **Continue** and do not have a Firefox Account, they taken to FxA registration that is pre-populated with their email.
* When they click **Continue** and do have a Firefox Account, they taken to FxA login that is pre-populated with their email.
* When they click **Skip**, they taken to AMO which contains an upgrade notice.
* When they attempt to use an email that is unverified with FxA, they are taken to the confirm your account screen.
* When they change their email to one that already exists in FxA or AMO, they see the message **This account already exists on Mozilla Add-ons**.
* When they are successful at migrating, they see the notice **Great job! You can now log in to AMO using your FxA**.

## Registering
* When an unauthenticated user chooses to register, they will see a **Join Mozilla Add-ons** form that asks for their email, with secondary option to switch to **Sign in**.
* When a new user enters their email address, they are taken to the FxA registration.
* When an FxA user enters their email address, they are taken to the FxA login.
* When they change their email to one that already exists in FxA or AMO, they see the message **This account already exists on Mozilla Add-ons**.
* When a registering user successfully verifies their Firefox Account, they are taken to an incomplete AMO settings view that requires profile completion.
* When a registering user completes their AMO profile, the old AMO account can be retired from service.

## Logging In
* When any unauthenticated user chooses to log in, they will see a **Sign in to Mozilla Add-ons** form that asks for their email, with secondary option to switch to **Create an account**.

## Post-Migration
* When an already-migrated user returns to AMO, they will no longer see a notice prompting them to upgrade their account.
* When an already-migrated user chooses to log in, they will see a **Sign in to Mozilla Add-ons** form that asks for their email, with secondary option to switch to **Create an account**.
* When an already-migrated users clicks **Continue**, they taken to FxA login that is pre-populated with their email.
* When an already-migrated user logs in, they are taken to AMO.
