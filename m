Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5FE4DD645
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 09:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291937.495809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV85H-0000cM-8o; Fri, 18 Mar 2022 08:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291937.495809; Fri, 18 Mar 2022 08:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV85H-0000Zh-3e; Fri, 18 Mar 2022 08:35:43 +0000
Received: by outflank-mailman (input) for mailman id 291937;
 Fri, 18 Mar 2022 08:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qgOC=T5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nV85F-0000ZX-HN
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 08:35:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 638c4413-a696-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 09:35:39 +0100 (CET)
Received: from DU2P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::18)
 by DB7PR08MB3626.eurprd08.prod.outlook.com (2603:10a6:10:4a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Fri, 18 Mar
 2022 08:35:36 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::8) by DU2P251CA0016.outlook.office365.com
 (2603:10a6:10:230::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18 via Frontend
 Transport; Fri, 18 Mar 2022 08:35:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 08:35:36 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Fri, 18 Mar 2022 08:35:36 +0000
Received: from 269fceba88fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F99551C2-C825-46A5-9918-BF2145C0D1B8.1; 
 Fri, 18 Mar 2022 08:35:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 269fceba88fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Mar 2022 08:35:31 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DBBPR08MB4647.eurprd08.prod.outlook.com (2603:10a6:10:f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 08:35:29 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%7]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 08:35:28 +0000
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
X-Inumbo-ID: 638c4413-a696-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dvWUAv4FHCT4HoFI8Fm91KvMGp+4dAdolOYJfFKMVc=;
 b=GX05SwO4bQQ0o9EKAcNe/Kxi1V8NVc8AYnwgbcxCwssxQ3eYD98cnnkB08hcFI1KkZ/5KB3BlUFcTer/jpFJykyW6pPBzQ+70aEcsSY13CW9klWHSBUHLaLB0Tgc0bHSSADDG3OK15efpPzeC8zg5JX930INkS2nVDcQTMk8IOQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg9j4sQRUKFugGFXDV27AuB66AyGimuFmcAC0if0ISih+ORPm43xinRqaqjEGW28VuEGXtDovW0jXgYnKZcSiSlK28c81JllJiuGvxy9RwUQnqQYuAt9SwyJde9o3OnMgJxh2xvupr6xNIEYXX/NHONaE8DFpvHBUNRA1K6kDU7HbZRxuIEhEY+oWdocZyikQqJBMS/lSj9uShs2b9OndPsY81IntDJHMqLeilUbvsUZR7f3/zNMhRXmhxyxwhrNU4P/hj6tUK3PF9ZDbQUR9ZyB0CGV89L7CnE3nVz85d50ONM/0Q9UMDiOCkiShwaFjvrkQbXlUE532scTxxP2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dvWUAv4FHCT4HoFI8Fm91KvMGp+4dAdolOYJfFKMVc=;
 b=N3+ZPVD+YaR+vmYHRCYpTFaTN8xyyeC5csmhWP4PdQlgvoVWbTtZ9sqvtWtLm+TgOXJPtT3bMkNQLx20SnE4E2+7OOInN/LVSEaTtAtnrSFLo4zBUIGOL/TjUetXcoBVd3Sa4bzem/fItwuwHmLWWHJtnDrj0qbjQVn2jSzBJ8NTLqlrvDyCumotyRgma6LTJ2nQWA/5fI3F5EZfAaHrxVDvhUr5XDgC80N/tIpXGHjq8t7UHRYlFUjDBkNeh1v/MOP8q2+MPjylt0e+rVDNp5KFqSX5gil4v1PJlgBn+YVBzWOdZSjB3iTqsS+oNU+Nq6vqSLXe5ROI+P54CT58IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dvWUAv4FHCT4HoFI8Fm91KvMGp+4dAdolOYJfFKMVc=;
 b=GX05SwO4bQQ0o9EKAcNe/Kxi1V8NVc8AYnwgbcxCwssxQ3eYD98cnnkB08hcFI1KkZ/5KB3BlUFcTer/jpFJykyW6pPBzQ+70aEcsSY13CW9klWHSBUHLaLB0Tgc0bHSSADDG3OK15efpPzeC8zg5JX930INkS2nVDcQTMk8IOQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd
	<nd@arm.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 03/13] xen/arm: allocate static shared memory to
 dom_shared
Thread-Topic: [PATCH v1 03/13] xen/arm: allocate static shared memory to
 dom_shared
