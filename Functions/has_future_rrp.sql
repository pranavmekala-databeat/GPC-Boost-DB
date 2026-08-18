CREATE OR REPLACE FUNCTION public.has_future_rrp(
    p_offer_id integer,
    p_offer_no integer
)
RETURNS boolean
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1
        FROM "tEventOfferDetail"
        WHERE "offerId" = p_offer_id
          AND "offerNo" = p_offer_no
          AND "isSkuActive" = TRUE
          AND "futureEdPrice" IS NOT NULL
          AND "futureEdEffectiveDate" IS NOT NULL
    );
END;
$$;