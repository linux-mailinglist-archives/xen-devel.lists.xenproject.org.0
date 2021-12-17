Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A529478CF2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 14:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248655.428893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myDlQ-0004Ok-SD; Fri, 17 Dec 2021 13:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248655.428893; Fri, 17 Dec 2021 13:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myDlQ-0004LJ-O4; Fri, 17 Dec 2021 13:59:12 +0000
Received: by outflank-mailman (input) for mailman id 248655;
 Fri, 17 Dec 2021 13:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myDlO-0004LC-IR
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 13:59:10 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801b07a3-5f41-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 14:59:08 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BHDwBhi020552;
 Fri, 17 Dec 2021 13:59:04 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d0uang4a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 13:59:03 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7486.eurprd03.prod.outlook.com (2603:10a6:102:10e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Fri, 17 Dec
 2021 13:58:56 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 13:58:56 +0000
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
X-Inumbo-ID: 801b07a3-5f41-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHZG88eDrMQULTV9sBNc9p2GUSpj5YakKD2h7a4rmUR6h86A0EMUOmXel3FC2wuWe8aft4HsIKAQT6eTX5DZ+5q7YhfYCCNIkU5f0lYaR5g6UNMZCyc0oS7EUVwdFHxWyOL28t0HCnAux7Xtrp82m6u90Na8UUbs/w7xnn/y8mxNVsxfX8xXrmeq7NMKpghM458lsGb7C4Ru1oTGOel5gnW0PrUBuB4YitvJWsTwIluhTJEI8uF7LaC7baBmLl4PEDyqN0WpV1QyH35kfOgA94D5iy4XPgoxB6PNWQkuO7azpxQUSB/0/+WPeVfTJB8nv8BfJfNGz/RthoP9wy7P8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9raHJaVzXottLrjlJKE8XrEr3Amie7Jgf9biIHBeL4=;
 b=juzSeI8a49ycjtobV6XIxuqTUZNuDfhtSzMfbH3VYZtiWos+udD6yqtCfNvnmpDhkzpMzrvCkfucYyOAIOkjQMQZq2K+siHurm44dwAWrKxeYUG2kbWVOosNnUQCZmxutSXHn2e57OXch4tDmoImRKJjFk9hPkIhJOQnwVPDYVHkAO1HcAs5Z4Mau4RW3cjtLMjiigJYnk7h9JhyBPt0U9OslgOC6qn6weA0W6uHpPuVPCg5FKNV7KKfG3BxY8qrTX/JIjvOhv+uaKtfZFkK6Y8b49EjieAmj8peelpqaA6GO4+ZgDuFalZUL9maFTcwqrDG6guFQxY/CLpIq9CsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9raHJaVzXottLrjlJKE8XrEr3Amie7Jgf9biIHBeL4=;
 b=edSJ8DyktB3cuZ/g5gzRNFKyljrwHmfxaXK5jCdNLvVwSlSnhqeKXAtHlM4livuTGjYFun+8StrPvYEY8N+qApQEnEfFdUdHLpPRawWaKoiNRzT18nuNkHWNeiIHB8l9quS/r94WmjdYHu8nqONs1uaFlaAKUTdZvn0bTTLdgtlvfAKMWP5eRX5+SBM+1lxrrPtjIvQWpZlNg8v7y1VjdUBrMq4JE+ahC/BVUeaxXLVO79HPSvI81n8dXL7FXqWJHCjyOcr4FxgaUNVOrmZxff0fFf3Znk12ft3tJsRTwYxC3rrGjmf/5ShrQCfn67OdABxH7+lIAssXwRMu3IBbMg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaA
Date: Fri, 17 Dec 2021 13:58:56 +0000
Message-ID: <20211217135855.GA4072899@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
 <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
In-Reply-To: <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66108e4e-1b7a-427f-3f02-08d9c1655e13
x-ms-traffictypediagnostic: PA4PR03MB7486:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7486CE798D87B2829842E905E3789@PA4PR03MB7486.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gFCYt1S2heNfAaU+smwTSj8NzQdNpL3VITcb3wDgmM/eexNUCC4eKlNynsadR3SWmqXzXKUkdQnWsX678Vqpv+deRnj2bNSximhP5gF1QhlVD+jSrjx3RTonRrVHPOFg3SDRDnn8qwGCBnn/v1kG8yQt/vyO0+htRRMX8XmET1WBQCQ1+FjU78wCPbk38ARDQxsxh1P2bilc/ltxJYnR8+HAq8+py5uCc7/WsrZYYwO5ZxSGtBf2Gmt4kUKYsJB0faLRJM6oGis3AJ9vC5b2sAkXbR09DDAPmOyRB0k5GloFn9sWjqBENirRYzHsiGpKzw4bnj7zDGZPrWYAiScDGdIHSF5g+WGNTE+w/3S8pBMU1xNiwJMN6c37H33DmOermh61WUOMP60Ji/e+6E4W3SGY+4IjfD9ImnjmFEH78dtbAFdEsgYjAbX8iwz7nmgtjQPn0eQjknz1pQdX9EzHxAW91vv23Wsfn4xJPBitJWs+knLyP5d6PWHIQ3Dx/FRqK3fpaUTFelqh4TiBo8wNpPjRqamRy0m4CEK6u6CftGYCPTlmChz7aG0ajZdXXqdTXciP42zxDmZ3dx3rojZ4+epiZvCLBK0VIaAAZf6JgSWe6jsZQtlFrZgR7mT0Cw9QePV+iBud7RsQnaJZEiQMht0DqG9SjJgM7UIGWGvLPM5edVwQJ1vzby6/6eGHjilK6zKtg8avH9NP/J+O20jYJg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(1076003)(2906002)(6486002)(9686003)(71200400001)(122000001)(38100700002)(508600001)(8676002)(54906003)(83380400001)(33716001)(5660300002)(4326008)(8936002)(6512007)(33656002)(316002)(91956017)(53546011)(6506007)(26005)(76116006)(38070700005)(66556008)(66476007)(64756008)(66446008)(6916009)(66946007)(86362001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?f4c+5fRvAzjHd55AhKqzBKUUw19FzBwEU89tOej5yD3s+e7l6/aWVfZwAANe?=
 =?us-ascii?Q?rVZUprcTvAnJpZq6mLgaSlC3PlcjgZNS6y/j6b2wbcN40DTFZ1+EpyhHxCwC?=
 =?us-ascii?Q?2FvEHpCvsQxbo65S5MALiONqDRE9KUrzxhQUYYpAy0aTh0IVKXjVG+qbkmZN?=
 =?us-ascii?Q?hlY/vhF0pZ0tfUF3wNxMfaKJjkMMUf/BW6CDeZOMCHIWvR1JFSixfMIaZpBU?=
 =?us-ascii?Q?dsXTNL0NVlbvcGm+LoUfBz8OIOMSCu9UiawmOUVJC6h+mnyZ2BurF/Saq70f?=
 =?us-ascii?Q?uT2ghxT1HYDmChrtz6Ez2sbROZBeIK2c5noMyz3g3flMfwkj4rZDvZ9+3vzW?=
 =?us-ascii?Q?YfC+gy+CYZ1ImLlxuhEGSek3xIZ5dDbODe4EQCpfxwlCTLv74J+rWwbsfic7?=
 =?us-ascii?Q?nUuB5sAgEaYzgG/cygOP1DzJRIM1A0mkzpBbh7bQrMoo23/sgbYHJZGLGN2F?=
 =?us-ascii?Q?bwNk4LgkIYcsRpERRUhFbnXH96UTJvgG9MyBTl7Qf/t2o6mgh0193b3Eiyd0?=
 =?us-ascii?Q?wkX16WrufKcoGIguE1kClOiw4LVeNa9gtmRZgmnsq4jynaLGdQMfVXcTDOcU?=
 =?us-ascii?Q?CnSQOwomRSP28QCvHVCiEN34nc28PqWFGsdF9bQ5C2o85biSgRgL1x4YsuOF?=
 =?us-ascii?Q?eLpa4jRZ8D5VhUUTwvWSccU+dzW6gG9fdZFKq53KhXLe7LW4wbQu9/h9yNgX?=
 =?us-ascii?Q?UJG2Wynsx4Dy8P7b+CAAr+3rsHU3jPAl0xTV8/AxcmpYbo276wIvHy1Q12fM?=
 =?us-ascii?Q?SYu7xFJVt5sicMygbFXkAdlL+ClLxt87ZyL4Pqk4sormj3UKzek3M60fL9qL?=
 =?us-ascii?Q?aWjE/h3xlVJupl07E5EparNaq1bDqSx8qdfL12Gjd74GccDeNZi5PMJ58BzH?=
 =?us-ascii?Q?LL7QJXSkOBebSmEJdSEcOTyP6zHqj1iyTgNMwSoozlA1t3GyZVxciNlWLlpp?=
 =?us-ascii?Q?aOQ3jB1P2SumwpIbfR8q/jst0ul8guPHTkqcSNWwVlZ4zSRZ+NMioK+jdga+?=
 =?us-ascii?Q?n5PgDaLIlaHz3Q2U57ij3kq80VUAXEREj72LNPM7G1oERBgzhNc1HQBlGLRD?=
 =?us-ascii?Q?PpV5Y1UikJaDSuLgJCKe3bqNenBvZ7+6ZQLQhQ97xktiKxcIUbuxE98/G+gK?=
 =?us-ascii?Q?zzwHLvR/LgqbB62Hp2uHzdDqBdDQT6iyZCJpAcLCrhBMm5wYegeERUgM2Fi/?=
 =?us-ascii?Q?R21BAYJITZChX7SL+4LeL9h/Ln4WyRg1j+IZpDcoklLBl+7eust2+qpOQQeX?=
 =?us-ascii?Q?Mg5+M1IHEub9REABA2o1vG/CRbG8TM1LucdG/Pq9K1BcRyqae5vKeGBdUybT?=
 =?us-ascii?Q?984hLt2CqfAUI8kHg8jNH8bygiCpuYhSxE/W6ZI/tJmGymhm2iUcMp7OX4eS?=
 =?us-ascii?Q?RjkGu0R0pKgkofpFwAR2EWTaxg5qRs2fzZ7aN0PKShnnXb4dUhfvp5mA7LbQ?=
 =?us-ascii?Q?SzagJBxdylV5gJeoIWz76+oLSURY06mIDQVaBk8Gsi7VrKecFmXdSWIE08t4?=
 =?us-ascii?Q?Wn7BVhz7cDbtqHyqm1bjoQb39kqcAX2SrJoxHzxyP1Vs6UH455yqMsPs9Iyj?=
 =?us-ascii?Q?z1yteIeOofeKHsMgh+aRFxhmPrwR7FI3LTCrsNZSkWyZEgvmjh/eWn0nQ+1j?=
 =?us-ascii?Q?Ohd9YaLqzF36eaWmZGUtVIe8jbE2uD35rt58a7YPlx6vgXukc3NepfRFgDIb?=
 =?us-ascii?Q?qdcTHYg7WLPyW2FH3JSStuTKypI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B48FC53700B4F43BA3D3B94888C322A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66108e4e-1b7a-427f-3f02-08d9c1655e13
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 13:58:56.2875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnpbqXeBeK8h2YJxXAwhyoGZ3P3MxBQp6+LZGbW5pbWOAzpiLdce4ZDS8UasZu6mRtdsaFItp0CogMdsS2J7wh++YdUTISJKd1vOF11qgoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7486
X-Proofpoint-GUID: u3G8F0o5Kka6-cFRIyk4_8YW21ayPyPE
X-Proofpoint-ORIG-GUID: u3G8F0o5Kka6-cFRIyk4_8YW21ayPyPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxlogscore=751
 phishscore=0 mlxscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170082

Hi Julien,

On Fri, Dec 17, 2021 at 01:37:35PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 17/12/2021 13:23, Oleksii Moisieiev wrote:
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
> > >=20
> > > I wonder, why we need an extra level of indirection here. And if this=
 is
> > > really needed, I wonder why map(unmap)_memory* name was chosen, as th=
ere is
> > > no memory mapping/unmapping really happens here.
> > >=20
> >=20
> > I've added extra indirection to hide math like
> > paddr_to_pfn(PAGE_ALIGN(addr + len -1)
> > so you don't have to math in each call. unmap_memory_from_domain called
> > from 2 places, so I moved both calls to separate function.
> > Although, I agree that map/unmap is not perfect name. I consider
> > renaming it to mem_permit_acces and mam_deny_access.
>=20
> I haven't looked at the rest of the series. But this discussion caught my
> eye. This code implies that the address is page-aligned but the length no=
t.
> Is that intended?
>=20
> That said, if you give permission to the domain on a full page then it me=
ans
> it may be able to access address it should not. Can you explain why this =
is
> fine?
>=20

The idea was that xen receives some memory from the dt_node linux,scmi_mem,
then we split memory between the agents, so each agent get 1 page (we
allocate 0x10 pages right now).
But this is a good point, I think we should check length to be aligned
before making any permission changes.
I will add it in v2.=20
Thank you for remark.

Oleksii.=

