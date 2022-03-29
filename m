Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B604EA975
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 10:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295726.503339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ7MW-0000pr-HC; Tue, 29 Mar 2022 08:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295726.503339; Tue, 29 Mar 2022 08:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ7MW-0000mZ-Dh; Tue, 29 Mar 2022 08:38:00 +0000
Received: by outflank-mailman (input) for mailman id 295726;
 Tue, 29 Mar 2022 08:37:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5xw=UI=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZ7MU-0000mT-C3
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 08:37:58 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe07::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86ba0de7-af3b-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 10:37:54 +0200 (CEST)
Received: from AM6PR0502CA0045.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::22) by PA4PR08MB6319.eurprd08.prod.outlook.com
 (2603:10a6:102:e8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 08:37:52 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::8f) by AM6PR0502CA0045.outlook.office365.com
 (2603:10a6:20b:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23 via Frontend
 Transport; Tue, 29 Mar 2022 08:37:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Tue, 29 Mar 2022 08:37:51 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Tue, 29 Mar 2022 08:37:51 +0000
Received: from 14a08360126b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4702F844-F5A6-4B12-9806-981F26428B2B.1; 
 Tue, 29 Mar 2022 08:37:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14a08360126b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 29 Mar 2022 08:37:41 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB3768.eurprd08.prod.outlook.com (2603:10a6:20b:90::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Tue, 29 Mar
 2022 08:37:37 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%8]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 08:37:36 +0000
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
X-Inumbo-ID: 86ba0de7-af3b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRg7G216nHS6yetNGd8SLLL7jD/ZBrXmMDH8Qr0ul/o=;
 b=HD3eb2CvZE6kVaw/8pssyJuMoBzC9Ndu+ocvMwTV9RyxYWCm/EHODnPb5pHjmuG0Qo4dVaJKaJJ1WlhunUDc/forz+4kie9S4WmpOiXZGX75yUDtVQs8vaL4vAtXcsFn2EpYowXx0jJP+2Rt2xvafkZ588tQFeHTKiMkYTX/5T8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3CzPUYxW4uG+w0ZpBM0R91AZ1Jw52qKQjXsVv0gwYFGRglSnLlPvOOk4l+sq1i+r+6lrMvkLl8pxJLx55YyWLEvZPWWdWT9vaIGkxJ798Cp7fWx0NqKc5PNQi8jA2znJ4I4rRS4/pD+qD1+133A5WZun/fSBQzvhjQsefKrPP6KBiHwKz8+Gscc6XiQuXv64iVkghyPwP5cXFO0S4Ayw3VG7cdGS+67/7Go1lbidKfQHgvcfx+PJMl/esnEXJvmpL4+/m+AaWz4M4Sd16EUbZoEfyxYT3HwSl3JtYw3ZRZMEHJQqsQMmKHEbcmU977pb3PSSkopK0i/uOCdKv200g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRg7G216nHS6yetNGd8SLLL7jD/ZBrXmMDH8Qr0ul/o=;
 b=XItTbGSv3fKD4ti1rbUAumvR+WE9Z5cUgL6ldzWcd6qPZxgMxDO17HjpTKmzPugLwTkjHV1pzrgQSh9WjQJ7zGTYPhsIsc8i9aW8uJ7n7Adnvn2jb7Ymad8oGCNB99dEp3G2y8b2N4gOTeXkpjmi7YtbDWS6IpSxGZNo7A/n6B0Ud/vp2oevUtwrroME+gW3wQRjELNlfOE9le+G1ud/r7DPrgdSkRXETd7FoS+2er7fQDHdBApWr1vZyHh1yRTPQi1kg3hXq5/5/2yPU1flF//aBYOu2dzpPc3sRHCOHIrmpixLGjVNg4WZ2nhtoS+FpP+kjJXyG+OHKmQqawmFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRg7G216nHS6yetNGd8SLLL7jD/ZBrXmMDH8Qr0ul/o=;
 b=HD3eb2CvZE6kVaw/8pssyJuMoBzC9Ndu+ocvMwTV9RyxYWCm/EHODnPb5pHjmuG0Qo4dVaJKaJJ1WlhunUDc/forz+4kie9S4WmpOiXZGX75yUDtVQs8vaL4vAtXcsFn2EpYowXx0jJP+2Rt2xvafkZ588tQFeHTKiMkYTX/5T8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd
	<nd@arm.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 11/13] xen/arm: store shm-info for deferred foreign
 memory map
Thread-Topic: [PATCH v1 11/13] xen/arm: store shm-info for deferred foreign
 memory map
