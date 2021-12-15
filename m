Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39247510E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 03:46:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247164.426155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKI0-0003bB-Qx; Wed, 15 Dec 2021 02:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247164.426155; Wed, 15 Dec 2021 02:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKI0-0003ZP-K4; Wed, 15 Dec 2021 02:45:08 +0000
Received: by outflank-mailman (input) for mailman id 247164;
 Wed, 15 Dec 2021 02:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4EW=RA=epam.com=prvs=29836cc2ab=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1mxKHz-0003ZE-DU
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 02:45:07 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01326321-5d51-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 03:45:05 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEJ1Bnw022232;
 Wed, 15 Dec 2021 02:45:00 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxur5t6nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 02:44:59 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7764.eurprd03.prod.outlook.com (2603:10a6:102:20a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Wed, 15 Dec
 2021 02:44:56 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 02:44:55 +0000
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
X-Inumbo-ID: 01326321-5d51-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWFEUnynb0sB9vUKZEGmrQt0cnH+MFGDTYcFIp5vtV129zSr8OJziSiTNGhMHekVJVOuGLDn//wtYVNn92NwQSjTHzC8hPjU/TCWfanyXpLxgFwVpwsD2eL00d5kXf4JObpD2cu8AbMhTQMx+spL1vz/AxsYyE4Fhj2Uif49XtqWf0knDfULVrcECykOAcQhcc3xj7ZT9gd+KO8UU8hXdUamMfLTX+MAXda20v4yy/ZYhotxhPf1lXyVtdukhD5YzpX9WrjTJYMxJdW3FSxLcTdgt8Qiz5Hvj65Du91E9nP2e0jJk8dIaxfxmJeCkgZkDm/JSYVmNhWUKZ/MWqB/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3Fox1akmzzJlMnIPBkUC0DQ6SQS2WrV90ks2hEFlTE=;
 b=R+ZreJ70EUh1Bj8uPBWNRxnh0I3tu4EqSnhima5mZ9Bv5cU+oouwaXA10AQYeKRW25GHf0scwtDXrIIeaiXxQ6H6gQlVWxVgw78LY8V4CtEq4YLKHeOCFBUrGdviUiJTibOPHa4sVzbs9FY/n6X2uXO8nGmETGYcLhqFlXo3b1H5XhqRsNzQNT7LQ2JVE87bYumOxCfwsQe8JpJ7nHBeY9xoWk5Dun5/xfZzNd+XYfGdA/ITdAEvEkOO2jCmkFX1AG71EeB3cfOCtdKgkln/nTsc9VqlkHDg7lMKtugTwkeBxVoR/O1ALHbqfppVt4uG2TXwdVLDlQf/KNraKI1/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3Fox1akmzzJlMnIPBkUC0DQ6SQS2WrV90ks2hEFlTE=;
 b=qT2WUaiL/FLh6b3Bw2n3PcammBtxNw/eKmLDhDdfiIF3QZHotdPJninMLM3aKayX50jANTCMWX8cqbPl7KEAT2dqeLAnfTspPhqa1A6AI/oG0IenEMjhTQSdErYdmou5RCWVJK17nLCZiShgs9XgRBBotQNIbu6HgE21SqRI+ziuPP406jE3UG6Ur5kRiqFVHjNlWaAwK56+AZJBY6FwDfOaNdlw1AzoB136kyPUoUUfkUFM7+EPMNORMIyeyw/O2ojcnxGPrrAQy9zYWcQfeo1TBMbcFvIgr8z318BHXDDEl0dZV14/WGAOnXSmKI1qPKeMRlJIqqnuvT1o0OoFUA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 08/10] iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP
 to 0
Thread-Topic: [PATCH 08/10] iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP
 to 0