Thread-Index: AQHYNQ8A9jAPAWQtaUOgnVl8EcC+TqzEbZKAgABaDWA=
Date: Fri, 18 Mar 2022 08:35:28 +0000
Message-ID:
 <DU2PR08MB732581E1261462D7CA5867BFF7139@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-4-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2203171707200.3497@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203171707200.3497@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5345C1B29F078444BDD6AEB98E16B28C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8acd9eda-06fb-429d-0383-08da08ba4674
x-ms-traffictypediagnostic:
	DBBPR08MB4647:EE_|DB5EUR03FT034:EE_|DB7PR08MB3626:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3626F42E3E43F3F87804E448F7139@DB7PR08MB3626.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NpprBJAC0AqUi2oKG2feivDb4xohuBMTDj8MhZWKyh+GY/V+uVtSsUvV969CiwIf0/hRiPBfmt+R+3yFsP9LFAK+5bY1Vw+UXHybX9sfkkQySc57JK2KswB7uBdEn5q0Ek8NthHlVXhj0Yrh0YACWKsgqIgG40N19EIpgY14gQTnjX3KJKJkMg27FjbfGeu5xApwfvVdDep20jIqQrxtwAHzCiFXshCEuFdOjgkPkirHHxqXW735ePLvYByCegNOdo3APdDPmfqyhM8S0/5isdm3eYgBmNbVUdlrDTgPseNrqwza8MCMKoNrcLozYB7y+KK2HnFWPSfwsBQGxC71uMEXDGbYaI4yPHGZrKP/9GcnVrhAJaQWZERswD9FbTwceWmVQWXiJqR58tt7j3wdfKOBa82jnaCEVUkwBJinuNyH3ollQ6kjWGHk//n3W/+kD+VJDe/CeQPXq8/a+CMcj0VajxUgNPyFn3vAdcz7tKNqZRVeRqmEDhB0my79Q9lbO7yfH3O7A4Ke71HL1VAyejTeELlN+A/6+J9lfbjqkhI4mrjXrAoESvsQG6YIkEp15wybO1Tq8y/gpwwpOtAMrqcooHDMYhnp6jSXuyS/aW4/jyTRioYczbDYyieNbjgv2LEiKJdvQsc1XLVFtjJ3ASuTViy0S+q7ckoZDX7nD6SUtv9pCEFpUWC5K6stKnTc+JNGgEVdRfTl5NAw0jTXng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(8936002)(4326008)(52536014)(55016003)(38070700005)(508600001)(66446008)(8676002)(66556008)(64756008)(66476007)(66946007)(76116006)(6506007)(186003)(7696005)(53546011)(33656002)(71200400001)(26005)(54906003)(6916009)(9686003)(316002)(86362001)(5660300002)(38100700002)(2906002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4647
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	684897d0-8360-4ba3-26fe-08da08ba41ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cp7MG/7SHEME+fW+r9Nx8C88HXq4nounHtV8ahA8x8D0t0TYiaiDfxSgLVRn1jEpJFiV9j6cG41+ovmyEhq/5LU3qVpO9FLqGajCrKfpZHLp3F3LM+oUGNHV0BgP6erF8jpObYV3uN9UDf7m+iq/s33CKV8/Z/lZwZteWCLesBJCLE4KfeFwxSXO3qQRdXZlUKfd4Cb/ZWQRZj3MoBkAwVuqVIeMGhmsQx0SCHvP/kr78jWS7ulycXeFdkoGVWy3fujt90v5yjGFXI2cek++TsLVDo+jMxrPSdw9llDxeoSz5piNc98JEX0ZtJnufvPxbFsYlSQVujN8ybA5fFH4Cw8qU76ZrC3nQI5CWwn8qM0+HNkgn8Hq/KSiOFka2cGwXLqAQ8NLGy80zsz00DpxCUPmgN2EEJATyVEdnHx3u0a6/OFpJv5K2V5QcMfJPDmlq3kODSehamsP0qxmOMRtgq/i3/08ogbJSVgRh4MtFjLH5EutjA2mdn0nB1n/JQFMLEhkp6MfWZiLEF9g1GIJoEds9wNlD9mozeKurNb6Qd9ktNSEOOgHVcPbmhkTuhPcQfF5RBOhsRUC8UTrqj3tjj9B+uEoSF+OCSUyitLEnTDHpqCWeGf89xjhfjiC+DEY2WIqTSuxAiSIqy3MDLsYsYqqhrRS+86UDGwaIsG/p5LdHzhV99CtA7UVA6gSiOFT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(33656002)(336012)(36860700001)(83380400001)(55016003)(54906003)(47076005)(86362001)(53546011)(9686003)(82310400004)(6506007)(508600001)(7696005)(26005)(186003)(107886003)(70206006)(70586007)(40460700003)(8936002)(4326008)(6862004)(356005)(2906002)(81166007)(5660300002)(52536014)(316002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 08:35:36.5293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acd9eda-06fb-429d-0383-08da08ba4674
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3626

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Friday, March 18, 2022 10:00 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; nd <nd@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v1 03/13] xen/arm: allocate static shared memory to
> dom_shared
>=20
> On Fri, 11 Mar 2022, Penny Zheng wrote:
> > From: Penny Zheng <penny.zheng@arm.com>
> >
> > This commit introduces process_shm to cope with static shared memory
> > in domain construction.
> >
> > This commit only considers allocating static shared memory to
> > dom_shared when owner domain is not explicitly defined in device tree,
> > the other scenario will be covered in the following patches.
> >
> > Static shared memory could reuse acquire_static_memory_bank() to
> > acquire and allocate static memory.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> >  xen/arch/arm/domain_build.c | 116
> > +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 115 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 8be01678de..6e6349caac 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -527,7 +527,8 @@ static mfn_t __init
> acquire_static_memory_bank(struct domain *d,
> >      mfn_t smfn;
> >      int res;
> >
> > -    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
> > +    if ( cell )
> > +        device_tree_get_reg(cell, addr_cells, size_cells, pbase,
> > + psize);
>=20
> Why this change?
>=20

This helper is also used for acquiring static memory as guest RAM for stati=
cally configured
domain.

And since we are reusing it for static shared memory, but try to avoid pars=
ing the property
here, the "xen,static-shm" property getting parsed in different ways in pro=
cess_shm.
So this change is needed here.

And I think I need to add in-code comment to explain. ;)

