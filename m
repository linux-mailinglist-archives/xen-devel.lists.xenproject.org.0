Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E285D478942
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 11:53:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248543.428697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAr4-0008MV-LW; Fri, 17 Dec 2021 10:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248543.428697; Fri, 17 Dec 2021 10:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myAr4-0008KL-I7; Fri, 17 Dec 2021 10:52:50 +0000
Received: by outflank-mailman (input) for mailman id 248543;
 Fri, 17 Dec 2021 10:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myAr3-0008KF-9n
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 10:52:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f9112c-5f27-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 11:52:47 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BH9pipi002660;
 Fri, 17 Dec 2021 10:52:37 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d0jxw90ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 10:52:37 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR3PR03MB6362.eurprd03.prod.outlook.com (2603:10a6:102:7e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 10:52:33 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 10:52:33 +0000
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
X-Inumbo-ID: 77f9112c-5f27-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSlqhmf2mbFhfwjkSwuhQ6iqS6mGAg9Dtl8FRfTE8PLHfldj4obSELjP+wFVZycxzIPsjEMG4dpblT1SLrvMP3gAgy+PnU8XPFGEjJTa6DnS1wh+jnWYANUPkHdmR2x+Sei8s+1+AH5o+lkfbIxfDLw8llJB5w8oFzKBNMD8XNv6Xvf2Kqu09B84vL2ohXDnshnH7b1rRl/s3JhThHI+nveQHj0xh/dpXJfyQpsHy4vd3FoP8esBgV8HJ4yIKdZMLPUJiIWChJ3nWcfy+B4tUeIszvMZz+gHunW6tJydn8qAyIm3m2ZtjfD2Aehm3CqnFSMbTSI3efVjP0pXpp0XKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk+Gk4ItT6RvNhHyYJbyNOPGL3wFDVyDsHbr7R3sP4g=;
 b=DU1CslgN5LL0JDFs61R37lJ0ilFdkdjIp7V5EBk5cXFne6a5Ohh5cCtcswGnSdPSMWANE4Qm5rw93a8JqbZwzrvSMcsM/N/mnqo7wNaewMkx8Mg9IgWJmkFOYC5fzg0bmnFi+OUJPq86ID2joN29R+q9WCYwwirkRSJ3cHvfUEY3lyjEVlBaqbxO19amJ3D3S0Ym/RTxIiPrD7HwqFI0v73WdYALMEbtRBw2s5vPS3k/CXo2yY5gyaveM1uWyNOACgMFBdKwi5OfHR+VsOT5U33lULrBALAqg0a8C8kdJCUKCteU7acVb9kMz8pABjK3U8c71Jj/xif+4rSuHuXLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk+Gk4ItT6RvNhHyYJbyNOPGL3wFDVyDsHbr7R3sP4g=;
 b=ZyhUcM1KEGyRsYNYSVi+pHwPZzr8oOle9nVXFzAGBu1dA6dfOoMaW3S6dKf2XC/r5Z98URVUvBsGh6RrJkCxkumWUjGB3Aa6KkEyxvqZ6/j0TYo/5HyaGvUczsVoHtV5JttXT9YXHdAaTpGbK17P3C7+PFc4Sy5iPxdh5BokisBUsaQqkeskBBfwdwyqmlKZ3CLQzXN4J2LtQSEiRpngfyeDYLtj8EngYOgOordM3hiWSlJPLTYPT4TBPV/3ZrvbURT2KnWpOtVXh5r0uMf+RdNJizJTlrRZy3cI6mal6NrNEOv5QvUMzQLbFoJ0hF66t6LxFBGglU46ZLuj8P5QAQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3 platform
Thread-Topic: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3
 platform
Thread-Index: AQHX8M3HLq8qFfw2eU2jxqbriRiMpawzUruAgAM0DYA=
Date: Fri, 17 Dec 2021 10:52:33 +0000
Message-ID: <20211217105233.GA3998068@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
 <CAPD2p-mWWUT=kLFDOfsYrZp7hGLLbbU4SiPaFg1SKjF3Tkj5kQ@mail.gmail.com>
In-Reply-To: 
 <CAPD2p-mWWUT=kLFDOfsYrZp7hGLLbbU4SiPaFg1SKjF3Tkj5kQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51cd320b-9e74-480e-2d13-08d9c14b54b2
x-ms-traffictypediagnostic: PR3PR03MB6362:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB6362BBBB34B4F84F916842ABE3789@PR3PR03MB6362.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YGtVLJ+IWyY7yS/ZzRW4EbrHdW37a0bqb8LPjlUNUYrl6YRX2UrbGAGioNViPyevL24VtIdEeHqIhyna4pcRW0+frk7JKylk1PzFnAjo2fs1ajYLK2Z9BWToDoj4zSnH0haBfOCQL0GRfUOuBRVCwTnGR2utBoarMVLQffQr23NDF8OXeb8vuO8COzC2Jip0R365AwMTTGv2kI1Sf7MSo4Ugjp7vwsjUDaq7CAPy/mjsGkXhT4GPwU0fQknJaI5lR8qL96O1NvOGUdg9LpPUwFwvOrVUH/ReLdoGM0NABd9RT1f8pD8vDsBrQ6GZA8QxFXHwK8zciDbRIiM8JMrCVP07VIaQeu+Bgz4mgCXo3e/T+2f92jRlVV6ApqKuLYLiwsvusQUJAPL1KvOzxXiEDOZIWZFiIXBZpNgO1WA4Q1vxdubezlP3CCtdWPvAi03pnaFg6dVlQEjPXgHCf537gs2EeSnRgsPjz0G2zoGNyHQ0fbNRfuWahZEKZNOaiJH/5rs9O2x1XbtneuY9kEYuPYLqOMFDNUGCdS49UGXycj9vJVfscBIB/i6oYTYAfdT7p2byqD7/0+oK6Sw2MqVoQSzlLCL51WL5+dfPlDBT71oGix1wmjpond9zLS9m6pNWzMUlruktfZS1aD77AxRx+sgRAiF/Za3PsrWG55yz0lZSBCY2J+4tIDZdCY4OkqhQwhHwKWCBycKPkTsOQNhfd/VzzsnRiWHrcDB2OOgdvgI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(71200400001)(66446008)(6486002)(54906003)(4326008)(8676002)(186003)(91956017)(64756008)(38100700002)(316002)(508600001)(33656002)(38070700005)(6512007)(76116006)(53546011)(122000001)(6506007)(66556008)(66946007)(9686003)(26005)(8936002)(86362001)(66476007)(1076003)(6916009)(5660300002)(33716001)(2906002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nFMDU0ZvZuccIpnjpe0IVeXMOkmCsO1ET8iWDSs0Fh0baQJ8Ajos/b1zXZgD?=
 =?us-ascii?Q?VoRQwlF/UOWZJk+EREITK99ln+vRglZGq7NqnGkPmmpNYQI1vw9x6ok79xLP?=
 =?us-ascii?Q?vJNFDU21NGziqizOJ/Bdp5J2NYeDEyKS7De9AFdbdhjcmY+Bj6/eqnygzMJq?=
 =?us-ascii?Q?uOcBYmBxDeAryKY3Z87/dMslJMU+obuEzN0yxQIUK5ciANPL4tC8DQfMuXjd?=
 =?us-ascii?Q?Euu2Fdt+VL1hk+EXEwh40TbPxlYyawDt2bcB05FucbofwhCQD1hcXEdZwSLE?=
 =?us-ascii?Q?wn/5NLyFGJo+1XAkhywQzLA5EtVknM3q92oqEno4sIIdIFZTgr6yq7JdS61T?=
 =?us-ascii?Q?JDMml66A/NL7Kt1Q3lvZrddAsAJ6EQyWWsreRl2gI0EK7xPYvKTecite2mOl?=
 =?us-ascii?Q?NE/ce3Vq2MvPKbpnwKk/K6j1HLOqfqQn+Uib86yxw9Km2yNx8bG6FznOwKZg?=
 =?us-ascii?Q?NcvXF+y/JVy3EXqZBiYgOTA9P/awuM1m9dVXX7zosD2CSBWUUBj4uTzOh6xt?=
 =?us-ascii?Q?Z51H+b+ygNR/xAiLPP3P/3c4Evl5pake5YIEjZBKsJidL66i/sKOoR6eT3C4?=
 =?us-ascii?Q?m70LqAN/AVvIMU2YxwsznSN5qOzzMi7ZeejCl2HR+JhAVC2jLWW8mNS3NRka?=
 =?us-ascii?Q?+cEaWLFPHH7VXJTdRiE1dr0B1ER5CHtnnseMJ5673z3bEcaclDq78+rT8gKj?=
 =?us-ascii?Q?7vF+nnOzSZwCmk+Ed5AFuBTa1IKHF7cAj9XSYBwXfNjW7wrOnZj+60qbsrAc?=
 =?us-ascii?Q?dLqCljQq767WJPByZv8briTe+Ab9rN93yAyJ/URG2HDVICIkjuy9MTBpScho?=
 =?us-ascii?Q?Vo6ZHsffZ8UsqAI+BEmVDP/PuRSLgHrqa9KRcfeoq1MeOi8fwXmmnoB9jKe9?=
 =?us-ascii?Q?ICqqOuKoQDxmMreG0QxazoIpPGUI2q/rvph2MAXls2XxoXGa2ieMB2tFgyVg?=
 =?us-ascii?Q?spkMd2PZJpR0FqIn9RyZ0oUg4QJNmT6AE3APZDA7Zl2YdDx1K4EdM2QPDcI2?=
 =?us-ascii?Q?jAy02DX/cvYBE3PkJHOCtD9XBG+uObD6xDBSF7VaTORhvAfTyN6K/1FaH2pv?=
 =?us-ascii?Q?63VTL7ynimWUyFPyhbrRYxJN2HJBp68S6BtQEkOINiO2RP32XF1G6d4Lh5/9?=
 =?us-ascii?Q?NEwYI4aQBmJwS6DRPPe/q1JYPn261vUQXhagm4Y//3uexLgMXC+v0YXPCGXW?=
 =?us-ascii?Q?FoESdY21W7EJbgwO6HkEblal4o1HOWsjjFKyJPM7f1NtQBNUqvAKHXapcTv/?=
 =?us-ascii?Q?WcJtjB6h2N2/Rhw9bzrK36T53+r9WCW0BCafg7xzrRCI0cpwR4UFxWrcT6bn?=
 =?us-ascii?Q?2/H+08UGkI1E1tvxtxoUtA4u3FsAk7OknvRff3nuVf0XsolsyKMcSseunT7E?=
 =?us-ascii?Q?pkAYpEVO9uVm1dEtg712FstAa3eKQ9j5vixOvL6HXIXWPi0g0xSvMcJguMty?=
 =?us-ascii?Q?N/NwPX2sd1a9vmueAFEPPHkrdDVoe1es18pvufWGWAA+3zJpz593Gmvk5eFa?=
 =?us-ascii?Q?+BOImMk6OSX1WZ40c/zmnT+6lylnuZ1aJMLp8hAYb1PaWwN8JD9cEKnRkBIZ?=
 =?us-ascii?Q?8TRpEiAOygTmcqXlkhiPB5U00xO5Wdt28XcCv0N8xfoR+DIvTiu/qWHsSTI+?=
 =?us-ascii?Q?dTCKgD4VXp4tEbLj9mMfZg28JF3xB5mJGOS/Z7C3FFz2uMitbMpn8x937jWA?=
 =?us-ascii?Q?yfKmPMtHFNaTYmy3JWEmQ63Cs8Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <77776A29A8345D4686ACBFD141C2A9A2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cd320b-9e74-480e-2d13-08d9c14b54b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:52:33.6055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSDGlmlLp3h5qjRYDOv6ZErV9zEybF1gaWI783XRJhBoRwwLN339Tfy+Gy++GPq9DQmpLSkJJloduwLkRT0gddcnVeF4VLd9rV+q93CCRPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6362
X-Proofpoint-GUID: mXngbbr5TWDIZdQgk8ue0SsExWx4eyO1
X-Proofpoint-ORIG-GUID: mXngbbr5TWDIZdQgk8ue0SsExWx4eyO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_04,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112170062

Hi Oleksandr,

On Wed, Dec 15, 2021 at 11:57:29AM +0200, Oleksandr Tyshchenko wrote:
> On Tue, Dec 14, 2021 at 11:35 AM Oleksii Moisieiev <
> Oleksii_Moisieiev@epam.com> wrote:
>=20
> Hi Oleksii
>=20
> [sorry for the possible format issues]
>=20
> Implementation includes platform-specific smc handler for rcar3 platform.
> >
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >  xen/arch/arm/platforms/Makefile |  1 +
> >  xen/arch/arm/platforms/rcar3.c  | 46 +++++++++++++++++++++++++++++++++
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 xen/arch/arm/platforms/rcar3.c
> >
> > diff --git a/xen/arch/arm/platforms/Makefile
> > b/xen/arch/arm/platforms/Makefile
> > index 8632f4115f..b64c25de6c 100644
> > --- a/xen/arch/arm/platforms/Makefile
> > +++ b/xen/arch/arm/platforms/Makefile
> > @@ -4,6 +4,7 @@ obj-$(CONFIG_ALL32_PLAT) +=3D exynos5.o
> >  obj-$(CONFIG_ALL32_PLAT) +=3D midway.o
> >  obj-$(CONFIG_ALL32_PLAT) +=3D omap5.o
> >  obj-$(CONFIG_ALL32_PLAT) +=3D rcar2.o
> > +obj-$(CONFIG_RCAR3) +=3D rcar3.o
> >  obj-$(CONFIG_ALL64_PLAT) +=3D seattle.o
> >  obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
> >  obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
> > diff --git a/xen/arch/arm/platforms/rcar3.c
> > b/xen/arch/arm/platforms/rcar3.c
> > new file mode 100644
> > index 0000000000..d740145c71
> > --- /dev/null
> > +++ b/xen/arch/arm/platforms/rcar3.c
> > @@ -0,0 +1,46 @@
> > +/*
> > + * xen/arch/arm/platforms/rcar3.c
> > + *
> > + * Renesas R-Car Gen3 specific settings
> > + *
> > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > + * Copyright (C) 2021 EPAM Systems
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <asm/platform.h>
> > +
> > +static bool rcar3_smc(struct cpu_user_regs *regs)
> > +{
> > +    return false;
> > +}
> > +
> > +static const char *const rcar3_dt_compat[] __initconst =3D
> > +{
> > +    "renesas,r8a7795",
> > +    "renesas,r8a7796",
> >
>=20
>=20
> Please note that since Linux commit:
> "9c9f7891093b02eb64ca4e1c7ab776a4296c058f soc: renesas: Identify R-Car
> M3-W+"
> the compatible string for R-Car M3-W+ (ES3.0) SoC is "renesas,r8a77961". =
So
> in case we want to have vSCMI feature on this new SoC revision as well we
> will need
> to extend the compatible list.
>=20

Thank you for the point, this will be fixed in v2.

Best regards,
Oleksii

>=20
> +    NULL
> > +};
> > +
> > +PLATFORM_START(rcar3, "Renesas R-Car Gen3")
> > +    .compatible =3D rcar3_dt_compat,
> > +    .smc =3D rcar3_smc
> > +PLATFORM_END
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > --
> > 2.27.0
> >
> >
>=20
> --=20
> Regards,
>=20
> Oleksandr Tyshchenko=

