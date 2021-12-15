Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA24762AD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 21:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247551.426875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxaZt-0002PS-Td; Wed, 15 Dec 2021 20:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247551.426875; Wed, 15 Dec 2021 20:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxaZt-0002Mg-Pj; Wed, 15 Dec 2021 20:08:41 +0000
Received: by outflank-mailman (input) for mailman id 247551;
 Wed, 15 Dec 2021 20:08:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPoj=RA=epam.com=prvs=29839f4640=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mxaZr-0002Ma-Vo
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 20:08:40 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c97ac6ee-5de2-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 21:08:37 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFJNtCB004716;
 Wed, 15 Dec 2021 20:08:34 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cypfsg46w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 20:08:34 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6896.eurprd03.prod.outlook.com (2603:10a6:102:f0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 15 Dec
 2021 20:08:25 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 20:08:24 +0000
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
X-Inumbo-ID: c97ac6ee-5de2-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq1Uv6HeBGuw3xvyHr3GWhD313wrdozu8dNIPiGMqzEhl5CKcw6Ux/RJ84rUtHhadAUHgUaxQYqilZ8LUf9lbtkRiUM1AC+tWz3hHkxnqely/Myy+OXvoCck8IQsPTBEgcHGfoCVoXaeRQZEXGMniXPUmEaB1xsxnZg9guKugKH3MP333rT0lrpCBxlIbkGc8IU3yONaEdQxEbsXvAP/bx1egwB0aoHto7Y1R07bYCw7WIHnWp2bx4GfFyTDVssKK/aT2lLKiPm0F/QEdu0JCN+oq7hyYlIxavZ8C+Rc4EfgokLxS6hTglaGhb6iGleWhRjxPPXOjBBCwREvI2GnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9gLp6jqYVwp/qjEnQqTuO2dPYJAqmREZ989xP/LZNM=;
 b=YvC4tI/bYnoXZ9tLu5+leD/5+xfVY7gxnXLzFG2e3zxaY3YRc/ayFyq8HJxHO6duXByhPGY/oezySVT57cMp2t6610QNkv5qItSwovO4bDFmfEYP3g88n+h3d3DLvi+XO6zI00ywO0WLM62bLX7Si47Wgm+gtiHVdw73mexuH9gY5IF1aOBk9+tD99fb23ZdQrNPDuezglgiG+/d/0MPeeZvXX7NbL8QUcKhbIlHIGchX4xKjOEpYpVHgGDCKXrQUX/DZfKjJhr8yKw/b/hNPOB377ZRv3l7wiNp3n1nsMh2VW/kV+ipVoCiggHOiRkHPZveE3k+1Oc614EAPMulTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9gLp6jqYVwp/qjEnQqTuO2dPYJAqmREZ989xP/LZNM=;
 b=CLoNtUzSvZVt5gd1MCZiIH96KvF1M+ckl6/Wdz4T7s0hEtSan5Lf4j01TMTYhMUKu4Vun2JJbNCH1vwOvn7v763sXFeYBN3395Y31SAYRPd3CdqshyvpIjDHcBKfVFz3H8puGTREkj/Sv6fJiPMXj6PdFrdhEN81T441VBYxMCGqn4NKEAjbqehzHMuq6qb0TNYO02V1mZYWeHvtmSqE1Ki02rYVYO1kwlA6n1FXijlJCl1gnXrOzCVETDF0rygk4oeWFPESqgpZ+GtTC2mDrnbFwPn6K9H1UtDLivxZeZvg2nIe8aMtcVWovzMrcu8zCwzvRY6/sf+ii/GGUX4vOw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
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
Thread-Index: AQHX8M3HLq8qFfw2eU2jxqbriRiMpawzGv8AgADibAA=
Date: Wed, 15 Dec 2021 20:08:24 +0000
Message-ID: <20211215200824.GA2923921@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
 <e6087283-063f-bd4b-060b-e366c30add64@epam.com>
In-Reply-To: <e6087283-063f-bd4b-060b-e366c30add64@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cabb48a9-b764-4ae2-b786-08d9c006a6a7
x-ms-traffictypediagnostic: PA4PR03MB6896:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB6896CF8F55F9E30A9FD59403E3769@PA4PR03MB6896.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 06GXjNDDD5vU3GrxTFmFIkJ1pyJwOAQL+0T0bZbaQmXal3r64mAItllHRx4zYYyMphI2tc48IDuLElLyriWvWqQ1G08eNUXC1TfPKC2Nd5B43n/vD5r1kVNlD3T5u+CkenZMDEiF939kDo6Wk6IleZLlSETQCGt+CqSEg6t7aWWUtlguvm7x0BPg5D87JmoH16YxPlz5dFdQRzQwMxMmdTVB7HIfMXUd1c3YZJKBl7jaOVMCKkTV5I7hbzoMzpFBIGjU4Y+nZ6t9wr6XBpTqpA8ZGxAG93dz7zDbbzFmINACVrMeu6HgrbkR9De+W+ZW8AwxdPhec9rRNZPI82r3JNjfC17/xDSaRORoUGBbsiJQIzHbg/jtomEyqzv2w1+t0ga/zXDEWskJbNMDDsi1nz3R/VlWj0HxPtANYsJMpxwZW6RWwCaTs7Ldn/S90m/3ejLZiZEcgx50mD0H2ShZjRozrpHz9HM0VLJ6YFUQ2T8HIdWR47kN1I9VLvIKdBbPGeW5WkluzjYQuHp+DmUbNtD5L58T2x7LZCKogXtJ6er19BtfoFHNCiyxI7Mxt7c4fW+N6e5reN2+Q6uvGxMAzWIz4XU4fznUSD3lNDW5weyL1AraGZMoRQquz7yEqgqmD/Mem+8jM5AmG3TZVkdLQBfvrQ3+6D+T0datwyCBdkRp5ZdLZ14y+czUIColxpTzMVhguPD8QLZlEW91jpiDwZoWlz+Lbnyu0zA5xZV7TRo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(122000001)(38070700005)(316002)(5660300002)(6862004)(66556008)(9686003)(64756008)(1076003)(38100700002)(53546011)(508600001)(6512007)(91956017)(8936002)(6636002)(33716001)(33656002)(66946007)(76116006)(54906003)(4326008)(6506007)(66476007)(71200400001)(66446008)(8676002)(2906002)(26005)(6486002)(186003)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?d2bStpfh7eBQwly2Mmo4UcyOt3eXCetD85fcf3AgHux93auj58NtKwn5Zdci?=
 =?us-ascii?Q?IUmaFzFwurD/Caa4ClE7cgCDVusvSXaJrqHXz8k5D2FB48cfED8ZQzRfn076?=
 =?us-ascii?Q?L1qzpynG9GNej2HqZl1MkBjsnIPwnbM7h/sHIeMxjN0Zz6dn6ZZ+AKinhIZ9?=
 =?us-ascii?Q?RuWoP0X1169eSroXJW3H0h2SDn/GKlVHkwVZ4/xlS+pSIxOWW1RGh/gUiPbO?=
 =?us-ascii?Q?FA0qGQl7yyHuQE+XVLWRfqAiZvTd6+JeLJsCamVjkOs00eBwciuV8+JkQy9F?=
 =?us-ascii?Q?C265IpY4lfUFZp707iVugyA1dXB7xqntbAfKynKZE0HZ0HAoSsKIEkZ5H8Nf?=
 =?us-ascii?Q?sb+xIIqjgOg4weBvUOBaM9WNhQ7lI9NtXImHmj0eNT7U8DLQP9Vmp9JKL+rX?=
 =?us-ascii?Q?9w2cr4/e1htIUyGV7rCtoGS/c0oMop4Ggcc6NP3Is8+Wn0IBL/G+SJqzu9t5?=
 =?us-ascii?Q?FOdvEgTYW5T9KHFLYJKf/YOXVXcXaht6f8ElCAfvaPZQqGIX6ZfhtDeLg0wN?=
 =?us-ascii?Q?sts3IuBBXsYRQXvkE7QkiAgv8tM4Ux7LJP0fkymTpJgzqI56TuO1CRGaKJOb?=
 =?us-ascii?Q?B5RJrFxD7Glv7lfj43RhYi91lTT34xUXoREFZfWBkiPH09ZmAEIFlejUKzTV?=
 =?us-ascii?Q?sksE7+4J2W7cIVHuIlv7ZvaTuA8aMIyZAcbYf8vYtmWdVeqieO4NtduPvuAW?=
 =?us-ascii?Q?zgBT+c7Npwk6rtq+jdF8QpGGm9G8sjHxVeKi3b9MnIwCuSRHL/JbYP9uQm6p?=
 =?us-ascii?Q?KVsTlGqOmhgCQoNZbk6wQDambvxJ9cTwGqmbiltgaQ0HHf9bjNSEGR4I2ghP?=
 =?us-ascii?Q?IfvqRImtA4R8yOm6jFY4btcGWSXHSZ1NJiNvPr0hc8PLkkNgz0UGPGKsvn1x?=
 =?us-ascii?Q?tBJtwDyS40GUfXK1SSUWYll6zMX6A5MOt14PLWR6qL5Bt+IBUJayHKogdRwy?=
 =?us-ascii?Q?B2zhQA4UM8XTe6cBQubfK+FLNghi28Bk5oE9km/Jh/gnSX6prlL7JaLIryQM?=
 =?us-ascii?Q?1vHt7ZBkdDL9/Fac8mVRrSye5B9Vbkvn2cp75Tn457facHuyRm57RikgKGVT?=
 =?us-ascii?Q?5V8TDCVZVqlbRUS52mrIqqd/dZauGvk8l8n7+c8NQiC1jMFyQaUgNX/MMM1B?=
 =?us-ascii?Q?ksLrt+SCYSi1Za4Ru11JDIbKchWtvWlASxbBjmwUk80KIs4Fx+vGKN9rXjTE?=
 =?us-ascii?Q?l/z8M6HBNFfQQtDMCRoaLMMUXPhUBBaCBNcw09BRE27ZPDFypNqHS0zAeh4c?=
 =?us-ascii?Q?aDRR+oBCv0HsaMw74b8tdeYxjD9MwpQnsbCnUpTFQ6jvnJs5KLe0nBXsXYab?=
 =?us-ascii?Q?NEyH47U/1ei4cnxlrCxilYReXPLIxICmov2xHrbel0CCOf4yvxf/J6cUa1wP?=
 =?us-ascii?Q?C9FNIxV+127hrAnWsz6/SWwkIdnxZzv+CG7slTT2dxexOMLXiwZzngQ8zzor?=
 =?us-ascii?Q?Cj7Mvy3SXzQzTgWnnvesd5kqEKSBS11UxpLGfoWIrGmlAMP/FAUDAgL1NS8h?=
 =?us-ascii?Q?ajIPWZhNe9Byf31T1uwN7l6HnJ8L4dBaI7BVzfiJK26SevfvNhsDDFmyA/9B?=
 =?us-ascii?Q?C1Vhgqk1dMpHKcosaGB0o/ckDqbgHSpfMNLKIXkk4pjy0cbbBSAyu6z8KlTO?=
 =?us-ascii?Q?us24r/DK/mLBhEa62r1QxSDKJZjY3GxYR0TO6a9MkD577UBJC22KUkKdghuT?=
 =?us-ascii?Q?ApXRQygWsaDKLapRHAy7Hr+USCs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21BCBA49A57A6943B913A04035FEC0A7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabb48a9-b764-4ae2-b786-08d9c006a6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 20:08:24.6888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODm0WS/s4XmiLQyXdKIynyiOx1B8tS2s4O5ljp6CqlIEgGXmf/dk+OMX/kX+Na8vQusXly9pRiFjpDVsSM4x8JnrD4jQqZN0flYTUq0gnZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6896
X-Proofpoint-ORIG-GUID: gPr90shcKY3nj3efbwFEzNUKrKhZeJaH
X-Proofpoint-GUID: gPr90shcKY3nj3efbwFEzNUKrKhZeJaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_12,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150112

Hi Oleksandr,

Thank you for the point.
I will add it to the next patch version.

Best regards,
Oleksii=20

On Wed, Dec 15, 2021 at 06:38:00AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Oleksii!
>=20
> On 14.12.21 11:34, Oleksii Moisieiev wrote:
> > Implementation includes platform-specific smc handler for rcar3 platfor=
m.
> >
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> > ---
> >   xen/arch/arm/platforms/Makefile |  1 +
> >   xen/arch/arm/platforms/rcar3.c  | 46 ++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 47 insertions(+)
> >   create mode 100644 xen/arch/arm/platforms/rcar3.c
> >
> > diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/M=
akefile
> > index 8632f4115f..b64c25de6c 100644
> > --- a/xen/arch/arm/platforms/Makefile
> > +++ b/xen/arch/arm/platforms/Makefile
> > @@ -4,6 +4,7 @@ obj-$(CONFIG_ALL32_PLAT) +=3D exynos5.o
> >   obj-$(CONFIG_ALL32_PLAT) +=3D midway.o
> >   obj-$(CONFIG_ALL32_PLAT) +=3D omap5.o
> >   obj-$(CONFIG_ALL32_PLAT) +=3D rcar2.o
> > +obj-$(CONFIG_RCAR3) +=3D rcar3.o
> >   obj-$(CONFIG_ALL64_PLAT) +=3D seattle.o
> >   obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
> >   obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
> > diff --git a/xen/arch/arm/platforms/rcar3.c b/xen/arch/arm/platforms/rc=
ar3.c
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
> > +    NULL
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
> > + */=