>=20
> >      ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize,
> PAGE_SIZE));
> >      if ( PFN_DOWN(*psize) > UINT_MAX )
> >      {
> > @@ -751,6 +752,113 @@ static void __init assign_static_memory_11(struct
> domain *d,
> >      panic("Failed to assign requested static memory for direct-map
> domain %pd.",
> >            d);
> >  }
> > +
> > +#ifdef CONFIG_STATIC_SHM
> > +static __initdata DECLARE_BITMAP(shm_mask, NR_MEM_BANKS);
> > +
> > +static mfn_t __init acquire_shared_memory_bank(struct domain *d,
> > +                                               u32 addr_cells, u32 siz=
e_cells,
> > +                                               paddr_t *pbase,
> > +paddr_t *psize) {
> > +    /*
> > +     * Pages of statically shared memory shall be included
> > +     * in domain_tot_pages().
> > +     */
> > +    d->max_pages +=3D PFN_DOWN(*psize);
> > +
> > +    return acquire_static_memory_bank(d, NULL, addr_cells, size_cells,
> > +                                      pbase, psize);
> > +
> > +}
> > +
> > +static int __init allocate_shared_memory(struct domain *d,
> > +                                         u32 addr_cells, u32 size_cell=
s,
> > +                                         paddr_t pbase, paddr_t psize,
> > +                                         paddr_t gbase) {
> > +    mfn_t smfn;
> > +    int ret =3D 0;
> > +
> > +    printk(XENLOG_INFO "Allocate static shared memory
> BANK %#"PRIpaddr"-%#"PRIpaddr"\n",
> > +           pbase, pbase + psize);
> > +
> > +    smfn =3D acquire_shared_memory_bank(d, addr_cells, size_cells, &pb=
ase,
> > +                                      &psize);
> > +    if ( mfn_eq(smfn, INVALID_MFN) )
> > +        return -EINVAL;
> > +
> > +    ret =3D guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
> PFN_DOWN(psize));
> > +    if ( ret )
> > +    {
> > +        dprintk(XENLOG_ERR, "Failed to map shared memory to %pd.\n", d=
);
> > +        return ret;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static int __init process_shm(struct domain *d,
> > +                              const struct dt_device_node *node) {
> > +    struct dt_device_node *shm_node;
> > +    int ret =3D 0;
> > +    const struct dt_property *prop;
> > +    const __be32 *cells;
> > +    u32 shm_id;
> > +    u32 addr_cells, size_cells;
> > +    paddr_t gbase, pbase, psize;
> > +
> > +    dt_for_each_child_node(node, shm_node)
> > +    {
> > +        if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-mem=
ory-
> v1") )
> > +            continue;
> > +
> > +        if ( !dt_property_read_u32(shm_node, "xen,shm-id", &shm_id) )
> > +        {
> > +            printk("Shared memory node does not provide \"xen,shm-id\"
> property.\n");
> > +            return -ENOENT;
> > +        }
> > +
> > +        addr_cells =3D dt_n_addr_cells(shm_node);
> > +        size_cells =3D dt_n_size_cells(shm_node);
> > +        prop =3D dt_find_property(shm_node, "xen,shared-mem", NULL);
> > +        if ( !prop )
> > +        {
> > +            printk("Shared memory node does not provide \"xen,shared-m=
em\"
> property.\n");
> > +            return -ENOENT;
> > +        }
> > +        cells =3D (const __be32 *)prop->value;
> > +        /* xen,shared-mem =3D <pbase, psize, gbase>; */
> > +        device_tree_get_reg(&cells, addr_cells, size_cells, &pbase, &p=
size);
> > +        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize,
> PAGE_SIZE));
> > +        gbase =3D dt_read_number(cells, addr_cells);
> > +
> > +        /* TODO: Consider owner domain is not the default dom_shared. =
*/
> > +        /*
> > +         * Per shared memory region could be shared between multiple
> domains.
> > +         * In case re-allocating the same shared memory region, we use=
 bitmask
> > +         * shm_mask to record whether this shared memory region has ev=
er
> been
> > +         * allocated already.
> > +         */
> > +        if ( !test_bit(shm_id, shm_mask) )
> > +        {
> > +            /*
> > +             * Allocate statically shared pages to the default dom_sha=
red.
> > +             * Set up P2M, and dom_shared is a direct-map domain,
> > +             * so GFN =3D=3D PFN.
> > +             */
> > +            ret =3D allocate_shared_memory(dom_shared, addr_cells, siz=
e_cells,
> > +                                         pbase, psize, pbase);
>                                                           ^gbase
>=20
> The last parameter should be gbase instead of pbase?
>=20

Yes, and since dom_shared is a direct-map domain, GFN =3D=3D PFN, so pbase =
should be
ok here. I mentioned it on comments.

And Why I make dom_shared direct-map domain is that in this way we don't ne=
ed to decode
owner GFN when doing foreign memory mapping for borrower domain.

>=20
> Reading this patch is not clear that only the "owner" code path is
> implemented here. The "borrower" code path is implemented later and
> missing in this patch. I think it would be good to clarify that in the co=
mmit
> message.
>=20
> Under this light, allocate_shared_memory is supposed to be only called fo=
r the
> owner. I think we should probably mention that in the in-code comment too=
.
>=20

Yes, only owner domain could allocate memory, I'll add it to in-code commen=
t.

> I don't think we need to define a second copy of shm_mask. Can we reuse t=
he
> one in bootfdt.c?
>=20

Yes, maybe I should reuse than reintroduce. And before using the bitmap her=
e,
I need to clear it totally to clean away all the stale info from bootfdt.c.

> Or we could get rid of shm_mask entirely here if we check whether the pag=
es
> were already allocated in the owner p2m.
>=20
>=20

Hmm, that means that we need to do the page walk each time? That's kinds of
time-consuming, or am I missing some convenient way to check?

> > +            if ( ret )
> > +                return ret;
> > +
> > +            set_bit(shm_id, shm_mask);
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +#endif /* CONFIG_STATIC_SHM */
> >  #else
> >  static void __init allocate_static_memory(struct domain *d,
> >                                            struct kernel_info *kinfo,
> > @@ -3150,6 +3258,12 @@ static int __init construct_domU(struct domain *=
d,
> >      else
> >          assign_static_memory_11(d, &kinfo, node);
> >
> > +#ifdef CONFIG_STATIC_SHM
> > +    rc =3D process_shm(d, node);
> > +    if ( rc < 0 )
> > +        return rc;
> > +#endif
> > +
> >      /*
> >       * Base address and irq number are needed when creating vpl011 dev=
ice
> >       * tree node in prepare_dtb_domU, so initialization on related
> > variables
> > --
> > 2.25.1

Cheers,

---
Penny Zheng
> >