Thread-Index: AQHX47d9QLo6g0x4ak2nHeVJbXy2O6wy86aA
Date: Wed, 15 Dec 2021 02:44:55 +0000
Message-ID: <87lf0my4cq.fsf@epam.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-9-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-9-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f97b201b-9b5b-4af2-bc60-08d9bf74e0e5
x-ms-traffictypediagnostic: PAXPR03MB7764:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB7764F2DBB1E357BE1ED4EA02E6769@PAXPR03MB7764.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zVLai2DIW8axhOcP37kC7YLTy0AIKtkp6BFUHo848i7YUgxIuwD32Msu3/Zk0gCqgVL9dxrhUp88Ywo9iWvTI0FyZcXUfmeD3dWlh+lSxdPjRf17zmJyr4BY59UPwrb806sD3+6gB+OOcPc6RQ4f0X2srMMWb/EIMzIIguGCxn6UeeQyIZbO83uVtnua8w1UyuLiVPIl3UpFpE5VfiUnc4LenaprCkvuj4NRR9vCPKZyO+QDMGXL23t1Xnwsvg5aR6fySUyv9h7LNQfpdLwH8wkVV9SA5c6F3cRtyWxacMr+8fszn0ufzHPBZc/7NGPL3Eh43HpplItOku8wFJU1HoPqiwOFr193Gs24UHY10qQUYhz53VvKHkhe0kII0Q5ujT/tET5KelxrnoWgQGHGks5HGRTmOLrUO6Hqamcx42aZ6Z1e5JiG1QJxJnjVqSvdfGnt7euVMv3W+sc1WTMiTG/s4Fa5FTl6nY1Fa/jxK38Hl76CK6s82OvY/M442TKGetJ8XojGFUZzFqvb/QMfwN0THRjQfb1RC9gV865fMjY4ZRgOYhJwVDtntXVAG74SEjC8BswMzT+HDq3WOVK9XaMNVSXi10tqUIqUVHy5COeJTFnQvFJPn0MMA5rLbRB1U50/1fbXPFagocbaLZACea0rg6ehsGiRWkNANtQlN5YjDChx1xLIoGgQ4Xw+OLSbM2fPek7PyWROAYkI2ZksOJHIRiSPkwulEULimXKzL1e5Fxnsm54sQ6P2frw09ikV1hTs39aty1Y+oa3ovzZbj4ZcaYjKCe/7QTOHEM3B6sQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(2616005)(76116006)(66946007)(66476007)(6512007)(508600001)(36756003)(38100700002)(38070700005)(54906003)(122000001)(91956017)(5660300002)(6486002)(966005)(316002)(71200400001)(66556008)(2906002)(6916009)(66446008)(55236004)(26005)(64756008)(83380400001)(8936002)(8676002)(6506007)(4326008)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?V0pu/8VmOcITgodxhQ29AncEFcE2vvm/O1MsCAjVEjkU2LrOKhyA9obFDg?=
 =?iso-8859-1?Q?EAYp2smAYXxJMJO6enlkqpdDvtpSHk15kwP3FaX/xIqEOD8wSM529BCTEh?=
 =?iso-8859-1?Q?DRnBu0gmA3XbOo/20GCYmdMaxKc7U4anHuMO19MxCHMnCXKAE/8e+bSMCa?=
 =?iso-8859-1?Q?KMc+0+W+9BD/pOsrTBRDf68yhW2+nTD1pQaizff2tDZWq8FCod7HPrX2ls?=
 =?iso-8859-1?Q?ihKYNJUjDiHsbo1P7+Xo+AVlMBbfkEnZuUJ9vi13t+Bd0ifOB3OqsUyLxN?=
 =?iso-8859-1?Q?7llJSOgipHfmZd2wC1M8unl8B6YWIu0p1Qp5/b4miqvIpMnrdfemsWrrsh?=
 =?iso-8859-1?Q?Jdk8GZxhVuTqc5Oxo9I8NtnErYI4gQOcnz6sFSE1ISldEFjPNYTTidNSb3?=
 =?iso-8859-1?Q?ZB1g/K5dy82e1vuqhvMJyWARVnN5yYvT/U+2yb2yqVhWTY5YRJAhwoHDDQ?=
 =?iso-8859-1?Q?UvEdvfPk8VO9eA+Hiqh5dae5ukU/8FQfLTkSUt4g/PUSmU8kgum48AhFkW?=
 =?iso-8859-1?Q?gM4Dt2qi49BQsPXpUSAgy6yJt/Q4ktQJgSAhEZRx+dU6rZL8EfKxk0z3Vh?=
 =?iso-8859-1?Q?kY5DPWAtLp7rASzdGB3vIUKRdRockIoNK3TOn3Ezb2xav2Dwff3vaxYh0N?=
 =?iso-8859-1?Q?vIGX2phmvuiniIULa1ylW1E7zLpUkeB0hHWPbCci3PhFeQ4bP01/wO2ISq?=
 =?iso-8859-1?Q?0Dwpb1liBocNdFoLx1MuHIo761OQ0szhizbb6qLgvC4+bjbF+YtUeW2xX7?=
 =?iso-8859-1?Q?FNhI80Ag48/7fYjj3LhY4WRAzEr7mx0DLHe072PdkYdcjeiKTvAFMIHJzs?=
 =?iso-8859-1?Q?UK2nML9C0xxpkrTkeAFVesGHDwG1ubHoFxBEDRwAqm3n8G7oHxk0S//eIv?=
 =?iso-8859-1?Q?p/reg/dg3enpeFhre2HJ8Vb/CGksRmRwgenryIDXDB80TLLJ/hnetZW8NT?=
 =?iso-8859-1?Q?E/AfYrz33s8D7gAaAIqSIpKMAJpUF2DXzlHYLMdds3DYS6qzag/Mw8gxL0?=
 =?iso-8859-1?Q?Z084BeZ4blAWQpq08Us2lh9irdZ+0obZ05guZtlGj54bzaVX7m1IE5h2AH?=
 =?iso-8859-1?Q?7456gISpFAo9deZz4HI6ylDoY0SZ1W9q8b9t9WlE8crofRi2Zq+e1MAqr0?=
 =?iso-8859-1?Q?CnQDjNVzz8OLxIIK0eUt55Em/oUiiQFspdr1pLExUO2y9w4GtEvGoRjZ/+?=
 =?iso-8859-1?Q?1IS8V6a+4ZBIJs9aNPtaTVeGAR6Tir8vUKQfGICMct0EflFVWSTB7bhoVg?=
 =?iso-8859-1?Q?czxtzk7v9HIG+OXMu3KZKS4BCyUeTu44krjlV9ShdKvZ40Xb/84AQA716h?=
 =?iso-8859-1?Q?MuBZOgNFX89pKgYquVro4VynYJ4hmlGQEQCN8ectdqhJI1QFunaRZSdorm?=
 =?iso-8859-1?Q?FsbZ1ILySj6toA6lefVBoqku397Ex55fbGAYV1Hwv3+kIAi4rvpICz1aFl?=
 =?iso-8859-1?Q?usUcQNjE6apjdw2JpQhdklyDSiKth3FyLcanv/oA3qUrU9OB/QUN3JXs5O?=
 =?iso-8859-1?Q?mpu85/mE9phlajZhXoujHYz5xhAOUdu5h1d01l8afBHBWUVBptb0cXBuLu?=
 =?iso-8859-1?Q?XXjLEw7rel3rqj2eHFj7P91GHrPamo1naqld5Fl2I+rFUdrbGHeMSwqPUm?=
 =?iso-8859-1?Q?i9UeBCkhqdPo+2fRmOW7OfFAoaZxDAnWQRv8RbUYZDDyrsWC2TVtzxKM0I?=
 =?iso-8859-1?Q?hnv8x8iVtju1WX4fEDqU0toL1jOTpR6srhnxfTlGzcqZxRVl6iO0FS+3FV?=
 =?iso-8859-1?Q?uqt7ZEoHiZkB20kvH/syvzlpU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97b201b-9b5b-4af2-bc60-08d9bf74e0e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 02:44:55.9118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffJfAvsdFudIesnCcfH+G1vZR+8J7IHXUEludmjweO5KDapV8nXEBrjIXifBOsWNsIdn04my5gu0BbyB1zIv4jgwJyUw8YUtXAkEt8XddFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7764