Thread-Index: AQHYNQ8NTSqyRn0yQkWZiq3cl6V7sqzEbfcAgBGfRIA=
Date: Tue, 29 Mar 2022 08:37:36 +0000
Message-ID:
 <DU2PR08MB732592AD40BAA48F390445AAF71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-12-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2203171831410.3497@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203171831410.3497@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8C1B473F77499D429BF61F143BA13B6E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a3b9c2b6-f73e-42c7-3adb-08da115f69bb
x-ms-traffictypediagnostic:
	AM6PR08MB3768:EE_|AM5EUR03FT013:EE_|PA4PR08MB6319:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB63197063B30181776E3298F7F71E9@PA4PR08MB6319.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qXROoi1OzLZhtdO9cM7wOTRkAW2+bBcnnpq5IcPKYcqaWPjqxBaBFHj+DRATwV8HW8+4qkmDoTPXcFYRyy5s+rMa4pb9F9oVSXByYkhhTdbZ2SB5yLJXvvEcuiXL1weDwNqFwWJo5LKucElq/Oqjj4VwC6SuvNlaA4JNfjTyC94VlkALHjl2ThI6wTVWif7LhOx1HRADcwgynnSMyY+xaAkRaHhA1Ee7wcD24wUSoqlt8mNLHv10WhG+hV5jhHNvGmGEGSkkNq3cygWV+QFqy2wpRHEU12p3y2SEgHXhmqCWpRNOZCo0c7hEfntH3sPexx56GLQwrLj6oviLKqzZvsTPX7/A3AdWhsMgRGUzREyAcbXKOBqtlV3qSrpx2UkdZHG8x/gJyj90pLBbUgsN+90+y5PwjD6G3uCZiaXhEEr391YnDkn7tJVBMfp2B9/0SECmWr1vEAsb8IODi+pz8FvFfPsabIZZ7e9sPGlFRPSA9As+lj9D7rcQCVDv/8VamNMC+b+B7H4mL8dX5z08Oav38l7PEw0BfFWiX8CNT2skZarvx13/OdrVV5DIFjNM4cR0Y1JnFy1EmEMH+HiQrVggkjWozVRDH1yAp+3zGmKBCWEDsffrcACXIG/xLhDffYgHvMRK3vMDAY4oCrPGp7gEuYPG6h5fJkpiWUoHhhA/gnJ59vRA0ef84sVN9kaVAo+Xee4MVsih9JcoA+/Nhg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(8676002)(76116006)(66556008)(4326008)(71200400001)(66946007)(122000001)(86362001)(52536014)(55016003)(9686003)(8936002)(5660300002)(38100700002)(508600001)(2906002)(38070700005)(26005)(33656002)(54906003)(6916009)(186003)(53546011)(7696005)(83380400001)(316002)(66476007)(66446008)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3768
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3faf15a3-38ff-4a4b-fd01-08da115f609f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bUER6CXovBHJ+v1jojJ6oyL+dboZvX8o28LSZv8Z+aozy6sKWgFaW3Z/6nXWTPtSPmwRJhmTNJj3Dcekh8GjoBPO4uZBaxySeWO5de66tcHunjc5lmn52GOLlTJXiuVVECwdYjQuWd9W11tx9QcgC7IuEM1Krgghw69CK0+kfNGi0V+p/RswzFtOGt7wYz7/BPuFBpc91yi+V66IxgYk5i+1jxfQNdumifBXkWmyqj/wgb5kiOkyijRkIaY7rBkGREUxQuhvC8pG/Osp6ri7slrVN66PD2t9OB2q+E6ti/9CG8C5q2gPqF1wp2VL9YPjJ0Gj+OxGz9xPsnCPEwmc1rm0fMZS32iOWT45ZWOYO9/6PVcm6rUp1yI0iHPM0VxFDXutYRRgQATP+tCoaCh123jDKN831rGCHn5oDK3jMK7RvHUEFYrab8iw4yookQ+pX7rB4mIoHCGlyD855/wwx0ILKDHLukBnHaYFtYT3+7mNRSiYVc4e2WURmL9NkQGBlPuAHYsV6i9WTnAbB9ItZQvmzb5YumGQQgsv9VZgiibGAdRVNcIIyMqaKI2dTw8u+Q+Q75+P3IB9Fai6YgZjdCA4W+Qbohn47VjD/dI484r8iyoUBsnAdhaSXvq7rdvYw48pGHZbWCIgKm6fngtuLhzBQU5v3v8/shk6w9S8urRxr/DodsZBV0zv5crY/RQ4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(55016003)(107886003)(82310400004)(54906003)(336012)(70586007)(8676002)(316002)(186003)(81166007)(508600001)(356005)(4326008)(70206006)(2906002)(33656002)(7696005)(36860700001)(6862004)(5660300002)(47076005)(53546011)(6506007)(83380400001)(9686003)(52536014)(8936002)(26005)(40460700003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 08:37:51.8926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b9c2b6-f73e-42c7-3adb-08da115f69bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6319

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Friday, March 18, 2022 10:01 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; nd <nd@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v1 11/13] xen/arm: store shm-info for deferred foreig=
n
> memory map
>=20
> On Fri, 11 Mar 2022, Penny Zheng wrote:
> > From: Penny Zheng <penny.zheng@arm.com>
> >
> > In a few scenarios where owner domain, is defined after borrower
> > domain in device tree configuration, then statically shared pages
> > haven't been properly allocated if borrower domain tries to do foreign
> > memory map during domain construction.
> >
> > In order to cover such scenario, we defer all borrower domains'
> > foreign memory map after all domain construction finished, then only
> > need to store shm-info during domain construction.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> >  xen/arch/arm/domain.c             |  3 +++
> >  xen/arch/arm/domain_build.c       | 34 ++++++++++++++++++++++++++++++-
> >  xen/arch/arm/include/asm/domain.h | 25 +++++++++++++++++++++++
> >  3 files changed, 61 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c index
> > f0bfd67fe5..73ffbfb918 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -47,6 +47,9 @@ DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> >
> >  #ifdef CONFIG_STATIC_SHM
> >  struct domain *__read_mostly dom_shared;
> > +
> > +shm_info_t shm_list[NR_MEM_BANKS];
>=20
> Instead of adding shm_list, maybe we can we re-use mem->bank
> (bootinfo.reserved_mem)?
>=20
> It is already storing the physical address and size (added in patch #1 wi=
th
> process_shm_node). We should be able to find the other info from the mfn:
> mfn_to_page, page_get_owner, mfn_to_gfn. At most, we need to mark the
> memory bank as shared and we could do that with another field in struct
> membank.
>=20
>=20
> > +DECLARE_BITMAP(shm_list_mask, NR_MEM_BANKS);
>=20
> This is the third bitmask we introduce :-)
>=20
> Can we narrow it down to a single bitmask? Maybe we don't need it at all =
if we
> switch to using bootinfo.mem.bank.
>=20
>=20
> >  #endif
> >
> >  static void do_idle(void)
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 7ee4d33e0b..4b19160674 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -771,7 +771,7 @@ static mfn_t __init
> > acquire_shared_memory_bank(struct domain *d,
> >
> >  }
> >
> > -static int __init allocate_shared_memory(struct domain *d,
> > +static int __init allocate_shared_memory(struct domain *d, u32
> > +shm_id,
>=20
> No need for it to be u32?
>=20
>=20
> >                                           u32 addr_cells, u32 size_cell=
s,
> >                                           paddr_t pbase, paddr_t psize,
> >                                           paddr_t gbase) @@ -795,6
> > +795,18 @@ static int __init allocate_shared_memory(struct domain *d,
> >          return ret;
> >      }
> >
> > +    /*
> > +     * If owner domain is not default dom_shared, shm-info of owner do=
main
> > +     * shall also be recorded for later deferred foreign memory map.
> > +     */
> > +    if ( d !=3D dom_shared )
> > +    {
> > +        shm_list[shm_id].owner_dom =3D d->domain_id;
> > +        shm_list[shm_id].owner_gbase =3D gbase;
> > +        shm_list[shm_id].size =3D psize;
> > +        set_bit(shm_id, shm_list_mask);
> > +    }
> >      return ret;
> >  }
> >
> > @@ -962,6 +974,26 @@ static int __init process_shm(struct domain *d,
> >              if ( ret )
> >                  return ret;
> >          }
> > +        else
> > +        {
> > +            if ( strcmp(role_str, "borrower") =3D=3D 0 )
> > +            {
> > +                /*
> > +                 * In a few scenarios where owner domain, is defined a=
fter
> > +                 * borrower domain in device tree configuration, stati=
cally
> > +                 * shared pages haven't been properly allocated if bor=
rower
> > +                 * domain here tries to do foreign memory map.
> > +                 * In order to cover such scenario, we defer all borro=
wer
> > +                 * domains'foreign memory map after all domain constru=
ction
> > +                 * finished, and only store shm-info here for later us=
e.
> > +                 */
> > +                shm_list[shm_id].borrower_dom[shm_list[shm_id].nr_borr=
ower] =3D
> > +                                                                d->dom=
ain_id;
> > +                shm_list[shm_id].borrower_gbase[shm_list[shm_id].nr_bo=
rrower] =3D
> > +                                                                gbase;
> > +                shm_list[shm_id].nr_borrower++;
> > +            }
> > +        }
>=20
> Maybe we don't need to defer this at all. guest_physmap_add_shm does only
> two things:
>=20
> 1) get a page ref using the owner domain
> 2) add page to borrower p2m
>=20
>=20
> We can do 2) straight away even if the owner is not yet allocated.
>=20
> For 1), we need to get the right amount of references when the owner is
> allocated (which could be after the borrowers).
>=20
> Keeping in mind that we have already parsed all the info in
> xen/arch/arm/bootfdt.c:process_shm_node, I wonder if we can add a field t=
o
> mem->bank[mem->nr_banks] to keep a count of the number of borrowers.
>=20
> Then when we allocate the page to the owner here, we just get as many
> additional reference as the number of borrowers.
>=20
> This would:
> - add a field to bootinfo.reserved_mem
> - remove the need for shm_list
> - remove the need for shm_list_mask
> - remove the need for the deferral
>=20
> Just trying to make things simpler :-)
>=20

