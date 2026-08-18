ALTER TABLE public."tEventOfferDetail"
ADD COLUMN IF NOT EXISTS "futureEdPrice" numeric(18,2);

ALTER TABLE public."tEventOfferDetail"
ADD COLUMN IF NOT EXISTS "futureEdEffectiveDate" date;