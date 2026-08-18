-- Table: public.tEventOfferDetail

-- DROP TABLE IF EXISTS public."tEventOfferDetail";

CREATE TABLE IF NOT EXISTS public."tEventOfferDetail"
(
    "eventId" integer NOT NULL,
    page integer NOT NULL,
    "pagePosition" integer NOT NULL,
    "comOfferCategory1" character varying(1) COLLATE pg_catalog."default",
    "offerNo" integer NOT NULL,
    "offerId" integer NOT NULL DEFAULT nextval('"tEventOfferDetail_offerId_seq"'::regclass),
    sku character varying(12) COLLATE pg_catalog."default" NOT NULL,
    country character varying(10) COLLATE pg_catalog."default",
    "unitOfMeasureCopy" character varying(30) COLLATE pg_catalog."default",
    "substituteSku" character varying(12) COLLATE pg_catalog."default",
    "LatestEffectiveCost" numeric(18,2),
    "nationalAverageCost" numeric(18,2),
    "trueLandedCost" numeric(18,2),
    "categoryCost" numeric(18,2),
    "purchaseQuantity" integer,
    "offerQuantity" integer,
    "tieUp" numeric(19,5),
    "allocationGroup" character varying(20) COLLATE pg_catalog."default",
    "allocationType" character varying(20) COLLATE pg_catalog."default",
    "group0Quantity" integer,
    "group1Quantity" integer,
    "group2Quantity" integer,
    "group3Quantity" integer,
    "group4Quantity" integer,
    "group5Quantity" integer,
    "totalTieUp" integer,
    categoryforecast integer,
    "incrementalForecast" integer,
    "tieUpCost" numeric(19,5),
    "everydayPrice" numeric(18,2),
    "everydayPriceGst" numeric(18,2),
    "everydayPriceGstSys" numeric(18,2),
    "futureEdPrice" numeric(18,2),
    "futureEdEffectiveDate" date,
    "advertisedPrice" numeric(19,5),
    "advertisedPriceGst" numeric(19,5),
    "advertisedPriceCalculated" numeric(19,5),
    "fromPriceIndicator" boolean,
    gst numeric(19,5),
    "everydayUnits" numeric(19,5),
    "calculatedSavePercentage" numeric(19,5),
    "calculatedSaveValue" numeric(19,5),
    "everydayTradeMargin$" numeric(19,5),
    "everydayTradeMargin%" numeric(19,5),
    "forecastCost" numeric(19,5),
    "forecastSales" numeric(19,5),
    "forecastTradeMargin$" numeric(19,5),
    "forecastTradeMargin%" numeric(19,5),
    "advertisedTradeMargin$" numeric(19,5),
    "grossMargin" numeric(19,5),
    "grossMargin%" numeric(19,5),
    "hybrisPromoCode" character varying(20) COLLATE pg_catalog."default",
    "hybrisPromoCodePrevious" character varying(20) COLLATE pg_catalog."default",
    "priceOnly" boolean,
    "partNo" character varying(50) COLLATE pg_catalog."default",
    "showroomIndicator" character varying(1) COLLATE pg_catalog."default",
    "stockOnHandStore" numeric(19,5),
    "stockOnHandDC" numeric(19,5),
    description character varying(60) COLLATE pg_catalog."default",
    created timestamp without time zone,
    "userID" character varying(30) COLLATE pg_catalog."default",
    updated timestamp without time zone,
    "inventoryReviewIndicator" boolean,
    "clearanceIndicator" character varying(1) COLLATE pg_catalog."default",
    "offerLocation" boolean,
    "scanSupport$" numeric(18,2),
    "scanSupport%" numeric(18,2),
    "spacePurchase" numeric(18,2),
    "createdBy" character varying(255) COLLATE pg_catalog."default",
    "unitsPurchased" integer,
    "supplierIncome" numeric(18,2),
    "everydayGrossMargin" numeric(18,2),
    "everydayGrossCost" numeric(18,2),
    "incrementalTrade$" numeric(19,5),
    "incrementalSales" numeric(19,5),
    "everydayExtendedUnitCost" numeric(19,5),
    "everydayExtendedUnitSales" numeric(19,5),
    "extendedAdvertisedPrice" numeric(19,5),
    "everydayCost" numeric(19,5),
    "displayIndicator" boolean DEFAULT false,
    "isCategoryForecastLocked" boolean,
    "isSkuEdited" boolean,
    "isSkuActive" boolean DEFAULT true,
    "isFromPriceManual" boolean,
    CONSTRAINT pk_teventofferdetail PRIMARY KEY ("offerNo", "offerId", sku),
    CONSTRAINT uk_teventofferdetail UNIQUE ("eventId", page, "pagePosition", "comOfferCategory1", "offerNo", "offerId", sku, country)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."tEventOfferDetail"
    OWNER to cdcaudevadmin;
-- Index: idx_eventdetail_country

-- DROP INDEX IF EXISTS public.idx_eventdetail_country;

CREATE INDEX IF NOT EXISTS idx_eventdetail_country
    ON public."tEventOfferDetail" USING btree
    (country COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_eventdetail_offer

-- DROP INDEX IF EXISTS public.idx_eventdetail_offer;

CREATE INDEX IF NOT EXISTS idx_eventdetail_offer
    ON public."tEventOfferDetail" USING btree
    ("offerId" ASC NULLS LAST, "offerNo" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_eventdetail_sort

-- DROP INDEX IF EXISTS public.idx_eventdetail_sort;

CREATE INDEX IF NOT EXISTS idx_eventdetail_sort
    ON public."tEventOfferDetail" USING btree
    ("eventId" ASC NULLS LAST, page ASC NULLS LAST, "pagePosition" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_eventofferdetail_country

-- DROP INDEX IF EXISTS public.idx_eventofferdetail_country;

CREATE INDEX IF NOT EXISTS idx_eventofferdetail_country
    ON public."tEventOfferDetail" USING btree
    (country COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_eventofferdetail_offerid_offerno

-- DROP INDEX IF EXISTS public.idx_eventofferdetail_offerid_offerno;

CREATE INDEX IF NOT EXISTS idx_eventofferdetail_offerid_offerno
    ON public."tEventOfferDetail" USING btree
    ("offerId" ASC NULLS LAST, "offerNo" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_eventofferdetails_offerid_offerno_ic1

-- DROP INDEX IF EXISTS public.idx_eventofferdetails_offerid_offerno_ic1;

CREATE INDEX IF NOT EXISTS idx_eventofferdetails_offerid_offerno_ic1
    ON public."tEventOfferDetail" USING btree
    ("offerId" ASC NULLS LAST, "offerNo" ASC NULLS LAST, "comOfferCategory1" COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_teventofferdetail

-- DROP INDEX IF EXISTS public.idx_teventofferdetail;

CREATE INDEX IF NOT EXISTS idx_teventofferdetail
    ON public."tEventOfferDetail" USING btree
    ("eventId" ASC NULLS LAST, page ASC NULLS LAST, "pagePosition" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_teventofferdetail_composite

-- DROP INDEX IF EXISTS public.idx_teventofferdetail_composite;

CREATE INDEX IF NOT EXISTS idx_teventofferdetail_composite
    ON public."tEventOfferDetail" USING btree
    ("eventId" ASC NULLS LAST, page ASC NULLS LAST, "pagePosition" ASC NULLS LAST, "offerId" ASC NULLS LAST, "offerNo" ASC NULLS LAST, sku COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_teventofferdetail_fromprice

-- DROP INDEX IF EXISTS public.idx_teventofferdetail_fromprice;

CREATE INDEX IF NOT EXISTS idx_teventofferdetail_fromprice
    ON public."tEventOfferDetail" USING btree
    ("fromPriceIndicator" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_teventofferdetail_isskuedited

-- DROP INDEX IF EXISTS public.idx_teventofferdetail_isskuedited;

CREATE INDEX IF NOT EXISTS idx_teventofferdetail_isskuedited
    ON public."tEventOfferDetail" USING btree
    ("offerId" ASC NULLS LAST, "offerNo" ASC NULLS LAST, "isSkuEdited" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_teventofferdetail_lookup

-- DROP INDEX IF EXISTS public.idx_teventofferdetail_lookup;

CREATE INDEX IF NOT EXISTS idx_teventofferdetail_lookup
    ON public."tEventOfferDetail" USING btree
    ("eventId" ASC NULLS LAST, page ASC NULLS LAST, "pagePosition" ASC NULLS LAST, "offerId" ASC NULLS LAST, "offerNo" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_teventofferdetail_sku

-- DROP INDEX IF EXISTS public.idx_teventofferdetail_sku;

CREATE INDEX IF NOT EXISTS idx_teventofferdetail_sku
    ON public."tEventOfferDetail" USING btree
    (sku COLLATE pg_catalog."default" ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;

-- Trigger: trg_after_copy_teventofferdetail

-- DROP TRIGGER IF EXISTS trg_after_copy_teventofferdetail ON public."tEventOfferDetail";

CREATE OR REPLACE TRIGGER trg_after_copy_teventofferdetail
    AFTER INSERT
    ON public."tEventOfferDetail"
    REFERENCING NEW TABLE AS new_table
    FOR EACH STATEMENT
    EXECUTE FUNCTION public.trg_update_lecost_natavgcost();

ALTER TABLE public."tEventOfferDetail"
    DISABLE TRIGGER trg_after_copy_teventofferdetail;

-- Trigger: trg_after_insert_lecost_natavgcost

-- DROP TRIGGER IF EXISTS trg_after_insert_lecost_natavgcost ON public."tEventOfferDetail";

CREATE OR REPLACE TRIGGER trg_after_insert_lecost_natavgcost
    AFTER INSERT
    ON public."tEventOfferDetail"
    FOR EACH ROW
    EXECUTE FUNCTION public.trg_update_lecost_natavgcost();

ALTER TABLE public."tEventOfferDetail"
    DISABLE TRIGGER trg_after_insert_lecost_natavgcost;