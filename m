Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDD48E6D4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 09:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257575.442695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8IGg-0007Mo-F8; Fri, 14 Jan 2022 08:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257575.442695; Fri, 14 Jan 2022 08:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8IGg-0007Js-Az; Fri, 14 Jan 2022 08:49:06 +0000
Received: by outflank-mailman (input) for mailman id 257575;
 Fri, 14 Jan 2022 08:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kirj=R6=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1n8IGe-0007Jm-Kz
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 08:49:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d19315bd-7516-11ec-bcf3-e9554a921baa;
 Fri, 14 Jan 2022 09:49:03 +0100 (CET)
Received: from DB8PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:10:be::43)
 by PAXPR08MB6800.eurprd08.prod.outlook.com (2603:10a6:102:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 14 Jan
 2022 08:48:53 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::f) by DB8PR03CA0030.outlook.office365.com
 (2603:10a6:10:be::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Fri, 14 Jan 2022 08:48:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 08:48:52 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Fri, 14 Jan 2022 08:48:52 +0000
Received: from fab9949254c4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E524DC86-C63A-4DF8-81BC-4B7A1DA43A4C.1; 
 Fri, 14 Jan 2022 08:48:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fab9949254c4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Jan 2022 08:48:42 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by DB6PR08MB2839.eurprd08.prod.outlook.com (2603:10a6:6:20::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 08:48:39 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::fd4d:9e50:8051:1af8]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::fd4d:9e50:8051:1af8%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 08:48:38 +0000
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
X-Inumbo-ID: d19315bd-7516-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CEmEtYZMmqp7B4SXsmHFrCYKB+bOzrExY3Sn0S8iHI=;
 b=cX8GNGezccegeaNhPeNjhCWXHg6oqEPK1rcSINKOoaVafLNAQhO8OBXWM+MwPUcR3QgX78NqpVk4vO3z3F8g8Qs54Mk5MtblqPx2GLmNe6tUZNgsKVAAVyD+GEzYLtvDCKWdU8dX6xJpzHwp8QBgxeSC3SuSodAE9+hv06dk2Jg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsZIbreQDcFjJY3IoPv2NOinkztRTeFRdxLOcOQTrnfx55tMei3r8IwfwL6Db33nFHD1nKEkd6RMdFW0y02gnAHNBR3yDV1Ja5U0oaNyBFjhItxeQ5D6OIsoxRhekemV2y93RdJsm1WquIfvEgQuUKLhL1wlgPWAZq3Bi7oTTzelrjqbxyFNeFX/vNf49dyhKNOBjEvBbncQdpa2v7AVXiZmkWCb71afR6yTDsb18J517MdzNZuqD0QD0fBfJbR1oAdDWYEYdBH1wGIx7Wxo934dzfalgSiIHm3KvNU29oFreK8By4nUZYjPEASpbl9qDLDqX8sizxB2+KriGdjV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CEmEtYZMmqp7B4SXsmHFrCYKB+bOzrExY3Sn0S8iHI=;
 b=M9ZTsxO94iwJgiVdC46VE7F555Z73g5RCJDnT5dNePfZ9KzQZLDpzx+DVsyQi2bxNi375RZ1ErSVjzJ35mG5eplamckvM0/KLCkGPO/7xbKGbb2X+6FcP0hrAyonFomdH1IseU+A5Oau/JUu5OAZLUl+x8l//X4EJsaHEmqnLb+RtKbUF0RDz0ci/20gUMV/gKEio4TmEyZYA4rdsYdHFZhnC+6k/e90/7oIdWpPHjUqRzklmUV35mcavaOmrVt7207pBJEP6xE0Y4zqS1KmjP7IQ68ycswNBBqhSa9CPSpr2+a451qeJZcwrbwQNyhPk6ZXbKChaJMAgecQCIFFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CEmEtYZMmqp7B4SXsmHFrCYKB+bOzrExY3Sn0S8iHI=;
 b=cX8GNGezccegeaNhPeNjhCWXHg6oqEPK1rcSINKOoaVafLNAQhO8OBXWM+MwPUcR3QgX78NqpVk4vO3z3F8g8Qs54Mk5MtblqPx2GLmNe6tUZNgsKVAAVyD+GEzYLtvDCKWdU8dX6xJpzHwp8QBgxeSC3SuSodAE9+hv06dk2Jg=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Andrii Anisov <Andrii_Anisov@epam.com>
Subject: RE: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
Thread-Topic: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
Thread-Index: AQHYBt4klXrgB8v1dUiv2xognqXn6axiMcCAgAAHRNA=
Date: Fri, 14 Jan 2022 08:48:38 +0000
Message-ID:
 <VI1PR08MB305666002DC9077053E643C392549@VI1PR08MB3056.eurprd08.prod.outlook.com>
References: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
 <964D6F09-82DF-4B33-AD93-A1C04E7A7FC7@arm.com>
In-Reply-To: <964D6F09-82DF-4B33-AD93-A1C04E7A7FC7@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 04E358B008DD1C43833BC14BAB14D8C3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a94d5e60-771c-4953-76f9-08d9d73ab117
x-ms-traffictypediagnostic:
	DB6PR08MB2839:EE_|DB5EUR03FT023:EE_|PAXPR08MB6800:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB680048AD3188E93CD97D98B892549@PAXPR08MB6800.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3wkoCIe3Yx+PGhDuT4Beno3nUWJ2RU3xy5mUa65gwfx4G7UiISxk/sUzErQcMmKfc5bhb6lq1qhTTgjZC1BuEmSj7J9o9AYypHvzRuqyZPJ9BcTaYyFd8NcT5taKp4yOngPdLHqnFuYQpfScQowN+g3dfeXWkFTaeFrjkeUwHecTiiThpssb9d79uk4HcR2BlOOiERtd261EsJjSGjsSs7zs/Omlphv2PyAr6qQwpx4RWYC1bEK+4pVN+xYh70zDz2jGDZxDgCZMuN2elxUiYozX/CK8z5BVrCz13RKwWHcrWbhZo8cISs5shd9Zv2Q/uaeRPEXTfmKZ9Y+EReklWQwkabmjHluQidK7bkAZR2CcbHWrYVutsNZXVTkbYQEXcCAuA2bp/a+4+4GGtPt1arm7LG+7IXaOf4iAvnLJCL5B1rWf2g4hDtP7f8OSvylEM9LUGDjSe+5jGPAQCJXhjIi2hP5jvGGECL9TXixCr55R+Y5aFHG3/71Mucl1+Q6iPEc2FxZ2gFzahcX9JKIColyttqNOrGP9B+whnn32vRNPvyfsSNAwfij8NDCY8Pe1Op2oQiLOKaJ2+eA0ggUBLc0r63TjMapAs3SgPg4sWDAViwrXme9K9hPKA37k5hCB3WyX872YT/8xD5cGpZ7aX7hWKwhdbpO3kJa2aD76AjH6merlraTw2VFMh/j/nkI3p8FqWhMw9cH22zCvtxtA3BP+PSef1uWPVljNB28+a2Ncjd+GlGtXhDxDgR5CU1qK/awo4pTZSY+i2VzRYlbD3/8gvDQh3v/TdmgsZNjH1qg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6506007)(966005)(71200400001)(508600001)(8676002)(110136005)(2906002)(53546011)(5660300002)(83380400001)(186003)(55016003)(66556008)(9686003)(38070700005)(52536014)(38100700002)(7696005)(26005)(64756008)(66446008)(66946007)(33656002)(4326008)(66476007)(8936002)(86362001)(76116006)(316002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a06a2557-6c92-4f2e-3eca-08d9d73aa8bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EwJs8r3PRR7A3K4Zhv7r6t6tkyu3whCkpiHeBRGFurM24dp1/NRiIe+B/fl/TnYpKgC0xUD3pR2kiRmtJsSQf1psyK7mFpAF3wvVM+qtHY+XsRQqw9ypijsxXb+UGjYR1BvXaiTlIDEEoo+3eun5Cg2GEmFnlIb02ySQ9mx778O+ziur6Q62G4knqT1MEeWYovCRCIPCU3LVe1RpCM+mhnjW5jfYnKBadIjPIyk6+fABMQU6FhL59iakZzV8yWv17E6LkSqq+dYShFxn9QXrUATtrVM8eXur6VWOFClgn3wa8woEyzoA6WgICzlo1AtWcXvCctyFlhbzBsKjLCh/01ocfJIGxsRHfmRk18zl278zXy12MyaynbA4CmD4FYSxuHlst1o6QwW4LC7ATDHYm5oYRhVwwkfrRgDXUeKDcMOYi7CuUvAiSQslnJ7RtiASga356OpVsUMV5Y2k/DEArwmmRDAw5Zhg5Y0+CL53UphXDuKKi8NfluUONaMi0zdhfaV9PAMFsMl13gHkY1+YcixY3fldCeiDIV+VCb0oc0agCLUL1cFxymadVu3mKSj20tAFGO+gdwHNqYK7wqrcjOVB/+arfO8knhE5oi3868qMRtQ0I3hK/VBMF/Al+xBCKlWNRv4ywTExcIbAApQjBscfCH0UolzhhXszhlBcROei/MM+NmWkura/o2jFZw0daX5UZ5G0+e/7D1K+cWowBOT2lTex2mY2Qfku3M9iU0jWZsJBk35navRwJf/+19uINn0hgf/gKmlwsCmoNxQhfFRnycbj/AWPRpaycg/UjDw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7696005)(5660300002)(8676002)(54906003)(336012)(47076005)(316002)(2906002)(8936002)(110136005)(86362001)(966005)(70586007)(508600001)(53546011)(26005)(356005)(55016003)(6506007)(4326008)(107886003)(186003)(36860700001)(81166007)(33656002)(70206006)(83380400001)(52536014)(9686003)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 08:48:52.8740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a94d5e60-771c-4953-76f9-08d9d73ab117
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6800



> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Rahul Singh
> Sent: 2022=1B$BG/=1B(B1=1B$B7n=1B(B14=1B$BF|=1B(B 16:22
> To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Cc: xen-devel <xen-devel@lists.xenproject.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Oleksandr
> Tyshchenko <olekstysh@gmail.com>; Andrii Anisov
> <Andrii_Anisov@epam.com>
> Subject: Re: [XEN PATCH v3] xen/arm: introduce dummy iommu node for
> dom0
>=20
> Hi,
>=20
> > On 11 Jan 2022, at 11:26 am, Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> wrote:
> >
> > Currently no IOMMU properties are exposed to dom0, thus kernel by
> default
> > assumes no protection and enables swiotlb-xen, which leads to costly an=
d
> > unnecessary buffers bouncing.
> >
> > To let kernel know which device is behing IOMMU and hence needs no
[Jiamei Xie]=20
behing?  Typo

Best wishes
Jiamei Xie


> swiotlb
> > services we introduce dummy xen-iommu node in FDT and link protected
> device
> > nodes to it, using here device tree iommu bindings.
> >
> > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>=20
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
>=20
> Regards,
> Rahul
> > ---
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>
> > Cc: Andrii Anisov <Andrii_Anisov@epam.com>
> >
> >
> > Changelog:
> >
> > v3: rebased over staging & remove redundand phandle_iommu attribute,
> discussion:
> > 	https://lists.xenproject.org/archives/html/xen-devel/2021-
> 12/msg01753.html
> >
> > v2: re-use common iommu dt bindings to let guests know which devices
> are protected:
> > 	https://lists.xenproject.org/archives/html/xen-devel/2021-
> 10/msg00073.html
> >
> > xen/arch/arm/domain_build.c           | 42
> +++++++++++++++++++++++++++
> > xen/include/public/device_tree_defs.h |  1 +
> > 2 files changed, 43 insertions(+)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 6931c022a2..b82ba72fac 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -845,6 +845,12 @@ static int __init write_properties(struct domain *=
d,
> struct kernel_info *kinfo,
> >         }
> >     }
> >
> > +    if ( iommu_node && is_iommu_enabled(d) &&
> dt_device_is_protected(node) )
> > +    {
> > +        res =3D fdt_property_cell(kinfo->fdt, "iommus",
> GUEST_PHANDLE_IOMMU);
> > +        if ( res )
> > +            return res;
> > +    }
> >     return 0;
> > }
> >
> > @@ -1479,6 +1485,38 @@ static int __init make_cpus_node(const struct
> domain *d, void *fdt)
> >     return res;
> > }
> >
> > +static int __init make_iommu_node(const struct domain *d,
> > +                                  const struct kernel_info *kinfo)
> > +{
> > +    const char compat[] =3D "xen,iommu-el2-v1";
> > +    int res;
> > +
> > +    if ( !is_iommu_enabled(d) )
> > +        return 0;
> > +
> > +    dt_dprintk("Create iommu node\n");
> > +
> > +    res =3D fdt_begin_node(kinfo->fdt, "xen-iommu");
> > +    if ( res )
> > +        return res;
> > +
> > +    res =3D fdt_property(kinfo->fdt, "compatible", compat, sizeof(comp=
at));
> > +    if ( res )
> > +        return res;
> > +
> > +    res =3D fdt_property_cell(kinfo->fdt, "#iommu-cells", 0);
> > +    if ( res )
> > +        return res;
> > +
> > +    res =3D fdt_property_cell(kinfo->fdt, "phandle",
> GUEST_PHANDLE_IOMMU);
> > +
> > +    res =3D fdt_end_node(kinfo->fdt);
> > +    if ( res )
> > +        return res;
> > +
> > +    return res;
> > +}
> > +
> > static int __init make_gic_node(const struct domain *d, void *fdt,
> >                                 const struct dt_device_node *node)
> > {
> > @@ -2127,6 +2165,10 @@ static int __init handle_node(struct domain *d,
> struct kernel_info *kinfo,
> >         if ( res )
> >             return res;
> >
> > +        res =3D make_iommu_node(d, kinfo);
> > +        if ( res )
> > +            return res;
> > +
> >         res =3D make_memory_node(d, kinfo->fdt, addrcells, sizecells, &=
kinfo-
> >mem);
> >         if ( res )
> >             return res;
> > diff --git a/xen/include/public/device_tree_defs.h
> b/xen/include/public/device_tree_defs.h
> > index 209d43de3f..df58944bd0 100644
> > --- a/xen/include/public/device_tree_defs.h
> > +++ b/xen/include/public/device_tree_defs.h
> > @@ -7,6 +7,7 @@
> >  * onwards. Reserve a high value for the GIC phandle.
> >  */
> > #define GUEST_PHANDLE_GIC (65000)
> > +#define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
> >
> > #define GUEST_ROOT_ADDRESS_CELLS 2
> > #define GUEST_ROOT_SIZE_CELLS 2
> > --
> > 2.25.1
> >
> >
>=20


