ALTER TABLE public."tEventOfferDetail"
ADD COLUMN IF NOT EXISTS "futureEdPrice" numeric(19,5);

ALTER TABLE public."tEventOfferDetail"
ADD COLUMN IF NOT EXISTS "futureEdEffectiveDate" date;
