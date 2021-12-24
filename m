Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578A47F045
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 18:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251433.432776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ny2-0007r1-0Y; Fri, 24 Dec 2021 17:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251433.432776; Fri, 24 Dec 2021 17:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ny1-0007or-Td; Fri, 24 Dec 2021 17:02:53 +0000
Received: by outflank-mailman (input) for mailman id 251433;
 Fri, 24 Dec 2021 17:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uFu=RJ=epam.com=prvs=2992704931=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n0ny0-0007ol-Ko
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 17:02:52 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 538efbf1-64db-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 18:02:51 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BOG3mmE029023;
 Fri, 24 Dec 2021 17:02:47 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d5hd603vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Dec 2021 17:02:47 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7231.eurprd03.prod.outlook.com (2603:10a6:102:be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 17:02:44 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 17:02:44 +0000
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
X-Inumbo-ID: 538efbf1-64db-11ec-bb0b-79c175774b5d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3nFSQdhh3GkodloOk49Gd+t6j0l/uq0LnHhXtlW3P1jThLdUmW13sagC/b7xeSpAtUhtwNHFcP436MSCtBWmA+2EHcMbAD6cF48reNfyZLJ/1qfeBXOuaoVMHzsvNuVKlpIS3bAgXaJIVfHT5vpr4itdwP3LdfULbo7n1h4RvZVaSSl3IieXbaRq2ZmY4uACHusQmXVqQyBumCdqMrtMGLs61grILKFNcxGTtbhY4AiF/dUAQH8w7ISZUpI26NAOZcrpk7VJp/fufor1s9g8cKRaWPf1W7GrHDGUzGS3PXncePQzC5drH+Z3LGj9J3cUiRqgwD2pWHykhw/2zd7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG3pXakUTIbz5hpSxVpDtPPy5aq71dSI9uEKlO80ggQ=;
 b=UYjMVETxXg9ROM4oUnWmiEYRMWEPDe2eEDjs1W/3bLTW2yGKa+EvEqLVn1f91as0RdZ6BQi5Jpm5k9Vy/wM4DhiFYoPYB84/fGuJgpP50DVDryudLLYj8M4VDHLF/OzudnKBJUtLo10wYHD4GeX4sTCqhEb0eKryNTEYLeMUjtRahIEPDNjnz4tJwnEUHSz2UAMjhvqeweIncGLBD22fbjRllqF7ZXVybSREeDkJpOilcaBa9BKxWrxBUsEMhP9Z/DgzUmOH0IZNKrDa1VZy8SIXwCejH4dSiL41QamrlHUyerzX9uu7T7h7AHBXmOGcPmPQklN8ceXEEtDmNgXQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG3pXakUTIbz5hpSxVpDtPPy5aq71dSI9uEKlO80ggQ=;
 b=TIhNoFckuUQtSgt0pqOu7wX2xP/dxDRD794StOVjpdfspgm/iH8aoPB2V9odq5Rw/XsrB2v9wrgxNabJdbm0jYoCgWt08CCvNJ0WwBX5ztQcVkdCjN3ENBh2dPf3LHHjaHOsv9hQmGJAO2sw9VUoA3SxMSvdNw+1e8i9JG1dKkfRrtwqgcmEjtSHgW6VymgYg5/gi0i51/69Xs26iuq1ZAjc+EcI5KYb5L4hs34IKIIk9fXflFcWzdNNbhKjuniApvfnZ+vTeTk07FFEByGQqdW02GFDx8QV5wykZ9BZ7GaFe5ZnQs+XcIKsy9pbMwrcYATCuoijmnGPzZLX/LEooA==
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
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw2ks6AgAAeBwCAAAQPgIAABfaAgAAsl4CABKcNgIAGOOkAgAAnH4A=
Date: Fri, 24 Dec 2021 17:02:44 +0000
Message-ID: <20211224170243.GA1022822@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
 <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
 <20211217135855.GA4072899@EPUAKYIW015D>
 <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
 <20211220154127.GA1688861@EPUAKYIW015D>
 <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
In-Reply-To: <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcb5befb-b2af-4d14-7074-08d9c6ff3451
x-ms-traffictypediagnostic: PA4PR03MB7231:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7231D5DC68103964E104AD26E37F9@PA4PR03MB7231.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 B/UnAAx7tKUiZEwaZyfutlNpLOaHIhmoq8d02qh9U3b4H0j/ZlR4LhCcLkePIgKOby8ZchW0YEVZ0VSOMFHldXSUO6r3hrKXk1SLACQ6lfsM1aGkavbLylwRpFKtKGnssIMP6jZDiBWQn0CiOaXqHKWIPfU/HFgMssIC3NIULYRGYGTvcnmWKpdffZ7VjoDbqrl2c39JILcd7KIyukoXDk6xsiJH865YIHfPJcTEC19hC31lkiGFIGVKaR+8NIv6ee6+CuN0Mpim09TSjmHNsQGWY5WuARML2U/buWIG9GByNu95NuTkbepwxUhpUDWJmMA1m6Uwlae7Zd4JMsPKEoZMchf1LLGasjwA7Xlalrr4t5Br73IE+SsGhFLibe+iKfgo/6dGDUtW93onqcqKLRb5pEOr7hC8P7Ffy8c8PSngOen2NvDptq7qwrZx3pcETF7cvAKpxKdCHOL+bPrmee/1pCjsEabHepJy7mJfuFVE8xgHdrqHqbpO4fiaI8ZmLjwGYhH12ikSwM6ndJKSB4aCgwRmak4q1i4BmxPrRKDh5sh13jDX01U0ELtxlVGH2R0obn7BWenTiDeiNGXZIuVWqcRbeAcu81xgQIG2gmp64UH7ujb/ZR9mspFQaqAfprVTlo4lRjRWlMrsIwvAFK/Buv2xiUfmovGC3D1GCaio/T1N2amkD16sFyQJX2EEp89Rh9jC079ksVQyqYV5qZCg8H4yNX+CMYgsEJDto7GRtczbuHu98Tvy53U5NqLbNfqvVjp3D9e/KC0Djng0JDuYwh3AMqxUpoLjQT106B4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(38070700005)(38100700002)(122000001)(2906002)(6506007)(83380400001)(54906003)(316002)(66556008)(66946007)(1076003)(76116006)(86362001)(33716001)(4326008)(91956017)(508600001)(9686003)(66446008)(26005)(6486002)(966005)(5660300002)(71200400001)(8676002)(186003)(64756008)(53546011)(66476007)(6512007)(33656002)(6916009)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/TN1TruXWYzn2PEqt2wRUeIhI/mcbcFaYbWOG8ephAn2P/W96HuNPFStRUqM?=
 =?us-ascii?Q?fkFZMhP9jig+HaPLWbf/QmtbtKh/TeSjaXgwg8ivFCTcPT0BBV01j/CchXyd?=
 =?us-ascii?Q?QeqKOVr+l4VJoWxC+/nD8pe8DSApZItlDsfNy0hQS/2s3gDS8Huw59SRDsA+?=
 =?us-ascii?Q?PnK2m544+XV5N6CGYFvkmHAM2ra6Xo7RoUDDV7S8dF1ZzZml+BndoWoyUrLm?=
 =?us-ascii?Q?EpjhC92JRH/bW56tJWG2XwAh5tiDAhR7B2cmYtALVhBMeOK4snjvDHx30nSo?=
 =?us-ascii?Q?kwVCl4rcHKvQVx5GbQO58oZ1J3eLW6m/fOxEcaW7+qSXUVTVwUld6XvuLFsh?=
 =?us-ascii?Q?VWyDB2YMoEOnI/hyWeO+4v86WrDyXxbIQ6lPEnUPJO5n1p6vtxPTsVoIw5jh?=
 =?us-ascii?Q?2zZPvz66jcqWtFcYSnqWTc1t813/FHJ69NOfhvzjsCGCY8kYLB90to4Mn3rg?=
 =?us-ascii?Q?v/Ig5mt5XaB3Az9MJe8S016Uz8w1X2fc+LOaahjyrRparPGIlcZMI2UajmGt?=
 =?us-ascii?Q?tXnoEdPPmunRuSjU4AcniCxPf3t4NMYKepVtbMExbpNB6WCotc9F45j12txj?=
 =?us-ascii?Q?WXV3nR9hYDmjljuXeItmyG0h2hgoM8yWxqrNzf/Q7hV/F4DhR46+7SouSeLB?=
 =?us-ascii?Q?pKKvLb2tuHuTT5iW/eaHUZDswsSM0eJWo4VsxCtnV5ni6FGDn8bQsIu1iNXk?=
 =?us-ascii?Q?rckINvPmr8CtAN4XBF3k0wG+JeJ2sUX91GO7k3mWurR6FVqgnLDG2A2U3GGp?=
 =?us-ascii?Q?4idGIUmCc8PhPSxFyrvQlLb92/SHTqAol7m5x1ZgcC9vhafDN90u4zXPDZz9?=
 =?us-ascii?Q?JmF30n1F2VDMXY+a9c8PBORZkhgG80vA8LCmwqVnSE8AxFpYjsp1rMMl1bWk?=
 =?us-ascii?Q?l/F/fNKaJUSkA3349S04DNVcmUrzbv9auXjR7EGU84BNE9WuDzG46EbwJREO?=
 =?us-ascii?Q?DeUOvlEhDQw3jP8BvU8fitpLCO1m1l1QeEBIXw4lalm6qc2FDjEclIuvJ1dd?=
 =?us-ascii?Q?zbkq82h0WsUIWkTguGspfoXwqHIKixv4fVaAOOiT5+Wqy+6nMQc6MrpwRqrb?=
 =?us-ascii?Q?StJB6/3ABV8l1oJ7+/QrTnjmfZb9tYlBfawBY/JeO76yUF+nIgFd8GlA37jA?=
 =?us-ascii?Q?TJ6PMDxDXKlwBkwp2ib6PF2OGIuplbK0wjLCBwN+JuhGLReN4uXRWNG7B+Rl?=
 =?us-ascii?Q?O5POMXzVzglJ7/RQD8FeVlBFztVUuXdl+xvEhsasnb9iXdsg0VXx6bPZEwKO?=
 =?us-ascii?Q?VUPAWek6opqQh7QgA5XcAB65c2EpeG/x2OXMUwDCWGD1iEdbdmhqLSp+L1i4?=
 =?us-ascii?Q?X2SG9akYoRJCT2Q0DyDGT6aLA2IvxodzshLSeE8ZXHGMAnkgv1iRm3FXj1Aw?=
 =?us-ascii?Q?P0vTajuVXYW7Z4KMF62d/lxCODqnlio1EryF4+n4K8EFa8RUd/gioynQ8qpJ?=
 =?us-ascii?Q?6WsKbJhnB1nx3514pDe3po6UJtYX5P71joDv963WAz0CLifKz6LNADh/RBFv?=
 =?us-ascii?Q?gauoboZJekrdPGbZgwytrL6d3IWXRBjSWbGKeRlQXIrL9LA2+aSgV+VJVKrD?=
 =?us-ascii?Q?gePusfhB/ujDJV5kV4mHXTpn3wOZMVKxvDYMEdy0q9TJMfKPLdRB/FOV5CtS?=
 =?us-ascii?Q?rvjwqf8uA8msscH6IIroiZJ7LqFB1ytw7yOihhP+BZ/Gq7JXJTK+3uwyhYdE?=
 =?us-ascii?Q?VQ5xfR3bjvCkytGNEoTksgwkFRY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <507343ED772DC04EA52A8B775DB38E7E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb5befb-b2af-4d14-7074-08d9c6ff3451
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 17:02:44.3835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRNVtV5DPTxVJ2z682cbTPmcFdIHjX1MX/R69f9xegMSLNx68EdDta744xjJ7VaiHkYjMFWmnMGyKTGKQM+EaEStUEB3Izp9t5Gqh3QCH1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7231
X-Proofpoint-ORIG-GUID: 5HOx2ZezFbep1P4Hso1DDrYPYn5yZJgD
X-Proofpoint-GUID: 5HOx2ZezFbep1P4Hso1DDrYPYn5yZJgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-24_07,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112240082

On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrote:
> On 20/12/2021 16:41, Oleksii Moisieiev wrote:
> > Hi Julien,
>
> Hello,
>
> > On Fri, Dec 17, 2021 at 04:38:31PM +0000, Julien Grall wrote:
> > >
> > >
> > > On 17/12/2021 13:58, Oleksii Moisieiev wrote:
> > > > Hi Julien,
> > >
> > > Hi,
> > >
> > > > On Fri, Dec 17, 2021 at 01:37:35PM +0000, Julien Grall wrote:
> > > > > Hi,
> > > > >
> > > > > On 17/12/2021 13:23, Oleksii Moisieiev wrote:
> > > > > > > > +static int map_memory_to_domain(struct domain *d, uint64_t=
 addr, uint64_t len)
> > > > > > > > +{
> > > > > > > > +    return iomem_permit_access(d, paddr_to_pfn(addr),
> > > > > > > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static int unmap_memory_from_domain(struct domain *d, uint=
64_t addr,
> > > > > > > > +                                     uint64_t len)
> > > > > > > > +{
> > > > > > > > +    return iomem_deny_access(d, paddr_to_pfn(addr),
> > > > > > > > +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
> > > > > > > > +}
> > > > > > >
> > > > > > > I wonder, why we need an extra level of indirection here. And=
 if this is
> > > > > > > really needed, I wonder why map(unmap)_memory* name was chose=
n, as there is
> > > > > > > no memory mapping/unmapping really happens here.
> > > > > > >
> > > > > >
> > > > > > I've added extra indirection to hide math like
> > > > > > paddr_to_pfn(PAGE_ALIGN(addr + len -1)
> > > > > > so you don't have to math in each call. unmap_memory_from_domai=
n called
> > > > > > from 2 places, so I moved both calls to separate function.
> > > > > > Although, I agree that map/unmap is not perfect name. I conside=
r
> > > > > > renaming it to mem_permit_acces and mam_deny_access.
> > > > >
> > > > > I haven't looked at the rest of the series. But this discussion c=
aught my
> > > > > eye. This code implies that the address is page-aligned but the l=
ength not.
> > > > > Is that intended?
> > > > >
> > > > > That said, if you give permission to the domain on a full page th=
en it means
> > > > > it may be able to access address it should not. Can you explain w=
hy this is
> > > > > fine?
> > > > >
> > > >
> > > > The idea was that xen receives some memory from the dt_node linux,s=
cmi_mem,
> > > > then we split memory between the agents, so each agent get 1 page (=
we
> > > > allocate 0x10 pages right now).
> > >
> > > Thanks for the clarification. Does this imply the guest will be able =
to
> > > write message directly to the firmware?
> >
> > We used DEN0056C Specification as base. Available on: https://urldefens=
e.com/v3/__https://developer.arm.com/documentation/den0056/latest__;!!GF_29=
dbcQIUBPA!m9pWoxBEjb8Sd1CoV5cpU8MbmLCjohYQxv2ci9tDvMmZ9oCEitqyydZ3rQWXCM5bx=
vIn$ [developer[.]arm[.]com].
> > SCMI transport is described in Section 5.1. We implemented Shared Memor=
y transport.
> > Firmware has N pages of the shared memory, used to communicate with Age=
nts.
> > It allocates N agents and assign a page for each agent, such as:
> > -------------------------------------
> > | Agent H | Agent 1 | Agent 2 | ... |
> > -------------------------------------
> > Agent H is the privilleged Hypervisor agent, which is used to do the ba=
se commands,
> > such as getting Agent list, set\unset permissions etc.
> > Hypervisor assign agent to the guest and maps page, related to the agen=
t to the Guest.
> > So the Guest, which is Agent 1 will get an access to Agent 1 page.
> >
> > Guest places SCMI message to Agent 1 memory, then sends SMC message.
> > Hypervisor process SMC request, add agent id to the message parameters =
and redirects it to the Firmware.
> > Based on the agent_id Firmware knows which page it should read.
> > Then after permission check ( if the resetId/clockID/powerID etc from m=
essage
> > is assigned to agent_id ) it does changes to the HW and places response=
 to Agent
> > shared memory and marks channel as FREE ( by setting free bit in shared=
 memory ).
> > Once channel is marked as free - Guest read response from the shared me=
mory.
>
> So, IIUC, the hypervisor will not control what is written in the shared
> memory. It will only control the SMC parameters. Is my understanding
> correct?
>

For scmi_smc it will not. But potentially it can make some changes, or
convert to the different protocol.

> >
> > Non-virtualized systems will work as well. OS should send SMC directly =
to the Firmware.
> >
> > >
> > > If so, this brings a few more questions:
> > >    1) What will the guest write in it? Can it contains addresses?
> > Guest can write scmi request to the shared memory, which include the fo=
llowing data:
> > 1) protocol_id - which protocol is requested, such as clock, power, res=
et etc
> > 2) message_id - action that should be done to HW, such as do_reset or g=
et_clock
> > 3) message data - which includes reset_id/clock_id/power_id etc. that s=
hould be changed.
> > Reset IDs and Clock IDs are assigned in Firmware. Guest receives ID, co=
rresponding to the device from the device-tree.
> > dt_node as an example:
> > &avb {
> > 	scmi_devid =3D <0>;
> > 	clocks =3D <&scmi_clock 0>;
> > 	power-domains =3D <&scmi_power 0>;
> > 	resets =3D <&scmi_reset 0>;
> > };
> >
> > >    2) What are the expected memory attribute for the regions?
> >
> > xen uses iommu_permit_access to pass agent page to the guest. So guest =
can access the page directly.
>
> I think you misunderstood my comment. Memory can be mapped with various t=
ype
> (e.g. Device, Memory) and attribute (cacheable, non-cacheable...). What w=
ill
> the firmware expect? What will the guest OS usually?
>
> The reason I am asking is the attributes have to matched to avoid any
> coherency issues. At the moment, if you use XEN_DOMCTL_memory_mapping, Xe=
n
> will configure the stage-2 to use Device nGnRnE. As the result, the resul=
t
> memory access will be Device nGnRnE which is very strict.
>

Let me share with you the configuration example:
scmi expects memory to be configured in the device-tree:

cpu_scp_shm: scp-shmem@0xXXXXXXX {
	compatible =3D "arm,scmi-shmem";
	reg =3D <0x0 0xXXXXXX 0x0 0x1000>;
};

where XXXXXX address I allocate in alloc_magic_pages function.
Then I get paddr of the scmi channel for this domain and use
XEN_DOMCTL_memory_mapping to map scmi channel address to gfn.

Hope I wass able to answer your question.

Best regards,
Oleksii.=