X-Proofpoint-GUID: eGoxWpieoxS4A87ApDwCr-n9fXADRz33
X-Proofpoint-ORIG-GUID: eGoxWpieoxS4A87ApDwCr-n9fXADRz33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150013


Hi Oleksandr,

Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Based on the following commits from the Renesas BSP:
> 8fba83d97cca709a05139c38e29408e81ed4cf62
> a8d93bc07da89a7fcf4d85f34d119a030310efa5
> located at:
> https://urldefense.com/v3/__https://github.com/renesas-rcar/linux-bsp/tre=
e/v5.10.41/rcar-5.1.3.rc5__;!!GF_29dbcQIUBPA!mB3ScUYdbD0s4mYzmb1Wu61fm6lRM1=
RhcvULXNjedfRRx0XhTk4HshhraUhZ3FRwxzSFY2I$ [github[.]com]
>
> Original commit messages:
>  commit 8fba83d97cca709a05139c38e29408e81ed4cf62
>  Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>  Date:   Wed Apr 28 18:54:44 2021 +0700
>
>   iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
>
>   Need to set bit IMSCTLR_USE_SECGRP to 0
>   because H/W initial value is unknown, without this
>   dma-transfer cannot be done due to address translation doesn't work.
>
>   Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>
>  commit a8d93bc07da89a7fcf4d85f34d119a030310efa5
>  Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>  Date:   Tue Sep 7 14:46:12 2021 +0700
>
>   iommu/ipmmu-vmsa: Update IMSCTLR register offset address for R-Car S4
>
>   Update IMSCTLR register offset address to align with R-Car S4 H/W UM.
>
>   Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>
> **********
>
> It is still a question whether this really needs to be done in Xen,
> rather in firmware, but better to be on the safe side. After all,
> if firmware already takes care of clearing this bit, nothing bad
> will happen.
>
> Please note the following:
> 1. I decided to squash both commits since the first commit adds clearing
> code and only the second one makes it functional on S4. Moreover, this is
> not a direct port. So it would be better to introduce complete solution
> by a single patch.
> 2. Although patch indeed does what it claims in the subject,
> the implementation is different in comparison with original changes.
> On Linux the clearing is done at runtime in ipmmu_domain_setup_context().
> On Xen the clearing is done at boot time in ipmmu_probe().
> The IMSCTLR is not a MMU "context" register at all, so I think there is
> no point in performing the clearing each time we initialize the context,
> instead perform the clearing at once during initialization.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index 8dfdae8..22dd84e 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -229,6 +229,9 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
>  #define IMUASID0(n)            (0x0308 + ((n) * 16))
>  #define IMUASID32(n)           (0x0608 + (((n) - 32) * 16))
> =20
> +#define IMSCTLR             0x0500
> +#define IMSCTLR_USE_SECGRP  (1 << 28)
> +
>  #define IMSAUXCTLR          0x0504
>  #define IMSAUXCTLR_S2PTE    (1 << 3)
> =20
> @@ -979,6 +982,10 @@ static int ipmmu_probe(struct dt_device_node *node)
>          set_bit(0, mmu->ctx);
>      }
> =20
> +    /* Do not use security group function. */
> +    reg =3D IMSCTLR + mmu->features->ctx_offset_stride_adj;
> +    ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
> +
>      spin_lock(&ipmmu_devices_lock);
>      list_add(&mmu->list, &ipmmu_devices);
>      spin_unlock(&ipmmu_devices_lock);


--=20
Volodymyr Babchuk at EPAM=

