Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4032147F038
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 17:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251429.432765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0nkp-0005MA-Ph; Fri, 24 Dec 2021 16:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251429.432765; Fri, 24 Dec 2021 16:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0nkp-0005Jb-Mk; Fri, 24 Dec 2021 16:49:15 +0000
Received: by outflank-mailman (input) for mailman id 251429;
 Fri, 24 Dec 2021 16:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uFu=RJ=epam.com=prvs=2992704931=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1n0nko-0005JV-KV
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 16:49:14 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b857e82-64d9-11ec-9e60-abaf8a552007;
 Fri, 24 Dec 2021 17:49:12 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BOGhYiZ021471;
 Fri, 24 Dec 2021 16:49:08 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d5hd602rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Dec 2021 16:49:08 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR3PR03MB6650.eurprd03.prod.outlook.com (2603:10a6:102:7d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 16:49:06 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 16:49:06 +0000
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
X-Inumbo-ID: 6b857e82-64d9-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYF+BQdT2Vf1gKw7oyYmqnXE0kJx0YsnGHLmN/REfPwD9mKpzqUCxTHL7WTmNAGslPHvaZvDGddoyfLFxV3kLnKhZUy8TQaK36w2seYSEeAveu1c+r02A5hs8IRDkHpo+6JnB79e/dAAbmW2ATrEVNsIYdvunr9K+ZENowKZ1tg/ulSetSu9XNOhhldW62ySi2iV0mkmC4YakUf/1o5osE3zPsGotZbN9hwAqFfxgDR3cov3j4eV+5dp68mwG1mBmkIiVkFsZTxVyM7wOqkhB+xZ3fxW4qjwocP+VCG+X037Jrw+7xhtzonSpxy/XKT8Uxgv7vQicZ7XFRxzKHB6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFhv5e8SmBpUDZMBw1w8SolLmCMpO1vwdnw5mJXfyik=;
 b=RYXoAM+vqw/mQ2dB7Q69Rw4xoHl2LCeEW152TMre+82wSwKY7TU/fJByZCOMyS8zIXfIFIf8R9K8l2XFbUmynPB11W3XLzIzm/0bj4Nfm2zXw0UKhtUZzIWZOsmWtG0OvS6aoFKk37H7/Jla3javLvzNsmrxQpPpcTEIEW/U0dgk/ciELrgdN1TDEM+GxpD++cv+7Ny/GYPxJ+USG1GL4AJOEqIMdb7G1bRSbvHDoc3FTif7o7SjEMPWYv4vngAYunPvvM/jldCMZ13vbg2YiZVEPQXPTgKMlt2VPpAX5BcUxX6NqYS2/eE5j8bgtTQqhXZdjd03E+OJE9LMiHAsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFhv5e8SmBpUDZMBw1w8SolLmCMpO1vwdnw5mJXfyik=;
 b=mpPP7WGtSS2vdBJxppIShzYIN5ggKHbd49UsCfQ4KilF8vib7QzyymTA7IXCAekZNPEkojmnfunzh9IgeHjX/CestTxt4EOEa7Mik8fY/59f8mzJcidfacTU+SDGp7RJf0fZRv45fB/Us82yPsEhWUiKefGbyX+WrygOCL/Ua/Rd2y/87oIFwwdJby1oOpWZzRHfmhxeHK5f5kdsWF9k++9oK/4NIFYMKpFxA+Fu9qaRGzbb+mKblnN17LWX98YjvywQj9PkK3WPQD+nyYX4GFpA+LhfqflR5kFiYM0PgyJFJh/BrZqSb674PjfkOLmzlQHrgWrfAILZJTlohOAi2g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgAEYTICAAFamgIAA3WqAgAAIW4CAAAhUAIAAJymA
Date: Fri, 24 Dec 2021 16:49:06 +0000
Message-ID: <20211224164905.GA1016129@EPUAKYIW015D>
References: 
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20211223190637.GA99855@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112231610270.2060010@ubuntu-linux-20-04-desktop>
 <437596a2-b375-fc79-a865-186f7eaf10a8@xen.org>
 <20211224135819.GA945512@EPUAKYIW015D>
 <4bb8ee4f-8e8b-5e85-0801-ae3df93dbabc@xen.org>
In-Reply-To: <4bb8ee4f-8e8b-5e85-0801-ae3df93dbabc@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23817fcf-de48-40d4-3832-08d9c6fd4cb9
x-ms-traffictypediagnostic: PR3PR03MB6650:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB6650BA7F7DC4F3E4AFBE067CE37F9@PR3PR03MB6650.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SooRI84PrZ3jmTb8ajoEozvo4DrG+lcHQ3T3JTLJqM4zsceL7FRvkq9uwQbp0wgrxHbim+2KU66DNKHjVqsOyWuFZ9YV3M0ad/akPTvDoJWEtyY2r7g3fr+M+cABx25GlE74KZHBMKwaA6k+BkgH+kHrVa4OzpkRCI8DElmblBAN6aSDtM2yct4u/dTLxZ1R5GJzlB3e0cmhWgxAeSPzEJpaQ+m1agXmZzNTUqmVI67orM7OgMTGFzXpp3tw8PymPGrnnD5vGSea0IekKfk4uhhqG8WUGypuy+y7XaNumb1Gy7q9VFY/IQzVTVnICYyPvgqopP9xyhveFIJKyBf5ET8ZdvhUt4KxN1dRIwyz5zq44CAQeBxfE4wdBDE/eDH1xcWzmoG27vyGy95fkO+aLWXGictLQLGiJBBsdSuJVJc1aU4pJcslRcgb1oEr+o5Ga3eQ7uJhxc9RaWblGUEQqUOfl/xWOA/oZtVZL7yEc7foAc/vn1XGs1iD6qwvsCXX4RS+boGw8VXS7zdj0Y5gUTW0jsv+ZomQAkm2Auluy5Ez0GcvAFCXTUlleq2tzH3oauyMWiag0n5p2gM+Nk5IQAyhb+0SPSznoT/HCk+uhKq+SuBdcT8vcmCqiffI2P2wW4i5ywVVF7DZrCFzePMw5EnPyG2Njns9hcCR4tkIbxGiM0pUI6Hl0lujRN19CT/2zKb5cvVoysK/EDGRMJxHfKS/7XRa9vsqfFECpK+iatg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(33656002)(71200400001)(38100700002)(4326008)(6512007)(54906003)(6486002)(6916009)(33716001)(9686003)(508600001)(122000001)(2906002)(83380400001)(5660300002)(186003)(8936002)(53546011)(6506007)(66556008)(66446008)(64756008)(1076003)(91956017)(86362001)(76116006)(316002)(26005)(66476007)(66946007)(38070700005)(8676002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?B/Nnks4NZMFxGZE/8NYTN8IHdyBxlqKldvIOfwiEFWSLFeKuHvZub8qvPkS1?=
 =?us-ascii?Q?+04+vIZ3mGW74gSiKZRorMZ6bKFMPjp93+9RGAmrionFjZLhqHwpiDdvYsLL?=
 =?us-ascii?Q?ednKu0TBfUHWGfPlQPf1emZaMzW9o7eJZzGz4i6wn+SyrYwuZy/10aI7byGy?=
 =?us-ascii?Q?SSUmxVdD7Mm9ikMWeE6sOX7OAv3i9Fx1lPZXwvO+x3oX2QzUvrdyQ3Lx8WI/?=
 =?us-ascii?Q?eDBuzUz3n4lFTB+Mjv3Y3gLgXMUdxhH4L2PqV5lIgqYizqDIptQtYk5evypX?=
 =?us-ascii?Q?t2vlbbnbK0MGlhOY2LiIe0v6xp5d58hDkb/k74H+V2QuIpxREdPRJ69tJ6f6?=
 =?us-ascii?Q?EB7u6f8yx8Xu0qW+RdwLublthnJcJf1xCIAnMFBCQKO1J2M+IejQt+XOUpU/?=
 =?us-ascii?Q?W+3AjEZ3upBOVQUNeYWIPgYRegDtZtl4XT7cnBe8kCQNx1bXoPfLu1auUIBZ?=
 =?us-ascii?Q?bfb5lo7dma55IMibGPB9IsatpKzRe5HsBe4PovkFXH3xeZS/lecwPdmZjREg?=
 =?us-ascii?Q?apzXXRIhwGtrzTCMKUQYxVEV9OPqTbTIGZcXu3Eq2tdJtoJetLlHKV8TMN8L?=
 =?us-ascii?Q?vER1mH46nKdxLuzNQ/+ZqckgkG88fX4uNNueXbSgIlRD99k2hca71pW1LsfR?=
 =?us-ascii?Q?1TvOrWWbElYKoFzq5EhwVd/d+/pTWMOLVZLvFqtngyPZUGnWQBGlw+HTq3Bg?=
 =?us-ascii?Q?KBB6kYaSSvmDoN/KhKjwVG9Eham2RtPCMs0Lua42Y+gXt3pNBOjJwedPYb4D?=
 =?us-ascii?Q?Ic9rUCrKHgYexUueforAFklcNalCpW2HQVqJf+TzoowIhcYtSteqf9cQ/KWO?=
 =?us-ascii?Q?VlETr06V0funbIkoqQHgWbK2irqY8Z/F1sfjVmiaCGM3VhchiV54DILPvCtc?=
 =?us-ascii?Q?uWqA80HtEOluALDePPMFxyqfl3Z/3qIJjcyfQ5h4H2S0l4eLXWUPzpHip2V6?=
 =?us-ascii?Q?sL3yMbOTR23Z7Dj8fWqPUNG+osJyRjmy8h5jzCxCsLe7PfyqW7W+RPA/wKSh?=
 =?us-ascii?Q?4Fs7t1S37o6vYTBcP9swLpzhUkbdUGTvDQzwmr4LU8uGydERbbsCPsjIo/oR?=
 =?us-ascii?Q?yJk9fMcodGVhtI4835A7buOv+OdcdUaaCQ1TRncqEPedsNKtRpoO6Z6PPIck?=
 =?us-ascii?Q?vIHIp1DscnveF0IFFJCipDe66Y3ykKpv4I1ac5HZuRPymp9MS2lqTD6O2k0X?=
 =?us-ascii?Q?I7uZVOt6/ARlFoFAyzdUT8E6QU8/4ReY/U1/CCOGAjh0S95RV4AbntXYCgiK?=
 =?us-ascii?Q?dPq3xjfVehJQ6wnlcMIKauptMOn9KoHUOQJCkYWL3o6KD89S2j1U0D4+1491?=
 =?us-ascii?Q?57mmVN/NgG874B8iknI9Nql99ydSDGIoWDTbZ9z6P3wxoUoLCOw5Fb+bLfW1?=
 =?us-ascii?Q?u7XL2cfU+GFshonaB/rCN5rKHIneE+2SkLrWMQLyqf+5JUh4sru/JhACAba4?=
 =?us-ascii?Q?wZQVRoFZX3lvqoFGFD6vp5HXcLZfSgWTeeKV4Qv+eCfJlN4WOlg7tEGnhBgR?=
 =?us-ascii?Q?tApl3n0vfwf5BygQ/Wg42EdyItkIJAnz8qy2EC0sBIHudpJtUh+T/ZDaKXjq?=
 =?us-ascii?Q?JGusG/DHmq3hcema8kg9Mzt4TjLI+d2GPuzdZ0jWkor3J9LU3pGdSK+MJaqC?=
 =?us-ascii?Q?KgV5lmCRaNIE5QYyMMPxVzfk5H9xUwI+X/r44E6/X7Uxm8JSi0bvCOuebn4C?=
 =?us-ascii?Q?SLGFx5d3vZwdBFZchD1I2EaKBGQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5FFF28FF477D74CBDF612A728254D7A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23817fcf-de48-40d4-3832-08d9c6fd4cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 16:49:06.5087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ng8h9mQ006wdxwfZCW/R4JB7CVcV0N4wtbQkDY6MVZoe+L97LYKoSR/sUCp4hI4oCFMPstZGYp8GUnzSQPupW/iek1MDqcYtF4VGAmaKPMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6650
X-Proofpoint-ORIG-GUID: BdGsWz5MIEpVa85SzB1L8b6PSPbOyGYN
X-Proofpoint-GUID: BdGsWz5MIEpVa85SzB1L8b6PSPbOyGYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-24_07,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=648 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112240081

On Fri, Dec 24, 2021 at 03:28:56PM +0100, Julien Grall wrote:
>=20
>=20
> On 24/12/2021 14:59, Oleksii Moisieiev wrote:
> > Hi Julien,
>=20
> Hello,
>=20
> > On Fri, Dec 24, 2021 at 02:29:13PM +0100, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 24/12/2021 01:16, Stefano Stabellini wrote:
> > > > > One more question: As you probably seen - Jan had a complains abo=
ut SCI
> > > > > term. He said SCI is ambiguous with ACPI's System
> > > > > Control Interrupt.
> > > >=20
> > > > I see his point. As a term I see "SCMI" often and sometimes "SCPI" =
but
> > > > "SCI" is the first time I saw it with this patch series.
> > > >=20
> > > >=20
> > > > > I think of using SC (as System Control) instead. What do you thin=
k
> > > > > about it?
> > > >=20
> > > > Yeah, I am not great at naming things but maybe "ARM_SCI"?  "SC" al=
one
> > > > doesn't give me enough context to guess what it is.
> > >=20
> > > I might be missing some context. Why are naming everything SCI rather=
 than
> > > SMCI?
> >=20
> > Because we're expecting other interfaces and transport to be
> > implemented, such as for example:
> > scmi_mailbox, scpi_smc, scpi_mailbox, ti_sci_smc etc.
>=20
> Oh, now that explain why there is a layer of indirection in Xen. It wasn'=
t
> very clear from the cover letter why it was present.
>=20
Please see below.
> >=20
> > >=20
> > > >=20
> > > > Or we could broaden the scope and call it "firmware_interface"?
> > > How would this be used? Will it be a list of interface that will be e=
xposed
> > > to the guest?
> > >=20
> >=20
> > The idea is to set mediator type for each Domain, so for example Xen ca=
n
> > use scmi_mailbox to communicate with SCP, Dom0 and DomD are also using
> > scmi_mailbox, but DomU using scmi_smc mediator because we have only 3
> > mailboxes in system. This is not implemented yet, right now, we are
> > introducing only scmi_smc support. In future, multiple mediator support
> > can be added to Xen.
>=20
> Ok. So will there be only one interface at the time for a given domain. I=
s
> that correct?
>=20
Correct. The idea is that we provice only one interface to the Domain,
so different domains can use different protocols and transport. Those
interfaces can be different than the interface Xen uses to connect to SCP.
This allows us to vary the configuration. So for example:
Let's take system, that support only 2 mailboxes and communication with
SCP can use only mailboxes as transport. We intent to use scmi protocol
to manage HW. In this case we use 2 mailboxes for Xen-> SCP
communication, and for Dom0 -> Xen. Domu can be configured to use
scmi_smc, so the communication should be the following:
DomU --smc--> Xen -mailbox--> SCP Firmware.
Let's say we want to add DomainX with OS XXX, which using yyy protocol
with zzz transport. Then we can configure DomX wuth yyy_zzz mediator, so
the communication will be the following:
DomX --yyy--> Xen -mailbox--> SCP Firmware
Where Xen knows how to convert message from yyy protocol to scmi protocol.

I considered the alternative way, when we can configure domain with
several mediators, so each Domain can be configured to use, for example,
scmi_smc for power-domains and scpi_smc for clocks and resets. But I
don't see real use-cases for this configuration.

What do you think about that?

Best regards,
Oleksii=