Thanks for the detailed comments.
Here is what I thought and understood, PLZ correct me if I'm wrong. ;)
'''
> For 1), we need to get the right amount of references when the owner is
> allocated (which could be after the borrowers).
'''
We could add another field `nr_shm_borrowers` in struct membank to
keep a count of the number of borrowers, which is also the number of
the reference count.=20
And like you said, it shall be done in xen/arch/arm/bootfdt.c:process_shm_n=
ode.
The only shortcoming here is that we need to iterate the parsed shm
mem banks each time to do the increment, since we used shm_mask
at first to treat space with time, but it really could decrease the
complexity here and remove all the defer codes.

But here is another concern about the shm_list. Another reason why I
created shm_list is that when destroyed domain is an owner domain,=20
we need to unmap shared memory for all borrower domains too. IMO,
so that it fits the definition of owner and borrower. It is also
what commit "xen/arm: unmap foreign memory mapping when
destroyed domain is owner domain" is trying to solve.

we need a way to find all borrower domains info, when you
only know the owner domain.
Based on your suggestion, I suggest to add new field
` domid_t *shm_borrower_dom` and `paddr_t *shm_borrower_gbase`
in struct membank. And both two fields are going to be allocated and set
during domain construction phase xen/arch/arm/domain_build.c:process_shm.

