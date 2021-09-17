Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8840F375
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 09:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189057.338536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8YC-0003SA-VQ; Fri, 17 Sep 2021 07:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189057.338536; Fri, 17 Sep 2021 07:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8YC-0003Pp-Rt; Fri, 17 Sep 2021 07:44:48 +0000
Received: by outflank-mailman (input) for mailman id 189057;
 Fri, 17 Sep 2021 07:44:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HF0=OH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mR8YB-0003Pj-0Q
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 07:44:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20b7be7e-178b-11ec-b671-12813bfff9fa;
 Fri, 17 Sep 2021 07:44:46 +0000 (UTC)
Received: from DB6PR0301CA0076.eurprd03.prod.outlook.com (2603:10a6:6:30::23)
 by AM0PR08MB4051.eurprd08.prod.outlook.com (2603:10a6:208:125::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 07:44:44 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::c7) by DB6PR0301CA0076.outlook.office365.com
 (2603:10a6:6:30::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 07:44:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 07:44:44 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 17 Sep 2021 07:44:44 +0000
Received: from 090e408896b1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A7BCED8-1C5E-4726-8D0D-CE3F0E40D62F.1; 
 Fri, 17 Sep 2021 07:44:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 090e408896b1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Sep 2021 07:44:38 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6925.eurprd08.prod.outlook.com (2603:10a6:102:13a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 07:44:35 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Fri, 17 Sep 2021
 07:44:35 +0000
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
X-Inumbo-ID: 20b7be7e-178b-11ec-b671-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oObuuc468GUHjWzYe1lyj/n7xQ24z9nhbjoLJfHBUIM=;
 b=7JC9/tYDn3+qUaWew57qTKmxuGsSQQpxdg+LF7TfOW5cVo+RTqTxMuz34xKXpk/4qQHRk2Joruw1RGFPRaUTJYcHizULeFpRmR6wkIkFlJv7qkXmOz8EE+ArjDVr1OOcwTn32NF/XBYSjjkIK39qB87KSnHXTjxgS4SD7oDY+Uw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5727b28eada941d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwOyFrZbr4pEAW8qAfZE/QIxWtvQhWyA8sqxfo5635q5BtiRXHlAGuHGuyhGieAjRZa2+YwitDROwGRahfQ1sqPE5NDDw1KUWBR+ADK7N4CiF/zlgi+cQE4rx6vWz0Y8wrwOCcUt0cq75dLoQjJvSICuJVHJOCKoz7Pz8wLoB3oObNO9mMB9QMFbUuDhJZ9Vt5alXOqeIBjdqNYc1zuNd0kTxgVqa8X6W36c5WTznf7O6fReX6sy7j5wf93Wtb9rPU0a5sxyJiroXAlhE9hmyr3w45WLaJUYChX9/dp1HwX+CdMnry+ie564cwEyNJGzpI2cSOGr/qKC9bPb2P4aYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oObuuc468GUHjWzYe1lyj/n7xQ24z9nhbjoLJfHBUIM=;
 b=agiWVinrAdcDPGbL/acZ4IJ5yQ3SrQpJ7n7pAMmSIhMYGaFRW2ZfXp+gFYy9J7oKvkG6Hou1sOpogmojvFbK0gwLXz7qAObX51iVZSPbU6WIN8HHazCRkSJLS/qE/5U7r32i62xQQDrpEXvWsfpmFoHWFTS/7txdLst8fGsWABDZ/M93Ioq7i78uPeHm9Kx0KX9GfWXEYnMmGrpf11n0fsEVQNlk0SmLkTj1B3l3QIr7FrfsHaZ6IZqHyAtoA51fhXChtyFef+mm3Aaoi26rqotbsSi3d0OTsI9tDD0aciYosHTHRXLty0KvmERlcvseWkcSk0bEdNDBhHEldWrQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oObuuc468GUHjWzYe1lyj/n7xQ24z9nhbjoLJfHBUIM=;
 b=7JC9/tYDn3+qUaWew57qTKmxuGsSQQpxdg+LF7TfOW5cVo+RTqTxMuz34xKXpk/4qQHRk2Joruw1RGFPRaUTJYcHizULeFpRmR6wkIkFlJv7qkXmOz8EE+ArjDVr1OOcwTn32NF/XBYSjjkIK39qB87KSnHXTjxgS4SD7oDY+Uw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH] modify acquire_domstatic_pages to take an unsigned int
 size parameter
Thread-Topic: [PATCH] modify acquire_domstatic_pages to take an unsigned int
 size parameter
Thread-Index: AQHXqzwMeY29ReTQ9Eqwx8Co+TX8raun2T4A
Date: Fri, 17 Sep 2021 07:44:35 +0000
Message-ID: <6B295C63-A536-4D14-8818-30DBB77B7FF8@arm.com>
References: <alpine.DEB.2.21.2109161341270.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109161341270.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 879759f0-e0a7-4740-3045-08d979af03e8
x-ms-traffictypediagnostic: PAXPR08MB6925:|AM0PR08MB4051:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB40517D1D7D80929730C14EEE9DDD9@AM0PR08MB4051.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /LQdROCaph6QeGfJ9QMm3LBTsx+RH6AWUb3rabTZJjlc+WfrQlmUlH5vt4bws7dX/52ItXClnLyBuc8UTCVR5+RUcaIXDno/OqNwVkfVkwJhv+9e3J0IqE00cpF6Lj/W7QfMTF4VxEqpOk5xvhrotkt0NqZSrQ0vuNqYkXIeuNHP63jIzsF9NVivKQl0zH9ZDeZTH3doRzTYp6yT6xvNJULy2K1QSgS0ClHLwVM0RgFsBKA6zafxBwUK1U4MVn0ZByHLhzLJIemPLjUq2CCN/Kf1MGF6FKL9yqIX+4kfBXkwrK0Rt1XukgmbTiJgsXrmt2Tc/Pmz2KkiOo/JKU1wE8DSwCRmWXjxkULaSxBAzYHRKzLWU34j0TH/YpLaK8EvCvkBXoN5ueLXwnVjSS7fI584IFyLCllJdZLCVu+yDvnAU3YG4kXX6gN6j3jFx06l2itMR9oiWDH4Zv6N7vr1Ojjchflx7DW+j4E9GlmE8PpfAu+k2NvhtrSzkS3rF5pYO82JV5B0rl/yLf67IuwALIsrzg49EIZ/OuProCPSwRKP+IrGRjYa3xbJnq1aTXWKMQhNB2mOp8xubAAFI2aYIpC5/7HXXyrzheJs8neCoPQ6A6MY3SARznwkwX5zmALnMftlhgCaEt2i8P1eArirZ1oeJWRfjP+Oe1nEqfd00iLIFr3PcJbskblO5AQIqx350pcr6n3uz9n2DyxUQLJH4pAfWPkGK1rNKX2pvSuYCIU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(66446008)(53546011)(6506007)(316002)(33656002)(8676002)(4326008)(66556008)(66476007)(66946007)(6916009)(91956017)(38100700002)(54906003)(6512007)(186003)(2906002)(2616005)(83380400001)(8936002)(6486002)(26005)(38070700005)(71200400001)(508600001)(122000001)(76116006)(36756003)(5660300002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <861FDAEEE1B1134C9F2AB0316421D331@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6925
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1472d90d-5864-42b9-d1e5-08d979aeff01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uX+Y7aXc8ZTekdGOGFMJtUiXHeWud/lD6vge0lfWDyllZFFF7gl13OfoyPREnP0n0LVy5MWBAID15nJvAx7z3BA0LgAjCyVdupy3M1PKzATZAgHAzjXOnmiit4nHjc5h0R3D9oiEP6olgpOESGw2HCWcQdYaBISNiobVvNUdJazpXTXOvt4eorMqPWxFkbhZ80uIKq+h1BRUdS3Y8kaLCpeTZq26ZWM97ulszv+igyv48fdAjdRZckF/m/FI3JTMh4IMwI+iSk1eClN+Sq/Ksj/mqnou4S2XOhYcd/aFgTzggJGZiPqxUngE+/ByCaS2ewre0ipkbuXkKS8bCEN3QBVVieEZSI2t/OigSGy7JYDsILXrKm2FLOoICk7ZpsI02dUdJ6Spwop/M7CaHTR56EV3Dbjj+6QdoXxDJcE/E9Ek4sqywFswt1rAxRnXYeJK0TttbbAvM1s9Z8f21riWItrp4tSgBI4SZHrfLPZz1f7KOLItcDV6VQWOpDMIVflwX4Yp4mgZnEgGoM27gK5jdQkzgNo3lMp1zeP2rkjZ4tzGcDZ9Z7Xy0FLzpqiG10/ojPdU5ciKI8ERiK7xSRHo+Py7evWbyM6Bm2XAvjEha9awSc+yMflbeXbkfsROjRwwxY5ltYofUiHZgeF+zD/YDcc1Ca2SQ6J6P7xN1mFLMRWKa5mFG+D0zebidxohq/TVdx1EhtKBpGNvfuBlcsLL0Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(316002)(356005)(81166007)(36756003)(2616005)(86362001)(70206006)(6862004)(47076005)(36860700001)(508600001)(82310400003)(6512007)(6486002)(8936002)(8676002)(26005)(5660300002)(6506007)(53546011)(186003)(83380400001)(4326008)(2906002)(336012)(70586007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:44:44.1351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 879759f0-e0a7-4740-3045-08d979af03e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4051

Hi Stefano,

> On 16 Sep 2021, at 21:47, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> acquire_domstatic_pages currently takes an unsigned long nr_mfns
> parameter, but actually it cannot handle anything larger than an
> unsigned int nr_mfns. That's because acquire_domstatic_pages is based on
> assign_pages which also takes an unsigned int nr parameter.
>=20
> So modify the nr_mfns parameter of acquire_domstatic_pages to be
> unsigned int.
>=20
> There is only one caller in
> xen/arch/arm/domain_build.c:allocate_static_memory. Check that the value
> to be passed to acquire_domstatic_pages is no larger than UINT_MAX. If
> it is, print an error and goto fail.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Jan, I took your suggestion of moving the check closer to where the
> value is read from DT. At that point I also took the opportunity to
> change acquire_domstatic_pages to take an unsigned int parameter
> instead of unsigned long.
>=20
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 62ab7d0ead..d233d634c1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -554,6 +554,12 @@ static void __init allocate_static_memory(struct dom=
ain *d,
>         device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize=
);
>         ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZ=
E));
>=20
> +        if ( PFN_DOWN(psize) > UINT_MAX )
> +        {
> +            printk(XENLOG_ERR "%pd: static memory size too large: %#"PRI=
paddr,
> +                   d, psize);
> +            goto fail;
> +        }
>         smfn =3D maddr_to_mfn(pbase);
>         res =3D acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
>         if ( res )
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index b9441cb06f..b64c07ae92 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2714,7 +2714,7 @@ static struct page_info * __init acquire_staticmem_=
pages(mfn_t smfn,
>  * then assign them to one specific domain #d.
>  */
> int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
> -                                   unsigned long nr_mfns, unsigned int m=
emflags)
> +                                   unsigned int nr_mfns, unsigned int me=
mflags)
> {
>     struct page_info *pg;
>=20
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index dd49237e86..5db26ed477 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -89,7 +89,7 @@ bool scrub_free_pages(void);
> /* These functions are for static memory */
> void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                           bool need_scrub);
> -int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned long =
nr_mfns,
> +int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int n=
r_mfns,
>                             unsigned int memflags);
> #endif
>=20
>=20


