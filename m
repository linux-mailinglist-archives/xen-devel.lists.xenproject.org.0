Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17870477048
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247894.427507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoyW-0001NH-Ii; Thu, 16 Dec 2021 11:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247894.427507; Thu, 16 Dec 2021 11:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxoyW-0001KS-Fa; Thu, 16 Dec 2021 11:31:04 +0000
Received: by outflank-mailman (input) for mailman id 247894;
 Thu, 16 Dec 2021 11:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HYuw=RB=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mxoyU-0001KM-T2
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:31:03 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe06::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a46f5d2d-5e63-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:31:00 +0100 (CET)
Received: from DB6PR0301CA0059.eurprd03.prod.outlook.com (2603:10a6:4:54::27)
 by DB7PR08MB3289.eurprd08.prod.outlook.com (2603:10a6:5:26::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 11:30:55 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::de) by DB6PR0301CA0059.outlook.office365.com
 (2603:10a6:4:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Thu, 16 Dec 2021 11:30:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Thu, 16 Dec 2021 11:30:55 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Thu, 16 Dec 2021 11:30:55 +0000
Received: from c8f0b5e383f0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 099F4F28-9D2B-4340-8C96-FAA677DEE524.1; 
 Thu, 16 Dec 2021 11:30:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8f0b5e383f0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Dec 2021 11:30:34 +0000
Received: from AM9PR08MB6914.eurprd08.prod.outlook.com (2603:10a6:20b:307::13)
 by AM0PR08MB5476.eurprd08.prod.outlook.com (2603:10a6:208:18d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 16 Dec
 2021 11:30:32 +0000
Received: from AM9PR08MB6914.eurprd08.prod.outlook.com
 ([fe80::b1d3:4778:2574:bc13]) by AM9PR08MB6914.eurprd08.prod.outlook.com
 ([fe80::b1d3:4778:2574:bc13%6]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 11:30:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a46f5d2d-5e63-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7u5O+e1vbBK78KSwulSnpVGctIkElmTLUFIdTFYTZk=;
 b=XQz0IF3loNkKRrnIb0t5o7K7wvT/jfWP7WNrtylRElJNEpzFxzOuZWeya9L8GSDoZRfNjVg4M6L04G2REloeNdIiYZdUzFwfbiLsVrNP1Db36B0auvNwHeGL2MatD91VMbWr3J9bSkNOHIbmRkQ3K14PMCnEn+Gg4hin3efJlcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4f597e78484f184
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eI8GMKvKyKZKgopZeyWhJCwzxBGBahf1d61IANTJqC/2XOYgY/6jrxF4XZdOoqKuGBX0o+xYHOPePQKL3hReiQXqY8+Mo00aMIDyVYVNAKJ1oS8K8wsUmcDu3mVQ+2LraUlL8BH1o+bnnD8ceh/qT0Mdle4AgW9MiL88VuUGoc8Q/RItQxhbebfyOSoUl/KFnNpuMbpu88s5lYgyo23h4nyVKGqovuHmRa1GHKZbWME5/2XjBdd4wH3IMWIgvQVYElFNAwknkkiO5LPd//x0UXBdb6KHyWe7PX+Rycc2411RYj4tAXNd59u+9JYSMkvsshz6IB3t/spZtDEUmXzR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7u5O+e1vbBK78KSwulSnpVGctIkElmTLUFIdTFYTZk=;
 b=jEcN0BEo7V3ETAmaG+jqbffOelrko4EJmmlJfvEVihYZQx0LOSJ22xULcDN2I5Bj6MpvzCxuLjhrppaJMbhZenYpSi0W6iR+Q30YNJE12deR4CTQMtnyXTQFRZPgsNxIctp6j3zC+lZ/a6PGQbgXnn0aGEEz2OobU0NdfqVKDN+HuF2VLUT3Rbeic4hPrCHbq28olCz/Mel8nXIjIYskDHs9Hq/0IeUR374shCD8EpZhUmwSBFpKyu5M5CwISTpaGKgU/x3YUIqWUJQh+VEg5AahB/CHuQ0I9sYNAkEjbwfBBPZaMS3/qi6A8rWB1ycA5KYgc/iEPN5Vq1nxSUUYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7u5O+e1vbBK78KSwulSnpVGctIkElmTLUFIdTFYTZk=;
 b=XQz0IF3loNkKRrnIb0t5o7K7wvT/jfWP7WNrtylRElJNEpzFxzOuZWeya9L8GSDoZRfNjVg4M6L04G2REloeNdIiYZdUzFwfbiLsVrNP1Db36B0auvNwHeGL2MatD91VMbWr3J9bSkNOHIbmRkQ3K14PMCnEn+Gg4hin3efJlcc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
Thread-Topic: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
Thread-Index: AQHXsSolt8slMIplQ0OX3IGr7nYpn6w1flcA
Date: Thu, 16 Dec 2021 11:30:32 +0000
Message-ID: <40CD83D3-4D85-44BA-8F21-969B544267CA@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
In-Reply-To: <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f777f524-aee3-4a90-4084-08d9c0878642
x-ms-traffictypediagnostic:
	AM0PR08MB5476:EE_|DB5EUR03FT034:EE_|DB7PR08MB3289:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3289E440D0D5500877898076FC779@DB7PR08MB3289.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uFbmvoYRH9k+vQDgCjj9zOeAwF1QfiPSXxWvwpszAZybP5MvEBwtuNczVlDTLsvbygDQWV5GqMz56+72kLZSUpDe5gLeulvyHm67FOkXmX3pUbusLbXMDuEuW+9xnD42CvDvrMBuaUUJXEGa5yWJUQ1rWnWtUyeVAxAObebUzBtUsjvAKDvMrw5ofVZSv4NSJbDvH+BbvNG/8XESYi9tB+cXfdUgNzI9/eH5rNFAx1l7PSLQqj3558RLVZqnWCXt+9DGm7P5R7POLQm+KeQ1EEopixyEaehAmk5UhhCbTI4tzgnPzXNRDOD9z9RF/sPKtUspwk+OCxsDqfKqzWDrxX25YSKbK1JjjkPSWpUWHMKxk9IoJ9Ajsxt+h26pVQcS732sh2JJQVzcZj++7vQa76mR/PlOV3FZLjwe1Jog1gYLbb31AcCLrkcz5sx0WmPh4khh1osr3VCW0pZPnbpvEhDVWxpMghJIQJRBdEEgwZCECJkG6kh9xxsi91d/yHgjVdQSVv4EluE0KboWixv68BGLbP+Oh6TC83H1eictvwOoxbMZEyQHeddBazYqjibmwQ0cHTK55jQ7s2LYBAXGSo+SWVBwi4131IsAgk0Ymahhjbb8Ws29CNoJT6bG6Kq/niqZ+kLE9o41WtPqpmH/csmtDjsH8tBaxyKAMHmaNrgzPZCf/7q3xmTyEGUD+S5b7A4pDTq6sGHTBXxj02RlpIIJZcc4qwFiOs5PYt1N8Yt69MBLcYK61UjJPSSoV9LR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6914.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(66446008)(76116006)(64756008)(91956017)(66476007)(66556008)(6512007)(508600001)(71200400001)(186003)(26005)(5660300002)(2616005)(2906002)(86362001)(66946007)(38100700002)(316002)(38070700005)(6506007)(4326008)(8676002)(6916009)(36756003)(8936002)(53546011)(6486002)(54906003)(83380400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15DE69ED21EAAC4A98DE9282C74F0DC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5476
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6684a356-09e1-4cca-6983-08d9c087788b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QPYGdJXCgzGPc8GH4IvkCEwBr1u1diFCY8ZfCrUbjTEwWudsL/fIwE6bwB4WjMGyF8CdDEqQx4FnKKIxZqndJtPsxXVLLPSHPU30N3vF1r+VWLQ6vq1NAujD2Y/ByliO/SJwySqM3aw4NMCidFJKbR15S5Kfy+KmbJ0ys/WCviiXEPWMLBo+bPKNI92AJ7hXGmXy/fYrHQrSxQMpVkP/Ilayj8ynrxXBBXq3tYxojnyHGxDYnCvNhK/OPaUF2ALEtlkjqN3SWMsOOi8xF7mJt1y0FvPQrhv9EaDxaO85MhFZZZHzQNnFbgxxye4yLHWP4GeMdVrstNcmjRQQ0Bc2A2CnMXGOdkRjWSmcH1ZQ06rrl9BpBLXLxxq+Tm9CRgKtwJ6V4A91gQFdg2HeFVlvXCFXGHtLvJW04Eg7qRhC9aZ7M8/O24Ga2ROOfQflfRz6wY+ME9Zfu4eH3IJ2+lV3CHAT//iaQCd3NsR082Upe+6CcSkYqXvza1jtYpIR5FNHHYaAqG+zyvN/wFy8+iZ4Aloie4l8VpzsUYzglnRynk/aqwgJODPdFeepFJbEyouhMJ4n+oVhCpbxSzeKyWLpuUvCyk+0Z5FkbP4JYD2++qx3ya8Ja4ybE2B77p3kpNCSdCtbV+N4wGyc9T1hCgaYM4Bv8XIstOoYIgjC9ufFHbYMmj0wrq+bi+OhYBuk+gC2G+hds4b/moqZ4cFyWEuNGz/32+ibk1Dbz1K9W3IQ19yLJvi8ATz710e6RlLs52NXDQ5UsJp1PYI2/wmxZuDhOg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(36860700001)(86362001)(356005)(2906002)(83380400001)(40460700001)(508600001)(53546011)(316002)(82310400004)(54906003)(5660300002)(81166007)(70206006)(47076005)(33656002)(4326008)(8936002)(6486002)(26005)(8676002)(36756003)(186003)(6862004)(336012)(2616005)(6512007)(70586007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:30:55.5242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f777f524-aee3-4a90-4084-08d9c0878642
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3289

Hi Jan

> On 24 Sep 2021, at 10:53 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Having a separate flush-all hook has always been puzzling me some. We
> will want to be able to force a full flush via accumulated flush flags
> from the map/unmap functions. Introduce a respective new flag and fold
> all flush handling to use the single remaining hook.
>=20
> Note that because of the respective comments in SMMU and IPMMU-VMSA
> code, I've folded the two prior hook functions into one. For SMMU-v3,
> which lacks a comment towards incapable hardware, I've left both
> functions in place on the assumption that selective and full flushes
> will eventually want separating.


For SMMUv3 related Changs:
Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: What we really are going to need is for the map/unmap functions to
>     specify that a wider region needs flushing than just the one
>     covered by the present set of (un)maps. This may still be less than
>     a full flush, but at least as a first step it seemed better to me
>     to keep things simple and go the flush-all route.
> ---
> v2: New.
>=20
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -242,7 +242,6 @@ int amd_iommu_get_reserved_device_memory
> int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
>                                              unsigned long page_count,
>                                              unsigned int flush_flags);
> -int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
> void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int =
dev_id,
>                              dfn_t dfn);
>=20
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -475,15 +475,18 @@ int amd_iommu_flush_iotlb_pages(struct d
> {
>     unsigned long dfn_l =3D dfn_x(dfn);
>=20
> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> -    ASSERT(flush_flags);
> +    if ( !(flush_flags & IOMMU_FLUSHF_all) )
> +    {
> +        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> +        ASSERT(flush_flags);
> +    }
>=20
>     /* Unless a PTE was modified, no flush is required */
>     if ( !(flush_flags & IOMMU_FLUSHF_modified) )
>         return 0;
>=20
> -    /* If the range wraps then just flush everything */
> -    if ( dfn_l + page_count < dfn_l )
> +    /* If so requested or if the range wraps then just flush everything.=
 */
> +    if ( (flush_flags & IOMMU_FLUSHF_all) || dfn_l + page_count < dfn_l =
)
>     {
>         amd_iommu_flush_all_pages(d);
>         return 0;
> @@ -508,13 +511,6 @@ int amd_iommu_flush_iotlb_pages(struct d
>=20
>     return 0;
> }
> -
> -int amd_iommu_flush_iotlb_all(struct domain *d)
> -{
> -    amd_iommu_flush_all_pages(d);
> -
> -    return 0;
> -}
>=20
> int amd_iommu_reserve_domain_unity_map(struct domain *d,
>                                        const struct ivrs_unity_map *map,
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -642,7 +642,6 @@ static const struct iommu_ops __initcons
>     .map_page =3D amd_iommu_map_page,
>     .unmap_page =3D amd_iommu_unmap_page,
>     .iotlb_flush =3D amd_iommu_flush_iotlb_pages,
> -    .iotlb_flush_all =3D amd_iommu_flush_iotlb_all,
>     .reassign_device =3D reassign_device,
>     .get_device_group_id =3D amd_iommu_group_id,
>     .enable_x2apic =3D iov_enable_xt,
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -930,13 +930,19 @@ out:
> }
>=20
> /* Xen IOMMU ops */
> -static int __must_check ipmmu_iotlb_flush_all(struct domain *d)
> +static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
> +                                          unsigned long page_count,
> +                                          unsigned int flush_flags)
> {
>     struct ipmmu_vmsa_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>=20
> +    ASSERT(flush_flags);
> +
>     if ( !xen_domain || !xen_domain->root_domain )
>         return 0;
>=20
> +    /* The hardware doesn't support selective TLB flush. */
> +
>     spin_lock(&xen_domain->lock);
>     ipmmu_tlb_invalidate(xen_domain->root_domain);
>     spin_unlock(&xen_domain->lock);
> @@ -944,16 +950,6 @@ static int __must_check ipmmu_iotlb_flus
>     return 0;
> }
>=20
> -static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
> -                                          unsigned long page_count,
> -                                          unsigned int flush_flags)
> -{
> -    ASSERT(flush_flags);
> -
> -    /* The hardware doesn't support selective TLB flush. */
> -    return ipmmu_iotlb_flush_all(d);
> -}
> -
> static struct ipmmu_vmsa_domain *ipmmu_get_cache_domain(struct domain *d,
>                                                         struct device *de=
v)
> {
> @@ -1303,7 +1299,6 @@ static const struct iommu_ops ipmmu_iomm
>     .hwdom_init      =3D ipmmu_iommu_hwdom_init,
>     .teardown        =3D ipmmu_iommu_domain_teardown,
>     .iotlb_flush     =3D ipmmu_iotlb_flush,
> -    .iotlb_flush_all =3D ipmmu_iotlb_flush_all,
>     .assign_device   =3D ipmmu_assign_device,
>     .reassign_device =3D ipmmu_reassign_device,
>     .map_page        =3D arm_iommu_map_page,
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2649,11 +2649,17 @@ static int force_stage =3D 2;
>  */
> static u32 platform_features =3D ARM_SMMU_FEAT_COHERENT_WALK;
>=20
> -static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
> +static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn=
,
> +					     unsigned long page_count,
> +					     unsigned int flush_flags)
> {
> 	struct arm_smmu_xen_domain *smmu_domain =3D dom_iommu(d)->arch.priv;
> 	struct iommu_domain *cfg;
>=20
> +	ASSERT(flush_flags);
> +
> +	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
> +
> 	spin_lock(&smmu_domain->lock);
> 	list_for_each_entry(cfg, &smmu_domain->contexts, list) {
> 		/*
> @@ -2670,16 +2676,6 @@ static int __must_check arm_smmu_iotlb_f
> 	return 0;
> }
>=20
> -static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn=
,
> -					     unsigned long page_count,
> -					     unsigned int flush_flags)
> -{
> -	ASSERT(flush_flags);
> -
> -	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
> -	return arm_smmu_iotlb_flush_all(d);
> -}
> -
> static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
> 						struct device *dev)
> {
> @@ -2879,7 +2875,6 @@ static const struct iommu_ops arm_smmu_i
>     .add_device =3D arm_smmu_dt_add_device_generic,
>     .teardown =3D arm_smmu_iommu_domain_teardown,
>     .iotlb_flush =3D arm_smmu_iotlb_flush,
> -    .iotlb_flush_all =3D arm_smmu_iotlb_flush_all,
>     .assign_device =3D arm_smmu_assign_dev,
>     .reassign_device =3D arm_smmu_reassign_dev,
>     .map_page =3D arm_iommu_map_page,
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3431,7 +3431,6 @@ static const struct iommu_ops arm_smmu_i
> 	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
> 	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
> 	.iotlb_flush		=3D arm_smmu_iotlb_flush,
> -	.iotlb_flush_all	=3D arm_smmu_iotlb_flush_all,
> 	.assign_device		=3D arm_smmu_assign_dev,
> 	.reassign_device	=3D arm_smmu_reassign_dev,
> 	.map_page		=3D arm_iommu_map_page,
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -463,15 +463,12 @@ int iommu_iotlb_flush_all(struct domain
>     const struct domain_iommu *hd =3D dom_iommu(d);
>     int rc;
>=20
> -    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush_all ||
> +    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
>          !flush_flags )
>         return 0;
>=20
> -    /*
> -     * The operation does a full flush so we don't need to pass the
> -     * flush_flags in.
> -     */
> -    rc =3D iommu_call(hd->platform_ops, iotlb_flush_all, d);
> +    rc =3D iommu_call(hd->platform_ops, iotlb_flush, d, INVALID_DFN, 0,
> +                    flush_flags | IOMMU_FLUSHF_all);
>     if ( unlikely(rc) )
>     {
>         if ( !d->is_shutting_down && printk_ratelimit() )
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -731,18 +731,21 @@ static int __must_check iommu_flush_iotl
>                                                 unsigned long page_count,
>                                                 unsigned int flush_flags)
> {
> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> -    ASSERT(flush_flags);
> +    if ( flush_flags & IOMMU_FLUSHF_all )
> +    {
> +        dfn =3D INVALID_DFN;
> +        page_count =3D 0;
> +    }
> +    else
> +    {
> +        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> +        ASSERT(flush_flags);
> +    }
>=20
>     return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modified,
>                              page_count);
> }
>=20
> -static int __must_check iommu_flush_iotlb_all(struct domain *d)
> -{
> -    return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
> -}
> -
> static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_=
level)
> {
>     if ( next_level > 1 )
> @@ -2841,7 +2844,7 @@ static int __init intel_iommu_quarantine
>     spin_unlock(&hd->arch.mapping_lock);
>=20
>     if ( !rc )
> -        rc =3D iommu_flush_iotlb_all(d);
> +        rc =3D iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
>=20
>     /* Pages may be leaked in failure case */
>     return rc;
> @@ -2874,7 +2877,6 @@ static struct iommu_ops __initdata vtd_o
>     .resume =3D vtd_resume,
>     .crash_shutdown =3D vtd_crash_shutdown,
>     .iotlb_flush =3D iommu_flush_iotlb_pages,
> -    .iotlb_flush_all =3D iommu_flush_iotlb_all,
>     .get_reserved_device_memory =3D intel_iommu_get_reserved_device_memor=
y,
>     .dump_page_tables =3D vtd_dump_page_tables,
> };
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -147,9 +147,11 @@ enum
> {
>     _IOMMU_FLUSHF_added,
>     _IOMMU_FLUSHF_modified,
> +    _IOMMU_FLUSHF_all,
> };
> #define IOMMU_FLUSHF_added (1u << _IOMMU_FLUSHF_added)
> #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
> +#define IOMMU_FLUSHF_all (1u << _IOMMU_FLUSHF_all)
>=20
> int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>                            unsigned long page_count, unsigned int flags,
> @@ -282,7 +284,6 @@ struct iommu_ops {
>     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
>                                     unsigned long page_count,
>                                     unsigned int flush_flags);
> -    int __must_check (*iotlb_flush_all)(struct domain *d);
>     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
>     void (*dump_page_tables)(struct domain *d);
>=20
>=20