Another thing is that maybe we could not store all above shared mem
banks in bootinfo.reserved_mem, since it is only valid during boot time,
and we need that info also for domain deconstruction at runtime.
Another struct meminfo shm_list may still also be needed.

BTW, I suggest that the index of shm_list.bank is shm_id
In case user abuse it in device tree configuration, we let xen to allocate.
In xen/arch/arm/bootfdt.c:process_shm_node, each time parsing a new
shm node, iterate the whole shm_list and only if the physical
address and size of all entries are not matched, we allocate a new bank for=
 the
shm node. =20
=20
>=20
> >          /*
> >           * Record static shared memory region info for later setting
> > diff --git a/xen/arch/arm/include/asm/domain.h
> > b/xen/arch/arm/include/asm/domain.h
> > index 6df37d2c46..1c0f2e22ca 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -10,6 +10,7 @@
> >  #include <asm/gic.h>
> >  #include <asm/vgic.h>
> >  #include <asm/vpl011.h>
> > +#include <asm/setup.h>
> >  #include <public/hvm/params.h>
> >
> >  struct hvm_domain
> > @@ -33,6 +34,30 @@ enum domain_type {
> >
> >  #ifdef CONFIG_STATIC_SHM
> >  extern struct domain *dom_shared;
> > +
> > +/* Maximum number of borrower domains. */ #define NR_SHM_DOMAIN
> 32
> > +/*
> > + * shm_list is indexed by unique identifier "xen,shm-id", but it only
> > +stores
> > + * a subset of static shared memory regions, of which owner domain is
> > +not the
> > + * default dom_shared.
> > + * shm_list_mask bitmask is to record the position of these static
> > +shared
> > + * memory regions.
> > + * Per bit represents a entry in shm_list, and setting it 1 means the
> > + * static shared memory region here is owned by a specific domain,
> > +then bit 0
> > + * means the static shared memory region here is either owned by the
> > +default
> > + * dom_shared or no static shared memory region here at all.
> > + */
> > +typedef struct {
> > +    domid_t owner_dom;
> > +    paddr_t owner_gbase;
> > +    paddr_t size;
> > +    domid_t borrower_dom[NR_SHM_DOMAIN];
> > +    paddr_t borrower_gbase[NR_SHM_DOMAIN];
> > +    unsigned long nr_borrower;
> > +} shm_info_t;
> > +extern shm_info_t shm_list[NR_MEM_BANKS]; extern unsigned long
> > +shm_list_mask[BITS_TO_LONGS(NR_MEM_BANKS)];
> >  #else
> >  #define dom_shared NULL
> >  #endif
> > --
> > 2.25.1
> >

