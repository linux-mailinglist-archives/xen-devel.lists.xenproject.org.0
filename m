Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693447C800
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 21:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250586.431606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzlM9-0001kd-J1; Tue, 21 Dec 2021 20:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250586.431606; Tue, 21 Dec 2021 20:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzlM9-0001ik-EP; Tue, 21 Dec 2021 20:03:29 +0000
Received: by outflank-mailman (input) for mailman id 250586;
 Tue, 21 Dec 2021 20:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cbib=RG=epam.com=prvs=2989ef1cf7=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mzlM7-0001ie-DP
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 20:03:27 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c5c77b1-6299-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 21:03:22 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BLJOxjE001858;
 Tue, 21 Dec 2021 20:03:11 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d3huhrrst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 20:03:10 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR2PR03MB5194.eurprd03.prod.outlook.com (2603:10a6:101:17::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 20:03:06 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 20:03:06 +0000
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
X-Inumbo-ID: 0c5c77b1-6299-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knUEIGl0eHl4wz45jw+jCMFVj0ode04Z8kkrodhvccIu/7p82R6TUL4CvQI5/zvcnlK3ohqr9VfVIu6kiZNBFpCsbGHnf5V8OqSMrN+ibzfVtS4AAYSwCJ/ra1YCRbm00Id9+Z8Hx6igS2/065XVLtUs26pk2OIneUSRiJQJNxsvrcK+MSYJl+UVxpaO+8qrY04NokxgAojMpat2Adhk2Aw4RhCDqpWBisTl5/zJe54GQvQUY2GePBTMC3Kx0jpKCZHGoaw2W4eSRKfQ3/F8ZQ3d1bKdzmBa59FyUNcgm0H9F5ubhR8bQtNAWvftWS5JvsFf8kPPNOXMqwmdQyWNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AePlNM58N/Y1M36jOZoF8UcCCFQFKAAkvBw+BaLb4O4=;
 b=gN/f7SslIgnlP4Jgmu1p+COp5tGkDRYLaij6zs2KcgbXvBwurkJ8TaKOj+gCiMNDSGXMH6wMkxbhcGoGkVscr4zM07vmVFutPXBlHsNaSCmoa+LImitVlYT6ZvG3FKdIlyZef1lE3IhO6uow4+MOX/13XiBaw2hxQOEFz2zQ0QIoraGGkHNXM31JGnDId75wp8UTu89ChjBaGxi/5ufoTF1orFRKKElI4kNoEq9ioSnBS5jdyG7pUWTcysZRSNViaw/5sTXmlnJHaIeaPXOouTLdjhqI2egWEeDkEkCfD/K3w5js4zfMad6XPp0k+jdfhHQ8OC7WjU1WdpbxfQIHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AePlNM58N/Y1M36jOZoF8UcCCFQFKAAkvBw+BaLb4O4=;
 b=FS/v2C984mHpWVHpWRKvwRxUcpeQv0pVg/eYi8e5wFv7u/u64EvfMHAWBwR5Cai/UChzxrO/DKrBS/izT/lR6AyS6vLG5ZUU/Uu9A5M5YgNZizNV44PaZAuUMj76HAIa22826a1D2ulaUVWgbFC+6A0pNhqe57UAN7BhTz5JWGtu39rhqpalLT+rRRkkmOoVBs+/f75IUbHiqny1HvTb2Ko41WNn3jqGAgfaw7atyaVdp7VV8V7TUBc/XrVvFFEy/XQCxiolGzw0t8Okug4lprJa55x0zOR48nL47YAJGWeSUq6Gna4ISsKjZIgs3oSx7ws79b/32u+PQxdyIAJp2g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuA
Date: Tue, 21 Dec 2021 20:03:06 +0000
Message-ID: <20211221200305.GA2460476@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 093b6382-8b54-41fe-ed56-08d9c4bce79d
x-ms-traffictypediagnostic: PR2PR03MB5194:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR2PR03MB5194E2E39744BE5E1920B7D5E37C9@PR2PR03MB5194.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s8Uneo62J7Yctd7qRVtQFmqX1EOTBzCEUbNeYzIHrgDVW8H0g795vsNRoDzXkAxp3da4oHI1HTtqiq0tRtJfx5IiL96QljRDiD+U3vatfsxG80RfS8O+zrqqKI7wAkMP3wq7suNVmkuIs9VGJvFQagLgxqH6qOh43t1EvQjUP/mEERN85CxCD/eoD0I0zWNtvBMBvukgrCHNlTrUFPn2G+6kG8870PUC3naUwLP//vrePmAoNIv6PFGzdCqQkdH1Z4gjLkuTLtDHSUDObFabH+OEr1zqdwQywhVKs6JgsLTvyHFXb8DOITYFnaunv3CsT7vfrPCf7qF1kcpYLNFUdUNO4UZc78Gio7Z+c/c/xzXDgxsD0jxNf7qiKYWO+ImKSajFC9HQkwjYpy1QjV96V6+Bua09XREWuHdl/Pw1yT+P1rIDEIOFIlKBcfsIDanP0KUmUOLRC2bnjrD5zFLknQUPBT/g+D5u7FOck6rfVPPPXdXai0tYexkz9CxZS6agBle2nmJpKkfvDvyUqpT1GLxxXAZP/vBqOmwkQS2676bSy/xM51B50iiPoBWj7VJXG63LnsIZxpAQ33uY/uTgZmmMRvgwtICoUsGXWwIoNL98ByDsp8sakvLxXwcwtLZTjjU1P2kBFlSEfgwO+fsleiow3FpkdofaEB8HqWC0GuOKA7TrVyUrEADg/xh3dtXWF+XDymvnfWTJQ7rL1Yp2KF1aB4FhQrtWFUGEPQCg3BOM/JIIDMt/GxsghkPikK0EPeuKPZblU7V7gu0rIP1imCwGSSpSCsZvPTuCFyU9gSA8fFjNEXZH0ycQB/6kMaic
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(33656002)(71200400001)(8936002)(508600001)(54906003)(38070700005)(186003)(26005)(30864003)(83380400001)(86362001)(1076003)(9686003)(64756008)(6512007)(66946007)(66446008)(33716001)(66556008)(66476007)(966005)(6916009)(6486002)(5660300002)(2906002)(91956017)(316002)(4326008)(8676002)(76116006)(122000001)(6506007)(38100700002)(2004002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Q/gPaYIlpKQTWUKdHO/zbZsu6bmc1nx0m1s1Uj8945v3dsFS5p5Kruc8rnoW?=
 =?us-ascii?Q?OEywfEwrq16Kld70kSXxqYchsxPVFja6HMjkDsR53motbwgDwnyru4Qczvb/?=
 =?us-ascii?Q?iQ/TjHihVTzhJA0AIQYkPhn4jnRXuVbXhqfkVDNPxJurYOQXbZ0bDZE/1eRA?=
 =?us-ascii?Q?DdUJgkS2AiObaSayZO1Y3A3Evupp13WHuvlgXlGeurNIjibo76Le51yiSY8K?=
 =?us-ascii?Q?Y3q2qbL1H1e6MsFfPBN87hawA7DWJOdMpQuViWffC9CYKDWRFyekuYnpk46l?=
 =?us-ascii?Q?LMHdlphVwsysVccqiloPu/N6J1VszTZQfiGtUNhUO7ag7f9e5T1sAOEnrkWg?=
 =?us-ascii?Q?peSfSollCQAEkRD2W+QeZC9V3KcsRAAX4FcvcoGhOygwjbXEIKgEQ84F4dWw?=
 =?us-ascii?Q?Cq9z00ptgf+ZlfykdFcX4/9vXRe9y9clqTVx+KgVYTRiILDdQmMdrr8VwgeN?=
 =?us-ascii?Q?WZEIhVyk3eP3Qv8UBgr+foZUGnna3LqMJrfw0kA7MqjPOUi0leUyBvHK/fqj?=
 =?us-ascii?Q?rXuL/ooR8VbQ9I08Q/W/CtfmZjYOx8EDt+7XJTW2e8I6oTYARCaA/2ZIh9P1?=
 =?us-ascii?Q?GL34+208PVT8cX2+qnRCpP1/4pp6b/Jqx5CYLT1C0P1zM/hSNcCxqAm5LYRu?=
 =?us-ascii?Q?hWE3F3az9fMcV7W1NV1tWA0qu/fDjtJ4V+Oz3pGLTYOe06858nNUfpTehPgu?=
 =?us-ascii?Q?84UVA7Swy5Bh+yBOE3H3wCXAjCufFh9oG+sxXhciUXPpEsQqsr77NX0rkfDn?=
 =?us-ascii?Q?Sgvxy/lu8ZPoXXK03yb5fhZN7fL3teTl2QwxFMAAS603JTQkgaXcfSSVmN/N?=
 =?us-ascii?Q?S2uYJhYYyKnmwTk/nalmAla163S25B0tLnMtVxbVngmgEhRwedD49z75PH5N?=
 =?us-ascii?Q?/AL33cRAuX4Dtc3O3COFGh5JVRz1OxJD95g5M+iDjF6NzZ1z7GEQL70AtETw?=
 =?us-ascii?Q?rUkauRzrbqd4MQGa8YwgfIf4y+Hi3XfQmn9ij2lGsscC7BvURFQsX7AunXzV?=
 =?us-ascii?Q?yISp1AmdhtmhJyWQAToMlPxsqSjHWY5hSk/+yOPt8keOD3aZUsU3373iV51r?=
 =?us-ascii?Q?owpwMmpm/2dlqj77Ykc2W6uwAkrR+09Hufi/Li27x9gPgam11ClulVYBaMdG?=
 =?us-ascii?Q?wM6BR/2/0LuZ60D171Rhsj9zF40c+mumKYSz9TufOd9l1GhvZ+QFk/wk6/i0?=
 =?us-ascii?Q?4JTOLl5pPYWfexa+XRIXRH6SwdJYvDj7qeL8SAsRRacStX8m3XkN5nGMgFiw?=
 =?us-ascii?Q?Nv+UUi//WkRF5/Ho0Luuz7TMWexwkiPFCrU8NylS5KZBAkEXSBuywDRMRtCD?=
 =?us-ascii?Q?bDP2ezRRU9Ur7M3rYPaamjHXk8LM/PRF791BlpVEhityYct01J9KJvMxDD0O?=
 =?us-ascii?Q?HR4QKDdxs9w3smX8kXWv2p6FmeVUzi5xVBVJof4xNnwRj4uRz6rutJY7hOn0?=
 =?us-ascii?Q?tT8jWIsXuz77CTpsJY/hyzcoMRNw40fXdMVp7BXOF7m2nbDtzOWZRquAfAqD?=
 =?us-ascii?Q?0/VWeiugYR2jp7UjRB+8Jp7DaiiQutneLxuCFgFscOqk8fP6vQINQJGjGYRW?=
 =?us-ascii?Q?n21TjepdfQV2rJg4jAmrJBNxSdZSNP8xs5fdAymef8q+td4wN57fkyQ29U2M?=
 =?us-ascii?Q?KyQ6RFdvBJgg/V5sXQOgJGPPO5fm/UyPS2GYYYMAvPeuU+bieVNqfprzVRMy?=
 =?us-ascii?Q?dmSHTqw6xTe0eCyy5QGTTcoAMyI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0AC7E1FD17FE134798921211AA07B26C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093b6382-8b54-41fe-ed56-08d9c4bce79d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 20:03:06.7481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hdHrOYI8ZhaqvbmfO2OaTZPbwEnFHjHhu/Wb85JP8Ggd211ZY9fIsnk/qypMu99rMQaenD1jc9ezwxG6pFqVYfIXYxdCkkLaCeNEZUjw85A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5194
X-Proofpoint-GUID: EA9O_AXhTGrxKQ-KGq4JPyev6OGmk8lB
X-Proofpoint-ORIG-GUID: EA9O_AXhTGrxKQ-KGq4JPyev6OGmk8lB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_05,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112210099

Hi Stefano,

On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wrote:
> On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
> > Hi Stefano,
> >=20
> > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wrote:
> > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> > > > This is the implementation of SCI interface, called SCMI-SMC driver=
,
> > > > which works as the mediator between XEN Domains and Firmware (SCP, =
ATF etc).
> > > > This allows devices from the Domains to work with clocks, resets an=
d
> > > > power-domains without access to CPG.
> > > >=20
> > > > The following features are implemented:
> > > > - request SCMI channels from ATF and pass channels to Domains;
> > > > - set device permissions for Domains based on the Domain partial
> > > > device-tree. Devices with permissions are able to work with clocks,
> > > > resets and power-domains via SCMI;
> > > > - redirect scmi messages from Domains to ATF.
> > > >=20
> > > > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > ---
> > > >  xen/arch/arm/Kconfig          |   2 +
> > > >  xen/arch/arm/sci/Kconfig      |  10 +
> > > >  xen/arch/arm/sci/Makefile     |   1 +
> > > >  xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++++++=
++++
> > > >  xen/include/public/arch-arm.h |   1 +
> > > >  5 files changed, 809 insertions(+)
> > > >  create mode 100644 xen/arch/arm/sci/Kconfig
> > > >  create mode 100644 xen/arch/arm/sci/scmi_smc.c
> > > >=20
> > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > index 186e1db389..02d96c6cfc 100644
> > > > --- a/xen/arch/arm/Kconfig
> > > > +++ b/xen/arch/arm/Kconfig
> > > > @@ -114,6 +114,8 @@ config SCI
> > > >  	  support. It allows guests to control system resourcess via one =
of
> > > >  	  SCI mediators implemented in XEN.
> > > > =20
> > > > +source "arch/arm/sci/Kconfig"
> > > > +
> > > >  endmenu
> > > > =20
> > > >  menu "ARM errata workaround via the alternative framework"
> > > > diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
> > > > new file mode 100644
> > > > index 0000000000..9563067ddc
> > > > --- /dev/null
> > > > +++ b/xen/arch/arm/sci/Kconfig
> > > > @@ -0,0 +1,10 @@
> > > > +config SCMI_SMC
> > > > +	bool "Enable SCMI-SMC mediator driver"
> > > > +	default n
> > > > +	depends on SCI
> > > > +	---help---
> > > > +
> > > > +	Enables mediator in XEN to pass SCMI requests from Domains to ATF=
.
> > > > +	This feature allows drivers from Domains to work with System
> > > > +	Controllers (such as power,resets,clock etc.). SCP is used as tra=
nsport
> > > > +	for communication.
> > > > diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> > > > index 837dc7492b..67f2611872 100644
> > > > --- a/xen/arch/arm/sci/Makefile
> > > > +++ b/xen/arch/arm/sci/Makefile
> > > > @@ -1 +1,2 @@
> > > >  obj-y +=3D sci.o
> > > > +obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
> > > > diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_sm=
c.c
> > > > new file mode 100644
> > > > index 0000000000..2eb01ea82d
> > > > --- /dev/null
> > > > +++ b/xen/arch/arm/sci/scmi_smc.c
> > > > @@ -0,0 +1,795 @@
> > > > +/*
> > > > + * xen/arch/arm/sci/scmi_smc.c
> > > > + *
> > > > + * SCMI mediator driver, using SCP as transport.
> > > > + *
> > > > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > > > + * Copyright (C) 2021, EPAM Systems.
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or m=
odify
> > > > + * it under the terms of the GNU General Public License as publish=
ed by
> > > > + * the Free Software Foundation; either version 2 of the License, =
or
> > > > + * (at your option) any later version.
> > > > + *
> > > > + * This program is distributed in the hope that it will be useful,
> > > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > > + * GNU General Public License for more details.
> > > > + */
> > > > +
> > > > +#include <asm/sci/sci.h>
> > > > +#include <asm/smccc.h>
> > > > +#include <asm/io.h>
> > > > +#include <xen/bitops.h>
> > > > +#include <xen/config.h>
> > > > +#include <xen/sched.h>
> > > > +#include <xen/device_tree.h>
> > > > +#include <xen/iocap.h>
> > > > +#include <xen/init.h>
> > > > +#include <xen/err.h>
> > > > +#include <xen/lib.h>
> > > > +#include <xen/list.h>
> > > > +#include <xen/mm.h>
> > > > +#include <xen/string.h>
> > > > +#include <xen/time.h>
> > > > +#include <xen/vmap.h>
> > > > +
> > > > +#define SCMI_BASE_PROTOCOL                  0x10
> > > > +#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
> > > > +#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
> > > > +#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
> > > > +#define SCMI_BASE_DISCOVER_AGENT            0x7
> > > > +
> > > > +/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C) */
> > > > +#define SCMI_SUCCESS              0
> > > > +#define SCMI_NOT_SUPPORTED      (-1)
> > > > +#define SCMI_INVALID_PARAMETERS (-2)
> > > > +#define SCMI_DENIED             (-3)
> > > > +#define SCMI_NOT_FOUND          (-4)
> > > > +#define SCMI_OUT_OF_RANGE       (-5)
> > > > +#define SCMI_BUSY               (-6)
> > > > +#define SCMI_COMMS_ERROR        (-7)
> > > > +#define SCMI_GENERIC_ERROR      (-8)
> > > > +#define SCMI_HARDWARE_ERROR     (-9)
> > > > +#define SCMI_PROTOCOL_ERROR     (-10)
> > > > +
> > > > +#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
> > > > +
> > > > +#define SCMI_SMC_ID                        "arm,smc-id"
> > > > +#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
> > >=20
> > > I could find the following SCMI binding in Linux, which describes
> > > the arm,scmi-smc compatible and the arm,smc-id property:
> > >=20
> > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > >=20
> > > However, linux,scmi_mem is not described. Aren't you supposed to read
> > > the "shmem" property instead? And the compatible string used for this
> > > seems to be "arm,scmi-shmem".
> > >=20
> >=20
> > We use linux,scmi_mem node to reserve memory, needed for all
> > channels:
> >=20
> > reserved-memory {
> >     /* reserved region for scmi channels*/
> >     scmi_memory: linux,scmi_mem@53FF0000 {
> >         no-map;
> >         reg =3D <0x0 0x53FF0000 0x0 0x10000>;
> >     };
> > };
> >=20
> > arm,scmi-shmem node used in shmem property defines only 1 page needed t=
o
> > the current scmi channel:
> >=20
> > cpu_scp_shm: scp-shmem@0x53FF0000 {
> >     compatible =3D "arm,scmi-shmem";
> >     reg =3D <0x0 0x53FF0000 0x0 0x1000>;
> > };
> >=20
> > For each Domain reg points to unigue page from linux,scmi_mem region,
> > assigned to this agent.
>=20
> If we were to use "linux,scmi_mem" we would have to introduce it as a
> compatible string, not as a node name, and it would need to be described
> in Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
>=20
> But from your description I don't think it is necessary. We can just use
> "arm,scmi-shmem" to describe all the required regions:
>=20
> reserved-memory {
>     scp-shmem@0x53FF0000 {
>         compatible =3D "arm,scmi-shmem";
>         reg =3D <0x0 0x53FF0000 0x0 0x1000>;
>     };
>     scp-shmem@0x53FF1000 {
>         compatible =3D "arm,scmi-shmem";
>         reg =3D <0x0 0x53FF1000 0x0 0x1000>;
>     };
>     scp-shmem@0x53FF2000 {
>         compatible =3D "arm,scmi-shmem";
>         reg =3D <0x0 0x53FF2000 0x0 0x1000>;
>     };
>     ...
>=20
> In other words, if all the individual channel pages are described as
> "arm,scmi-shmem", why do we also need a single larger region as
> "linux,scmi_mem"?
>=20

That was my first implementation. But I've met a problem with
scmi driver in kernel. I don't remember the exact place, but I remember
there were some if, checking if memory weren't reserved.
That's why I ended up splitting nodes reserved memory region and actual
shmem page.
For linux,scmi_mem node I took format from /reserved-memory/linux,lossy_dec=
ompress@54000000,
which has no compatible string and provides no-map property.
linux,scmi_shmem node is needed to prevent xen from allocating this
space for the domain.

Very interesting question about should I introduce linux,scmi_mem node
and scmi_devid property to the
Documentation/devicetree/bindings/firmware/arm,scmi.yaml?
Those node and property are needed only for Xen and useless for
non-virtualized systems. I can add this node and property description to
arm,scmi.yaml, but leave a note that this is Xen specific params.
What do you think about it?

> =20
> > > > +#define SCMI_SHMEM                         "shmem"
> > > > +
> > > > +#define HYP_CHANNEL                          0x0
> > > > +
> > > > +#define HDR_ID                             GENMASK(7,0)
> > > > +#define HDR_TYPE                           GENMASK(9, 8)
> > > > +#define HDR_PROTO                          GENMASK(17, 10)
> > > > +
> > > > +/* SCMI protocol, refer to section 4.2.2.2 (DEN0056C) */
> > > > +#define MSG_N_AGENTS_MASK                  GENMASK(15, 8)
> > > > +
> > > > +#define FIELD_GET(_mask, _reg)\
> > > > +    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> > > > +#define FIELD_PREP(_mask, _val)\
> > > > +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> > > > +
> > > > +typedef struct scmi_msg_header {
> > > > +    uint8_t id;
> > > > +    uint8_t type;
> > > > +    uint8_t protocol;
> > > > +} scmi_msg_header_t;
> > > > +
> > > > +typedef struct scmi_perms_tx {
> > > > +    uint32_t agent_id;
> > > > +    uint32_t device_id;
> > > > +    uint32_t flags;
> > > > +} scmi_perms_tx_t;
> > > > +
> > > > +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE   BIT(0, UL)
> > > > +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR  BIT(1, UL)
> > > > +
> > > > +#define SCMI_ALLOW_ACCESS                   BIT(0, UL)
> > > > +
> > > > +struct scmi_shared_mem {
> > > > +    uint32_t reserved;
> > > > +    uint32_t channel_status;
> > > > +    uint32_t reserved1[2];
> > > > +    uint32_t flags;
> > > > +    uint32_t length;
> > > > +    uint32_t msg_header;
> > > > +    uint8_t msg_payload[];
> > > > +};
> > > > +
> > > > +struct scmi_channel {
> > > > +    int chan_id;
> > > > +    int agent_id;
> > > > +    uint32_t func_id;
> > > > +    int domain_id;
> > > > +    uint64_t paddr;
> > > > +    struct scmi_shared_mem *shmem;
> > > > +    spinlock_t lock;
> > > > +    struct list_head list;
> > > > +};
> > > > +
> > > > +struct scmi_data {
> > > > +    struct list_head channel_list;
> > > > +    spinlock_t channel_list_lock;
> > > > +    bool initialized;
> > > > +    u64 shmem_addr, shmem_size;
> > > > +};
> > > > +
> > > > +static struct scmi_data scmi_data;
> > > > +
> > > > +/*
> > > > + * pack_scmi_header() - packs and returns 32-bit header
> > > > + *
> > > > + * @hdr: pointer to header containing all the information on messa=
ge id,
> > > > + *    protocol id and type id.
> > > > + *
> > > > + * Return: 32-bit packed message header to be sent to the platform=
.
> > > > + */
> > > > +static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
> > > > +{
> > > > +    return FIELD_PREP(HDR_ID, hdr->id) |
> > > > +        FIELD_PREP(HDR_TYPE, hdr->type) |
> > > > +        FIELD_PREP(HDR_PROTO, hdr->protocol);
> > > > +}
> > > > +
> > > > +/*
> > > > + * unpack_scmi_header() - unpacks and records message and protocol=
 id
> > > > + *
> > > > + * @msg_hdr: 32-bit packed message header sent from the platform
> > > > + * @hdr: pointer to header to fetch message and protocol id.
> > > > + */
> > > > +static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_h=
eader_t *hdr)
> > > > +{
> > > > +    hdr->id =3D FIELD_GET(HDR_ID, msg_hdr);
> > > > +    hdr->type =3D FIELD_GET(HDR_TYPE, msg_hdr);
> > > > +    hdr->protocol =3D FIELD_GET(HDR_PROTO, msg_hdr);
> > > > +}
> > > > +
> > > > +static inline int channel_is_free(struct scmi_channel *chan_info)
> > > > +{
> > > > +    return ( chan_info->shmem->channel_status
> > > > +            & SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE ) ? 0 : -EBUSY;
> > >=20
> > > Does this need a memory barrier? Or not, because the other end always
> > > runs on the same CPU at a different execution level so the
> > > channel_status would be always guaranteed to be read as updated?
> > >=20
> >=20
> > It don't because the other end runs on the same CPU. Other mediator
> > implemetaions, which uses different areas may need memory barrier.
> >=20
> > >=20
> > > > +}
> > > > +
> > > > +static int send_smc_message(struct scmi_channel *chan_info,
> > > > +                            scmi_msg_header_t *hdr, void *data, in=
t len)
> > > > +{
> > > > +    struct arm_smccc_res resp;
> > > > +    int ret;
> > > > +
> > > > +    printk(XENLOG_DEBUG "scmi: status =3D%d len=3D%d\n",
> > > > +           chan_info->shmem->channel_status, len);
> > > > +    printk(XENLOG_DEBUG "scmi: header id =3D %d type =3D %d, proto=
 =3D %d\n",
> > > > +           hdr->id, hdr->type, hdr->protocol);
> > > > +
> > > > +    ret =3D channel_is_free(chan_info);
> > > > +    if ( IS_ERR_VALUE(ret) )
> > > > +        return ret;
> > > > +
> > > > +    chan_info->shmem->channel_status =3D 0x0;
> > > > +    /* Writing 0x0 right now, but SCMI_SHMEM_FLAG_INTR_ENABLED can=
 be set */
> > > > +    chan_info->shmem->flags =3D 0x0;
> > > > +    chan_info->shmem->length =3D sizeof(chan_info->shmem->msg_head=
er) + len;
> > > > +    chan_info->shmem->msg_header =3D pack_scmi_header(hdr);
> > > > +
> > > > +    printk(XENLOG_DEBUG "scmi: Writing to shmem address %p\n",
> > > > +           chan_info->shmem);
> > > > +    if ( len > 0 && data )
> > > > +        memcpy((void *)(chan_info->shmem->msg_payload), data, len)=
;
> > >=20
> > > Again, here we don't need a barrier because it is implicit in the SMC=
?
> > >=20
> >=20
> > As I mentioned before, the other end runs on the same CPU.
> >=20
> > > Don't we need to check that "len" fits in the shared memory?
> > >=20
> >=20
> > I think it's a good point. I'll add len check in v2.
> >=20
> > >=20
> > > > +    arm_smccc_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, chan_info-=
>chan_id,
> > > > +                  &resp);
> > > > +
> > > > +    printk(XENLOG_DEBUG "scmi: scmccc_smc response %d\n", (int)(re=
sp.a0));
> > > > +
> > > > +    if ( resp.a0 )
> > > > +        return -EOPNOTSUPP;
> > >=20
> > > Why is that?
> > >=20
> >=20
> > This change was presented in kernel by Sudeep Holla in commit:
> > f7199cf489027ae38a9a82312d13025f7aefa0b8
> >=20
> > However, link posted in the commit:
> > https://urldefense.com/v3/__https://lore.kernel.org/r/20200417103232.68=
96-1-sudeep.holla@arm.com__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee=
_ChowYQiQYC595rMOsrnmof2zmk7Bnhb7jXoB3$ [lore[.]kernel[.]org]
> >=20
> > Leads to slightly different patch:
> >=20
> > +	if (res.a0 =3D=3D SMCCC_RET_NOT_SUPPORTED)
> > +		return -EOPNOTSUPP;
> > +	else if (res.a0)
> > +		return -EINVAL;
> > +	return 0;
> >=20
> > I don't know why it differs from the original commit, but I'll check an=
d place
> > the correct implementation in v2.
> >=20
> > >=20
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static int check_scmi_status(int scmi_status)
> > > > +{
> > > > +    if ( scmi_status =3D=3D SCMI_SUCCESS )
> > > > +        return 0;
> > > > +
> > > > +    printk(XENLOG_DEBUG "scmi: Error received: %d\n", scmi_status)=
;
> > > > +
> > > > +    switch ( scmi_status )
> > > > +    {
> > > > +    case SCMI_NOT_SUPPORTED:
> > > > +        return -EOPNOTSUPP;
> > > > +    case SCMI_INVALID_PARAMETERS:
> > > > +        return -EINVAL;
> > > > +    case SCMI_DENIED:
> > > > +        return -EACCES;
> > > > +    case SCMI_NOT_FOUND:
> > > > +        return -ENOENT;
> > > > +    case SCMI_OUT_OF_RANGE:
> > > > +        return -ERANGE;
> > > > +    case SCMI_BUSY:
> > > > +        return -EBUSY;
> > > > +    case SCMI_COMMS_ERROR:
> > > > +        return -ENOTCONN;
> > > > +    case SCMI_GENERIC_ERROR:
> > > > +        return -EIO;
> > > > +    case SCMI_HARDWARE_ERROR:
> > > > +        return -ENXIO;
> > > > +    case SCMI_PROTOCOL_ERROR:
> > > > +        return -EBADMSG;
> > > > +    }
> > > > +
> > > > +    return -EINVAL;
> > > > +}
> > > > +
> > > > +static int get_smc_response(struct scmi_channel *chan_info,
> > > > +                            scmi_msg_header_t *hdr, void *data, in=
t len)
> > > > +{
> > > > +    int recv_len;
> > > > +    int ret;
> > > > +
> > > > +    printk(XENLOG_DEBUG "scmi: get smc responce msgid %d\n", hdr->=
id);
> > > > +
> > > > +    ret =3D channel_is_free(chan_info);
> > > > +    if ( IS_ERR_VALUE(ret) )
> > > > +        return ret;
> > >=20
> > > I am not familiar with the spec (do you have a link?) but is it expec=
ted
> > > that the channel is "free" when actually we want to read a message on
> > > the channel?
> > >=20
> >=20
> > Here is the link https://urldefense.com/v3/__https://developer.arm.com/=
documentation/den0056/latest__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoL=
xee_ChowYQiQYC595rMOsrnmof2zmk7BnhRd1Yyp8$ [developer[.]arm[.]com]
> > Figure 6 in Section 5.1.1.
> > Caller marks channel as busy, then callee process message and marks cha=
nnel as free.
> > We are implementing polling based communication flow.
>=20
> OK
>=20
>=20
> > > > +    recv_len =3D chan_info->shmem->length - sizeof(chan_info->shme=
m->msg_header);
> > > > +
> > > > +    if ( recv_len < 0 )
> > > > +    {
> > > > +        printk(XENLOG_ERR
> > > > +               "scmi: Wrong size of smc message. Data may be inval=
id\n");
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    if ( recv_len > len )
> > > > +    {
> > > > +        printk(XENLOG_ERR
> > > > +               "scmi: Not enough buffer for message %d, expecting =
%d\n",
> > > > +               recv_len, len);
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    unpack_scmi_header(chan_info->shmem->msg_header, hdr);
> > > > +
> > > > +    if ( recv_len > 0 )
> > > > +    {
> > > > +        memcpy(data, chan_info->shmem->msg_payload, recv_len);
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static int do_smc_xfer(struct scmi_channel *channel, scmi_msg_head=
er_t *hdr, void *tx_data, int tx_size,
> > > > +                       void *rx_data, int rx_size)
> > > > +{
> > > > +    int ret =3D 0;
> > > > +
> > > > +    if ( !hdr )
> > > > +        return -EINVAL;
> > > > +
> > > > +    spin_lock(&channel->lock);
> > > > +
> > > > +    ret =3D send_smc_message(channel, hdr, tx_data, tx_size);
> > > > +    if ( ret )
> > > > +        goto clean;
> > > > +
> > > > +    ret =3D get_smc_response(channel, hdr, rx_data, rx_size);
> > > > +clean:
> > > > +    spin_unlock(&channel->lock);
> > > > +
> > > > +    return ret;
> > > > +}
> > > > +
> > > > +static struct scmi_channel *get_channel_by_id(uint8_t chan_id)
> > > > +{
> > > > +    struct scmi_channel *curr;
> > > > +    bool found =3D false;
> > > > +
> > > > +    spin_lock(&scmi_data.channel_list_lock);
> > > > +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> > >=20
> > > please use parenthesis around the inner if (also in other places)
> > >=20
> >=20
> > Thank you for the remark. I will fix it in v2.
> >=20
> > >=20
> > > > +        if ( curr->chan_id =3D=3D chan_id )
> > > > +        {
> > > > +            found =3D true;
> > > > +            break;
> > > > +        }
> > > > +
> > > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > > +    if ( found )
> > > > +        return curr;
> > > > +
> > > > +    return NULL;
> > > > +}
> > > > +
> > > > +static struct scmi_channel *get_channel_by_domain(uint8_t domain_i=
d)
> > >=20
> > > Use domid_t for domain ids.
> >=20
> > Thanks, I will fix it in v2.
> > >=20
> > > Also, wouldn't it be better to implement it as:
> > >=20
> > > static inline struct scmi_channel *get_channel_by_domain(struct domai=
n *d) {
> > >     return d->arch.sci
> > > }
> > >=20
> > That's a good point. I will take a look on it and fix in v2.
> > >=20
> > > > +{
> > > > +    struct scmi_channel *curr;
> > > > +    bool found =3D false;
> > > > +
> > > > +    spin_lock(&scmi_data.channel_list_lock);
> > > > +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> > > > +        if ( curr->domain_id =3D=3D domain_id )
> > > > +        {
> > > > +            found =3D true;
> > > > +            break;
> > > > +        }
> > > > +
> > > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > > +    if ( found )
> > > > +        return curr;
> > > > +
> > > > +    return NULL;
> > > > +}
> > > > +
> > > > +static struct scmi_channel *aquire_scmi_channel(int domain_id)
> > > > +{
> > > > +    struct scmi_channel *curr;
> > > > +    bool found =3D false;
> > > > +
> > > > +    ASSERT(domain_id !=3D DOMID_INVALID && domain_id >=3D 0);
> > > > +
> > > > +    spin_lock(&scmi_data.channel_list_lock);
> > > > +    list_for_each_entry(curr, &scmi_data.channel_list, list)
> > > > +        if ( (curr->domain_id =3D=3D DOMID_INVALID)
> > > > +            && (curr->chan_id !=3D HYP_CHANNEL) )
> > >=20
> > > If you use DOMID_XEN for HYP_CHANNEL, then this check becomes more
> > > intuitive
> > >=20
> >=20
> > We do not have direct relation between channel id and domain id.
> > One channel id can be reused by different domain_ids. So from my standp=
oint,
> > DOMID_XEN doesn't fit here.
> =20
> Below you wrote that you used DOMID_INVALID to mark a channel as free.
> That is fine, but then DOMID_INVALID shouldn't be used for HYP_CHANNEL
> because HYP_CHANNEL is not "free". In this function the check for
> curr->chan_id !=3D HYP_CHANNEL should be unnecessary and I think the code
> would look as follows:
>=20
>     list_for_each_entry(curr, &scmi_data.channel_list, list)
>     {
>         if ( (curr->domain_id =3D=3D DOMID_INVALID) )
>         {
>=20

Oh, now I understood your point. Thank you for that.
I will use DOMID_XEN for HYP_CHANNEL and remove curr->chan_id !=3D
HYP_CHANNEL. This will be fixed in v2.


> =20
> > > > +        {
> > > > +            curr->domain_id =3D domain_id;
> > > > +            found =3D true;
> > > > +            break;
> > > > +        }
> > > > +
> > > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > > +    if ( found )
> > > > +        return curr;
> > > > +
> > > > +    return NULL;
> > > > +}
> > > > +
> > > > +static void relinquish_scmi_channel(struct scmi_channel *channel)
> > > > +{
> > > > +    spin_lock(&scmi_data.channel_list_lock);
> > > > +    ASSERT(channel !=3D NULL);
> > >=20
> > > the ASSERT could be before the spin_lock
> > >=20
> >=20
> > Thank you. I will fix it in v2.
> >=20
> > >=20
> > > > +    channel->domain_id =3D DOMID_INVALID;
> > > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > > +}
> > > > +
> > > > +static struct scmi_channel *smc_create_channel(uint8_t chan_id,
> > > > +                                               uint32_t func_id, u=
int64_t addr)
> > > > +{
> > > > +    struct scmi_channel *channel;
> > > > +    mfn_t mfn;
> > > > +
> > > > +    channel =3D get_channel_by_id(chan_id);
> > > > +    if ( channel )
> > > > +        return ERR_PTR(EEXIST);
> > > > +
> > > > +    channel =3D xmalloc(struct scmi_channel);
> > > > +    if ( !channel )
> > > > +        return ERR_PTR(ENOMEM);
> > > > +
> > > > +    channel->chan_id =3D chan_id;
> > > > +    channel->func_id =3D func_id;
> > > > +    channel->domain_id =3D DOMID_INVALID;
> > >=20
> > > I take you are using DOMID_INVALID to mark a channel used by Xen itse=
lf?
> > > If so, then DOMID_XEN would be more appropriate.
> > >=20
> >=20
> > I use DOMID_INVALID to mark channel as free.
> >=20
> > >=20
> > > > +    mfn =3D maddr_to_mfn(addr);
> > > > +    channel->shmem =3D vmap(&mfn, 1);
> > >=20
> > > One thing to be careful is the mapping attributes, for a couple of
> > > reasons. As you might be aware, the ARM architecture forbids mismatch=
ing
> > > attributes for mapping memory in different places in the system. So t=
he
> > > attributes that we use here must be the same used by the firmware
> > > (and/or the guest.)
> > >=20
> > > The second reason to be careful is that in the bindings example
> > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml the shared
> > > memory is "mmio-sram", which is special. It is not supposed to be nor=
mal
> > > memory, but it is OK to map it cacheable. Still, it might be more
> > > appropriate to use ioremap_cache.
> > >=20
> >=20
> > Originally, I used vmap here to have memcpy and it works fine in our
> > setup. But I will do some research and email you with the results.
> >=20
> > >=20
> > > > +    if ( !channel->shmem )
> > > > +    {
> > > > +        xfree(channel);
> > > > +        return ERR_PTR(ENOMEM);
> > > > +    }
> > > > +
> > > > +    printk(XENLOG_DEBUG "scmi: Got shmem after vmap %p\n", channel=
->shmem);
> > > > +    channel->paddr =3D addr;
> > > > +    channel->shmem->channel_status =3D SCMI_SHMEM_CHAN_STAT_CHANNE=
L_FREE;
> > > > +    spin_lock_init(&channel->lock);
> > > > +    spin_lock(&scmi_data.channel_list_lock);
> > > > +    list_add(&channel->list, &scmi_data.channel_list);
> > > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > > +    return channel;
> > > > +}
> > > > +
> > > > +static int map_memory_to_domain(struct domain *d, uint64_t addr, u=
int64_t len)
> > > > +{
> > > > +    return iomem_permit_access(d, paddr_to_pfn(addr),
> > > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > > +}
> > > > +
> > > > +static int unmap_memory_from_domain(struct domain *d, uint64_t add=
r,
> > > > +                                     uint64_t len)
> > > > +{
> > > > +    return iomem_deny_access(d, paddr_to_pfn(addr),
> > > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > > +}
> > > > +
> > > > +static int dt_update_domain_range(struct domain *d, uint64_t addr,
> > > > +                                  uint64_t size)
> > > > +{
> > > > +    struct dt_device_node *shmem_node;
> > > > +    __be32 *hw_reg;
> > > > +    const struct dt_property *pp;
> > > > +    uint32_t len;
> > > > +
> > > > +    shmem_node =3D dt_find_compatible_node(NULL, NULL, "arm,scmi-s=
hmem");
> > >=20
> > > Here we are using "arm,scmi-shmem" while below we are checking for
> > > "linux,scmi_mem". What's the difference?
> >=20
> > linux,scmi_mem (I posted nodes examples above) describes memory region,=
 allocated
> > for all channels, while arm,scmi-shmem points to the exact channel (pag=
e in
> > linux,scmi_mem region).
> >
> >=20
> > > Also, this function is looking for "arm,scmi-shmem" in dt_host and
> > > replaces its value. For dom0less domUs we'll probably need a
> > > make_scmi_node function to create the node from scratch like for
> > > instance xen/arch/arm/domain_build.c:make_gic_domU_node.
> > >=20
> > > I wonder if we had such a function whether it wouldn't be better to a=
lso
> > > use it for dom0 (and blacklist the physical "arm,scmi-shmem" in
> > > handle_node so that dom0 doesn't get the real shared memory informati=
on
> > > by accident).
> > >=20
> >=20
> > Thank you for the remark. I will rework this in v2.
> >=20
> > >=20
> > > > +
> > > > +    if ( !shmem_node )
> > > > +    {
> > > > +        printk(XENLOG_ERR "scmi: Unable to find %s node in DT\n", =
SCMI_SHMEM);
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    pp =3D dt_find_property(shmem_node, "reg", &len);
> > > > +    if ( !pp )
> > > > +    {
> > > > +        printk(XENLOG_ERR "scmi: Unable to find regs entry in shme=
m node\n");
> > > > +        return -ENOENT;
> > > > +    }
> > > > +
> > > > +    hw_reg =3D pp->value;
> > > > +    dt_set_range(&hw_reg, shmem_node, addr, size);
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static void free_channel_list(void)
> > > > +{
> > > > +    struct scmi_channel *curr, *_curr;
> > > > +
> > > > +    spin_lock(&scmi_data.channel_list_lock);
> > > > +    list_for_each_entry_safe (curr, _curr, &scmi_data.channel_list=
, list)
> > > > +    {
> > > > +        vunmap(curr->shmem);
> > > > +        list_del(&curr->list);
> > > > +        xfree(curr);
> > > > +    }
> > > > +
> > > > +    spin_unlock(&scmi_data.channel_list_lock);
> > > > +}
> > > > +
> > > > +static __init bool scmi_probe(struct dt_device_node *scmi_node)
> > > > +{
> > > > +    struct dt_device_node *shmem_node;
> > > > +    int ret, i;
> > > > +    struct scmi_channel *channel, *agent_channel;
> > > > +    int n_agents;
> > > > +    scmi_msg_header_t hdr;
> > > > +    struct rx_t {
> > > > +        int32_t status;
> > > > +        uint32_t attributes;
> > > > +    } rx;
> > >=20
> > > Should rx be defined at the top together with scmi_perms_tx_t and
> > > others?
> > >=20
> >=20
> > I'd rather move scmi_perms_tx_t to scmi_add_device_by_devid because it'=
s
> > used only in 1 place.
> > So we will have rx and tx in scmi_add_device_by_devid and rx ( which
> > differs from rx in scmi_add_device_by_devid ) in scmi_probe.
> > I think it will be more understandable and no need to make unique names=
.
> > What do you think about that?
>=20
> I think that's OK
>=20
> =20
> > > > +    uint32_t func_id;
> > > > +
> > > > +    ASSERT(scmi_node !=3D NULL);
> > > > +
> > > > +    INIT_LIST_HEAD(&scmi_data.channel_list);
> > > > +    spin_lock_init(&scmi_data.channel_list_lock);
> > > > +
> > > > +    if ( !dt_property_read_u32(scmi_node, SCMI_SMC_ID, &func_id) )
> > > > +    {
> > > > +        printk(XENLOG_ERR "scmi: Unable to read smc-id from DT\n")=
;
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    shmem_node =3D dt_find_node_by_name(NULL, SCMI_SHARED_MEMORY);
> > >=20
> > > From the spec, it looks like you should be getting the shared memory
> > > area from the phandle list "shmem".
> > >=20
> >=20
> > We use SCMI_SHARED_MEMORY to get whole memory region (0x10 pages in my =
case),
> > we can use for the agents. As you can see below - Hypervisor received n=
umber of
> > agents from Firmware and split this region between agents.
>=20
> In general we can't use properties that are not part of the device tree
> spec, either https://urldefense.com/v3/__https://www.devicetree.org/speci=
fications/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595r=
MOsrnmof2zmk7BnhXCSnJPN$ [devicetree[.]org] or
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/tree/Documentation/devicetree/bindings__;!!GF_29dbcQI=
UBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXloYUaj$ =
[git[.]kernel[.]org]
>=20
> "linux,scmi_mem" is currently absent. Are you aware of any upstreaming
> activities to get "linux,scmi_mem" upstream under
> Documentation/devicetree/bindings in Linux?
>=20
> If "linux,scmi_mem" is going upstream in Linux, then we could use it.
> Otherwise, first "linux,scmi_mem" needs to be added somewhere under
> Documentation/devicetree/bindings (probably
> Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then we can
> work on the Xen code that makes use of it.
>=20
> Does it make sense?
>=20

Yes I agree. I think linux,scmi_mem and scmi_devid should be upstreamed.
I will add those properties to arm,scmi.yaml, mark them as related to XEN a=
nd send patch.


> =20
> > > > +    if ( IS_ERR_OR_NULL(shmem_node) )
> > > > +    {
> > > > +        printk(XENLOG_ERR
> > > > +               "scmi: Device tree error, can't parse shmem phandle=
 %ld\n",
> > > > +               PTR_ERR(shmem_node));
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    ret =3D dt_device_get_address(shmem_node, 0, &scmi_data.shmem_=
addr,
> > > > +                                &scmi_data.shmem_size);
> > > > +    if ( IS_ERR_VALUE(ret) )
> > > > +        return false;
> > > > +
> > > > +    channel =3D smc_create_channel(HYP_CHANNEL, func_id, scmi_data=
.shmem_addr);
> > > > +    if ( IS_ERR(channel) )
> > > > +        return false;
> > > > +
> > > > +    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
> > > > +    hdr.type =3D 0;
> > > > +    hdr.protocol =3D SCMI_BASE_PROTOCOL;
> > > > +
> > > > +    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
> > > > +    if ( ret )
> > > > +        goto clean;
> > > > +
> > > > +    ret =3D check_scmi_status(rx.status);
> > > > +    if ( ret )
> > > > +        goto clean;
> > > > +
> > > > +    n_agents =3D FIELD_GET(MSG_N_AGENTS_MASK, rx.attributes);
> > > > +    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
> > > > +
> > > > +    n_agents =3D (n_agents > scmi_data.shmem_size / PAGE_SIZE) ?
> > > > +        scmi_data.shmem_size / PAGE_SIZE : n_agents;
> > > > +
> > > > +    for ( i =3D 1; i < n_agents; i++ )
> > > > +    {
> > >=20
> > > Given that HYP_CHANNEL is actually zero, it looks like we could do
> > > everything here in this loop but starting from i=3D0?
> > >=20
> >=20
> > We allocate HYP_CHANNEL before loop because we need it to request numbe=
r
> > of agents. And we don't need to send SCMI_BASE_DISCOVER_AGENT to
> > HYP_CHANNEL.
> =20
> OK
>=20
> =20
> > > > +        uint32_t tx_agent_id =3D 0xFFFFFFFF;
> > > > +        struct {
> > > > +            int32_t status;
> > > > +            uint32_t agent_id;
> > > > +            char name[16];
> > > > +        } da_rx;
> > > > +
> > > > +        agent_channel =3D smc_create_channel(i, func_id, scmi_data=
.shmem_addr +
> > > > +                                           i * PAGE_SIZE);
> > > > +        if ( IS_ERR(agent_channel) )
> > > > +        {
> > > > +            ret =3D PTR_ERR(agent_channel);
> > > > +            goto clean;
> > > > +        }
> > > > +
> > > > +        hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
> > > > +        hdr.type =3D 0;
> > > > +        hdr.protocol =3D SCMI_BASE_PROTOCOL;
> > > > +
> > > > +        ret =3D do_smc_xfer(agent_channel, &hdr, &tx_agent_id,
> > > > +                          sizeof(tx_agent_id), &da_rx, sizeof(da_r=
x));
> > > > +        if ( ret )
> > > > +            goto clean;
> > > > +
> > > > +        ret =3D check_scmi_status(da_rx.status);
> > > > +        if ( ret )
> > > > +            goto clean;
> > > > +
> > > > +        printk(XENLOG_DEBUG "scmi: status=3D0x%x id=3D0x%x name=3D=
%s\n",
> > > > +                da_rx.status, da_rx.agent_id, da_rx.name);
> > > > +
> > > > +        agent_channel->agent_id =3D da_rx.agent_id;
> > > > +    }
> > > > +
> > > > +    scmi_data.initialized =3D true;
> > > > +    return true;
> > > > +
> > > > +clean:
> > > > +    free_channel_list();
> > > > +    return ret =3D=3D 0;
> > > > +}
> > > > +
> > > > +static int scmi_domain_init(struct domain *d)
> > > > +{
> > > > +    struct scmi_channel *channel;
> > > > +    int ret;
> > > > +
> > > > +    if ( !scmi_data.initialized )
> > > > +        return 0;
> > > > +
> > > > +    channel =3D aquire_scmi_channel(d->domain_id);
> > > > +    if ( IS_ERR_OR_NULL(channel) )
> > > > +        return -ENOENT;
> > > > +
> > > > +    printk(XENLOG_INFO "scmi: Aquire SCMI channel id =3D 0x%x , do=
main_id =3D %d"
> > > > +           "paddr =3D 0x%lx\n", channel->chan_id, channel->domain_=
id,
> > > > +           channel->paddr);
> > > > +
> > > > +    if ( is_hardware_domain(d) )
> > > > +    {
> > > > +        ret =3D map_memory_to_domain(d, scmi_data.shmem_addr,
> > > > +                                   scmi_data.shmem_size);
> > > > +        if ( IS_ERR_VALUE(ret) )
> > > > +            goto error;
> > > > +
> > > > +        ret =3D dt_update_domain_range(d, channel->paddr, PAGE_SIZ=
E);
> > > > +        if ( IS_ERR_VALUE(ret) )
> > > > +        {
> > > > +            int rc =3D unmap_memory_from_domain(d, scmi_data.shmem=
_addr,
> > > > +                                              scmi_data.shmem_size=
);
> > > > +            if ( rc )
> > > > +                printk(XENLOG_ERR "Unable to unmap_memory_from_dom=
ain\n");
> > > > +
> > > > +            goto error;
> > > > +        }
> > > > +    }
> > >=20
> > > Is dom0 the only domain to get direct access to the shared memory
> > > region? If so, I don't think it is a good idea to make Dom0 "special"=
 in
> > > this case.
> > >=20
> > > Let me make an example: if we assign a device to a domU since boot, a=
nd
> > > dom0 wants to change the frequency of a clock that affects the assign=
ed
> > > device (likely because it doesn't know it is assigned), then dom0
> > > shouldn't be able to.  We might have to perform checks in Xen to make
> > > sure dom0 cannot stop the clock for the assigned device.=20
> > >=20
> > > So I think it would be better if all domains are treated the same way=
 in
> > > the mediator unless really necessary.
> > >=20
> > > On the other hand, if all domains get access to the shared memory
> > > region, then I don't think this is likely the right place to create t=
he
> > > dom0 mapping. We probably want to do it in domain_build.c in a way th=
at
> > > can be reused for dom0less domUs.
> > >=20
> >=20
> > The idea is that all domains have their own page in shared memory
> > region and unigue agent_id. Agent_id is used to set permissions for
> > clocks\resets\power-domains etc. So during creation of domain (domUs or
> > dom0) device-tree is processed using scmi_add_dt_device and
> > clocks\resets\power-domains which are related to dom0 devices will be
> > requested by using SCMI_BASE_SET_DEVICE_PERMISSIONS message.
> > All passed-through devices will be requested during DomU creation. Whic=
h
> > means dom0 do not have an access to clocks\resets\power-domains, which
> > are related to DomU.
>=20
> OK, excellent
>=20
>=20
> > > In regards to shared memory: it looks like the only two functions to
> > > access the real shared memory are send_smc_message and get_smc_respon=
se.
> > > If that is the case, then we actually don't need to expose the real
> > > shared memory to any of the domains.
> > >=20
> > > We could simply:
> > >=20
> > > - expose a regular normal memory region as dom0/domU channel memory
> > > - on SMC trap, read from the "fake" shared memory and set the
> > >   corresponding real shared memory on the appropriate channel
> > > - issue the SMC call
> > > - on return from SMC, copy over data from the real shared memory to t=
he
> > >   "fake" channel reagion
> >=20
> > Hypervisor redirects only SMC calls from guests and set agent_id to SMC
> > parameters as a7. The idea was to give page for each agent, so we don't
> > need to make additional read/write each time we receive SMC call.
> > All we povide from hypervisor is agent_id. Firmware is responsible for
> > reading memory from the correct address and place the response.
> >=20
> > >=20
> > > This is useful if we need to "filter" any of the SCMI commands and
> > > options from the domains to the firmware, and also it is useful if th=
e
> > > channel memory is not page aligned. But if the permissions are
> > > fine-grained enough and also the channel memory is page aligned (and
> > > multiple of 4K in size) then we could map the memory.
> > >=20
> >=20
> > In current implementation we suppose that channel memory is page aligne=
d.
> > I think that Firmware should be responsible for permissions handling an=
d
> > "filtering", that's why permission calls were added to SCMI spec.
> > I tried to make mediator as thin as possible.
>=20
> OK. Can we check that the channel memory is page aligned at init time
> and throw an error if it is not the case?
>=20

Yes. I will add this check in v2.

>=20
> > > > +
> > > > +    d->arch.sci =3D channel;
> > > > +
> > > > +    return 0;
> > > > +error:
> > > > +    relinquish_scmi_channel(channel);
> > > > +
> > > > +    return ret;
> > > > +}
> > > > +
> > > > +static int scmi_add_device_by_devid(struct domain *d, uint32_t scm=
i_devid)
> > > > +{
> > > > +    struct scmi_channel *channel, *agent_channel;
> > > > +    scmi_msg_header_t hdr;
> > > > +    scmi_perms_tx_t tx;
> > > > +    struct rx_t {
> > > > +        int32_t status;
> > > > +        uint32_t attributes;
> > > > +    } rx;
> > > > +    int ret;
> > > > +
> > > > +    if ( !scmi_data.initialized )
> > > > +        return 0;
> > > > +
> > > > +    printk(XENLOG_DEBUG "scmi: scmi_devid =3D %d\n", scmi_devid);
> > > > +
> > > > +    agent_channel =3D get_channel_by_domain(d->domain_id);
> > > > +    if ( IS_ERR_OR_NULL(agent_channel) )
> > > > +        return PTR_ERR(agent_channel);
> > > > +
> > > > +    channel =3D get_channel_by_id(HYP_CHANNEL);
> > > > +    if ( IS_ERR_OR_NULL(channel) )
> > > > +        return PTR_ERR(channel);
> > > > +
> > > > +    hdr.id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS;
> > > > +    hdr.type =3D 0;
> > > > +    hdr.protocol =3D SCMI_BASE_PROTOCOL;
> > > > +
> > > > +    tx.agent_id =3D agent_channel->agent_id;
> > > > +    tx.device_id =3D scmi_devid;
> > > > +    tx.flags =3D SCMI_ALLOW_ACCESS;
> > > > +
> > > > +    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeo=
f(&rx));
> > > > +    if ( IS_ERR_VALUE(ret) )
> > > > +        return ret;
> > > > +
> > > > +    ret =3D check_scmi_status(rx.status);
> > > > +    if ( IS_ERR_VALUE(ret) )
> > > > +        return ret;
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static int scmi_add_dt_device(struct domain *d, struct dt_device_n=
ode *dev)
> > > > +{
> > > > +    uint32_t scmi_devid;
> > > > +
> > > > +    if ( (!scmi_data.initialized) || (!d->arch.sci) )
> > > > +        return 0;
> > > > +
> > > > +    if ( !dt_property_read_u32(dev, "scmi_devid", &scmi_devid) )
> > > > +        return 0;
> > >=20
> > > scmi_devid is another property that is not documented in the binding.
> > >=20
> >=20
> > This property should be added to the device nodes, which are using scmi
> > to work with clocks\resets\power-domains etc. This id should match the
> > device_id, defined in Firmware. Hypervisor send this device_id to the F=
irmware
> > as parameter to the permission request. Firmware set permissions to
> > clocks\resets\power-domains, related to this device.
>=20
> OK, I see. Unfortunately, scmi_devid is also not described under
> Documentation/devicetree/bindings/.
>=20
> This property seems to be actually required for the system to work
> correctly.
>=20
> Unless somebody else is already working on this, please send a patch to
> the Linux kernel mailing list CCing the SCMI maintainers and Rob Herring
> to introduce scmi_devid as a new property.
>=20

I will prepare and send patch introducing scmi_devid and linux,scmi_mem.

>=20
> > > > +    printk(XENLOG_INFO "scmi: dt_node =3D %s\n", dt_node_full_name=
(dev));
> > > > +
> > > > +    return scmi_add_device_by_devid(d, scmi_devid);
> > > > +}
> > > > +
> > > > +static int scmi_relinquish_resources(struct domain *d)
> > > > +{
> > > > +    int ret;
> > > > +    struct scmi_channel *channel, *agent_channel;
> > > > +    scmi_msg_header_t hdr;
> > > > +    struct reset_agent_tx {
> > > > +        uint32_t agent_id;
> > > > +        uint32_t flags;
> > > > +    } tx;
> > > > +    uint32_t rx;
> > > > +
> > > > +    if ( !d->arch.sci )
> > > > +        return 0;
> > > > +
> > > > +    agent_channel =3D d->arch.sci;
> > > > +
> > > > +    spin_lock(&agent_channel->lock);
> > > > +    tx.agent_id =3D agent_channel->agent_id;
> > > > +    spin_unlock(&agent_channel->lock);
> > > > +
> > > > +    channel =3D get_channel_by_id(HYP_CHANNEL);
> > > > +    if ( !channel )
> > > > +    {
> > > > +        printk(XENLOG_ERR
> > > > +               "scmi: Unable to get Hypervisor scmi channel for do=
main %d\n",
> > > > +               d->domain_id);
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    hdr.id =3D SCMI_BASE_RESET_AGENT_CONFIGURATION;
> > > > +    hdr.type =3D 0;
> > > > +    hdr.protocol =3D SCMI_BASE_PROTOCOL;
> > > > +
> > > > +    tx.flags =3D 0;
> > > > +
> > > > +    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeo=
f(rx));
> > > > +    if ( ret )
> > > > +        return ret;
> > > > +
> > > > +    ret =3D check_scmi_status(rx);
> > > > +
> > > > +    return ret;
> > > > +}
> > > > +
> > > > +static void scmi_domain_destroy(struct domain *d)
> > > > +{
> > > > +    struct scmi_channel *channel;
> > > > +
> > > > +    if ( !d->arch.sci )
> > > > +        return;
> > > > +
> > > > +    channel =3D d->arch.sci;
> > > > +    spin_lock(&channel->lock);
> > > > +
> > > > +    relinquish_scmi_channel(channel);
> > > > +    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
> > > > +
> > > > +    d->arch.sci =3D NULL;
> > > > +
> > > > +    unmap_memory_from_domain(d, channel->paddr, PAGE_SIZE);
> > > > +    spin_unlock(&channel->lock);
> > > > +    return;
> > > > +}
> > > > +
> > > > +static bool scmi_handle_call(struct domain *d, void *args)
> > > > +{
> > > > +    bool res =3D false;
> > > > +    struct scmi_channel *agent_channel;
> > > > +    struct arm_smccc_res resp;
> > > > +    struct cpu_user_regs *regs =3D args;
> > > > +
> > > > +    if ( !d->arch.sci )
> > > > +        return false;
> > > > +
> > > > +    agent_channel =3D d->arch.sci;
> > > > +    spin_lock(&agent_channel->lock);
> > > > +
> > > > +    if ( agent_channel->func_id !=3D regs->x0 )
> > > > +    {
> > > > +        printk(XENLOG_ERR "scmi: func_id mismatch, exiting\n");
> > > > +        goto unlock;
> > > > +    }
> > > > +
> > > > +    arm_smccc_smc(agent_channel->func_id, 0, 0, 0, 0, 0, 0,
> > > > +                  agent_channel->chan_id, &resp);
> > > > +
> > > > +    set_user_reg(regs, 0, resp.a0);
> > > > +    set_user_reg(regs, 1, resp.a1);
> > > > +    set_user_reg(regs, 2, resp.a2);
> > > > +    set_user_reg(regs, 3, resp.a3);
> > > > +    res =3D true;
> > > > +unlock:
> > > > +    spin_unlock(&agent_channel->lock);
> > > > +
> > > > +    return res;
> > > > +}
> > > > +
> > > > +static int scmi_get_channel_paddr(void *scmi_ops,
> > > > +                           struct xen_arch_domainconfig *config)
> > > > +{
> > > > +    struct scmi_channel *agent_channel =3D scmi_ops;
> > > > +
> > > > +    if ( !agent_channel )
> > > > +        return -EINVAL;
> > > > +
> > > > +    config->sci_agent_paddr =3D agent_channel->paddr;
> > > > +    return 0;
> > > > +}
> > >=20
> > > I am still not sure why it couldn't be done by scmi_domain_init.
> > >
> >=20
> > I can move this logic to scmi_domain_init, but in this case I have to a=
dd
> > struct xen_arch_domainconfig *config as input parameter to
> > scmi_domain_init and pass NULL from construct_dom0.
> > Do you think this approach would be better?
>=20
> I think it is OK to pass struct xen_arch_domainconfig *config as input
> parameter to scmi_domain_init.

Ok, I will fix it in v2.

>=20
> For dom0, why is sci_agent_paddr not supposed to be set?
>=20

paddr is the channel address. We need this address to update reg address
of arm,scmi-shmem node in guest device-tree, so guest scmi driver will
use shmem related to it.

>=20
>=20
> > Also I think it's reasonable to pass xen_arch_domainconfig so different
> > implementations could set another data they would probably need.
> >=20
> > >=20
> > > > +static const struct dt_device_match scmi_smc_match[] __initconst =
=3D
> > > > +{
> > > > +    DT_MATCH_SCMI_SMC,
> > > > +    { /* sentinel */ },
> > > > +};
> > > > +
> > > > +static const struct sci_mediator_ops scmi_ops =3D
> > > > +{
> > > > +    .probe =3D scmi_probe,
> > > > +    .domain_init =3D scmi_domain_init,
> > > > +    .domain_destroy =3D scmi_domain_destroy,
> > > > +    .add_dt_device =3D scmi_add_dt_device,
> > > > +    .relinquish_resources =3D scmi_relinquish_resources,
> > > > +    .handle_call =3D scmi_handle_call,
> > > > +    .get_channel_info =3D scmi_get_channel_paddr
> > > > +};
> > > > +
> > > > +REGISTER_SCI_MEDIATOR(scmi_smc, "SCMI-SMC", XEN_DOMCTL_CONFIG_SCI_=
SCMI_SMC,
> > > > +                      scmi_smc_match, &scmi_ops);
> > > > +
> > > > +/*
> > > > + * Local variables:
> > > > + * mode: C
> > > > + * c-file-style: "BSD"
> > > > + * c-basic-offset: 4
> > > > + * indent-tabs-mode: nil
> > > > + * End:
> > > > + */
> > > > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arc=
h-arm.h
> > > > index 9180be5e86..a67237942d 100644
> > > > --- a/xen/include/public/arch-arm.h
> > > > +++ b/xen/include/public/arch-arm.h
> > > > @@ -315,6 +315,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> > > >  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> > > > =20
> > > >  #define XEN_DOMCTL_CONFIG_SCI_NONE      0
> > > > +#define XEN_DOMCTL_CONFIG_SCI_SCMI_SMC  1
> > > > =20
> > > >  struct xen_arch_domainconfig {
> > > >      /* IN/OUT */=

