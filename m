Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4C8D687A
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 19:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733814.1140118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD6O8-0007pQ-6w; Fri, 31 May 2024 17:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733814.1140118; Fri, 31 May 2024 17:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD6O8-0007nR-3B; Fri, 31 May 2024 17:50:00 +0000
Received: by outflank-mailman (input) for mailman id 733814;
 Fri, 31 May 2024 17:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCkY=NC=epam.com=prvs=288140c18d=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1sD6O6-0007nL-8X
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 17:49:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 301e7011-1f76-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 19:49:55 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VDM4JX026259;
 Fri, 31 May 2024 17:49:40 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3yffce8vpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:49:39 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU2PR03MB9970.eurprd03.prod.outlook.com
 (2603:10a6:10:46c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Fri, 31 May
 2024 17:49:36 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.7633.001; Fri, 31 May 2024
 17:49:36 +0000
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
X-Inumbo-ID: 301e7011-1f76-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eL+HlJy51J6ROJzPKFw/eK/1v50bmA9Aqzbir+NkX8xxWvWQbNA2EgOM6q9o9Oh0fqaxloAERE/yaDDmlzfd0N5wDv47AlZ4RdA83JwdwkbUZ2mtpud+c0E48H4wli/PgXS0kx+daM61k/j7SdGHc/0DoajRw0v1pthM0L+BORrndkCggX39myX3c369DTtsKuBh3SKt8gzVkmzeApIt2SNBJa9CbdJAJdW8UMCHe5cST33tL4zd6xFwYjfyS9/GqDJiwz3bNxtsbDv37xsoyUlvV2Ce/e7wpqupDNZataTgMmviuKqVRUg91JnbeDr80xxh4o7uuky5qhpaNAvkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CL11dFNt49tELnrbAYGB/LEe0N9IS3YfQ7Qsks3K5Y=;
 b=nU1X970wB78GzEyOMvlv+9C6T214iI8/y5IdenEHj97Aj6zYt0dQ+AEWu/tQ/OVZB4Yta/P3NgcnZyImHr9Ht/Avf8tTHiwc5prcZpkL5G4IOhoIq9HbssNeI/AqcaPZEzJ0vEPE1fFLca7GIkOXv+G17klt19c5muKflz+Zk/cgNucwYuFl4jNbU9Go96inPXOflqPqwP2Yj49LLj3ifgkbbSNjnDQyl1BN0RM2fxKs1qoc7r8TiO7489U/TIEZnmKohdTYfFiVHFrG8lIMb5HWslHKbVCQB3woYbX0AxUeC1MkkarVjHJMsj1lpRZvMD81GyBaBgo6TQfKSdz9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CL11dFNt49tELnrbAYGB/LEe0N9IS3YfQ7Qsks3K5Y=;
 b=X7H6PHnZAD8FF8tKgMbMxN00RI8Avhlr9LOhCGg8kMp36VlS8JTf0KNdA4D794roR02ZuQaVEycRWO2bnM2WfsPzr0l7t3c3wNkCpjYuFePISRdnWB4Z8ZI+oXuyKWaVSrzDk2tEPoBAvI5tTWZMH/dHAt4Fzs36yjhBv0IZNBFHnDTx5pLCe7nrtn6cgLowyklMYQCUdTQUnBkEId8p6an4KboYbUdDrdZcErjJqCgEMh13qO/SEenLwIn278YB79MgFJcCvfkPBi/HxV6qrZVvoUWAwBJFEm6UuxpTJWJxoJEngCLId0hwv5lcrjDfINah+DQDrXzeCD7YaCmC8w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v2] arm: dom0less: add TEE support
Thread-Topic: [RFC PATCH v2] arm: dom0less: add TEE support
Thread-Index: AQHas4LmA3+MKr53jE6Kc+pdYgdQGA==
Date: Fri, 31 May 2024 17:49:36 +0000
Message-ID: <20240531174915.1679443-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.45.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU2PR03MB9970:EE_
x-ms-office365-filtering-correlation-id: c41824e4-2e25-47f9-cf7b-08dc819a0953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?v6Fbscfp+joX2Gs0rp++8Vmzhj3lZ/+UycxfQ1FKkhuk8D3s99tr1dm/sn?=
 =?iso-8859-1?Q?bfJ7UdWg8A+NRAGJ6lB0PheTO5OyJhwiCZa7lhaDujmqEAcaUXuxCyBF/V?=
 =?iso-8859-1?Q?rCOFM0IJGsu2pycTe9Ex3DRPB+PhUBWAMvShd6K4/isBLC8ysv0E6ETl2n?=
 =?iso-8859-1?Q?+YTRvUYpBiUGDmSOIYluHeOl4GrtklLKH8k4t/DVKF1Gf1QP55qfsidLeK?=
 =?iso-8859-1?Q?NE73R6a5fBZ5XKFtyzBm3qsHP9ssyr8rmkGdP9ITen0IgRhvG5OVc/bKRs?=
 =?iso-8859-1?Q?tam2LyuKNpAROfn0OOVO9VvsnRbyD6h9iVKgqY/tpPiQ0G74sBVv87AtPK?=
 =?iso-8859-1?Q?PO2ztuqH5F4pOlq2e1Jf2BreEA/wONLpxr3FTfKEPfLZup68SYTIGVvhuw?=
 =?iso-8859-1?Q?mzHNbCRQZd57o0clF3pSe6xYhX3R1dNAwFNBwPYcNfH2LcvKfQg1uNIwAQ?=
 =?iso-8859-1?Q?2jxg8cz/Fh6rPM2cy6duYpVgs3FzqnM4MhVAYfH/+HP4uz+TFqAASS0UOP?=
 =?iso-8859-1?Q?ul+6hKlEHh8IdGoCxZUTp3asGIX26OtMREwwxKyWP3Tqrlc9vIAY/DrJs1?=
 =?iso-8859-1?Q?uM5lXHZyI3jtdJz85ryXqJw8KRAq+gAXczkWsWWOd5PpD6c1Gl16VMAFmP?=
 =?iso-8859-1?Q?lN33a1UJ728flY2x5+mw9YFqW+usKkW9OYMHsMpynGbzpQGVl61TjXLSBx?=
 =?iso-8859-1?Q?UA+gOj17GLIK9MYsbP5lsOxoWgUmy6spdW2wZVYzRSCVRwiyE5J2w1Mhxg?=
 =?iso-8859-1?Q?XOHwDQWNwVFV9NFlUlf30nymXryCO7YdpHRVsD03T6UT5WZJOlTAJBkYer?=
 =?iso-8859-1?Q?PK6Q5P2YYsVgB/yQg/IzkIWDbKM6fLDQuoBkB+n7byq4JPjAefEGSZTVBW?=
 =?iso-8859-1?Q?nwsUpKasHQLp+9AoqysPqfbl0CIwQeIel9gk9hEmMbhpOK5m/ql6f768Cj?=
 =?iso-8859-1?Q?4yVgaC39JWPEST3TD5wVjAgY93Zv2Rk7XjWc41XoJ/38CuysbCv5K5bKHb?=
 =?iso-8859-1?Q?s2vsPf8q4UGYuT75+0huJi0kPOgKYhkrZ7vnvFD8SSuYwK1c0HvFkeo142?=
 =?iso-8859-1?Q?jC9HtaTMuaItg9SlqJJ2eFD1eHt2lkqwxCWqFpyQPEYT/es73wwmm5yONK?=
 =?iso-8859-1?Q?98Mw9HcmlwDnnGRywG0uxEFDQQIgHrO+sJf9742h/QYwtGlPGTOgiWbBTO?=
 =?iso-8859-1?Q?BnujCyHsEXyHEzAbDlY5LvnGegKMi5ULDHlAxJ+Zxk/C7YtathmM18wZ7T?=
 =?iso-8859-1?Q?pQsZPRXo/90HGl/5E3Ywjxt2AVVjUPEgjBSdEWQLZgy4uXibh6JOFcXfNL?=
 =?iso-8859-1?Q?qZPOcRfIvtdDJjCv45DCZJTk5758NJaFDWtny34NtK8q/AojSdcZzvNUQp?=
 =?iso-8859-1?Q?uRZsOo2b1oANKmOOiXrgthQ996JvMVmA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?IFQz9aCHIug/BIpKTZH2LDBDh19hnzHRlqSYNUrYxF2y/sZH3LpNcBnXNV?=
 =?iso-8859-1?Q?KzvtMRLLL6RPNEPfcGSvD68uHBt5tAyv/Ua6L187zsZGe3/+mrSsCZtKEs?=
 =?iso-8859-1?Q?ikFSbtuqqyrRXCW9Ult8xF3T/kQUYGmjndTRVXQukvbryc8N6aIAfXnu/h?=
 =?iso-8859-1?Q?HRjHaepErIiXX+IIQrJNDOrSR8IdTnsj8/5YnhNzwr22nNdqese9HsQoAT?=
 =?iso-8859-1?Q?gXDFESolPdBPLhbldxIGyBUlRxnVZ4GthiNtpBaWzcMOLL4TEmYobIn9pE?=
 =?iso-8859-1?Q?ZSYsdbhev7Fu+l92c5B6M8LoJiDuJkl0Q8RtrgQSm9qYm/lj/yx8Rx7cxG?=
 =?iso-8859-1?Q?jruYyjaver0bzPVg0PtoQuxWNnBEU/TKY1TFFSWr3ndC+v5OInK/SdrVJE?=
 =?iso-8859-1?Q?dGN0Rr4TZOk1leArEera3c5yJc9uNGociD5KOyWFJ7r2KzBLLw8IX73kNB?=
 =?iso-8859-1?Q?ikCDuNh2aX8UaHd78QU8iyfzvfWQsZNW/a977EVWd+kOpwaf6wZNHM+GOY?=
 =?iso-8859-1?Q?M0OTvEFy74wvvzcNfefPGLFzDxowQ9sbyi6NaMwwKhLNq1OZxbWThT42z+?=
 =?iso-8859-1?Q?vtNE2Yy/Mdrz+5kxdxG9O24pB1UHtWYLFCkDL/iqaApHKcVqw5ZCVeC/7p?=
 =?iso-8859-1?Q?3xErViSIpY7SignvM6CtGonaxAQBfHeV1qPhljCWvkcZFGJ8PvDcWPkmqd?=
 =?iso-8859-1?Q?FXKT1UYloPVwUCH5wKSClOVdqxqZrVZemoYIUq9J16lcCvNx41YBcVqQUR?=
 =?iso-8859-1?Q?M0hiigo3p3D+hVipkaAI/StzFZm+x8bbyYLICD5SlYGDA5bNMLuDnbz6uS?=
 =?iso-8859-1?Q?k/uDM3I4WyfhhH4YUZKn9CU4lNZ8G1FtyBUF/lqaVtK6VSqx+V2VlSBUUs?=
 =?iso-8859-1?Q?AenMSWvWm5KQxuZ/eno+9xs39x1xYtrgArb0w+VFOy6+bVwA5JSxsXCbR7?=
 =?iso-8859-1?Q?GANDQ7kRi1qy7bnDySCXxTXMDXsdoHkfIDFc/wSyAiA4VDVbRG0EHPHjXy?=
 =?iso-8859-1?Q?2Ifb6J2pCTPSyRTM9a7tKrSbYA3n2syl6IZ/ne5AvN7qsQRViJYH3m+zg7?=
 =?iso-8859-1?Q?Ri2RVO6xMsahdlINOiO9NRFCjKfaEJOzvdK4Q17Iri73m8bqs0UjhCTxrg?=
 =?iso-8859-1?Q?pRDfC1aCURa1uqs9kem5iDaYu5ySt9RQZSK2prdxM148njCksZCAhisHKw?=
 =?iso-8859-1?Q?Jukf0MJsWTvgEIHpgcwf0wFznra/xuZfNEmc5SwPlQFeNTfJQ+QOC1GdJb?=
 =?iso-8859-1?Q?XoiSI5Sc76PLyFwWJXyiX3QZDy91SfclNceETa/xIFLQB1TUswHU3yTv6W?=
 =?iso-8859-1?Q?XaWHw9R/2EKVi8Q+lKWMoRtN0GpFYGsnP/iLvzBPRHuHImntcgmkn7Kv33?=
 =?iso-8859-1?Q?MCuSDaYEEbuioVKcnWd4OLXsxzZkgWNP1SE1RUCD1+RklvsI2i1NZmK5ES?=
 =?iso-8859-1?Q?dOhdCeXAQ8EBobYTxYSvIgOKfYf2/vGXQXvenzIXq7IRlyWajR1UlETGcz?=
 =?iso-8859-1?Q?z9FYXg695XLzvLpaRhMfpvmfCwEwEwd5tZZU9IHJ9sqDyL6jFDSqCtk3xk?=
 =?iso-8859-1?Q?Ea/Ulnl71N135k2Xq1yTSTuOmFkAiqlLNlgVkov7hRlij7l3NP09yjAa/I?=
 =?iso-8859-1?Q?S3cb8NrbEuSO60rYJbahsbLxhWeZOg2JAGw2L4g4yVTBbwS0cvY7qlOg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41824e4-2e25-47f9-cf7b-08dc819a0953
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 17:49:36.0781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NAts/c48ICppE65oL3AhLdvSHBwXVD4b/caml5xu6uDj5WlUgoCtlXYtd9yA/sARrnwt+O2GvZwA278Fms+x2kizh0PQaRQGmsnM7tO85g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB9970
X-Proofpoint-ORIG-GUID: FKuM9b5En1rrGkDo6Wd6YHpdg1cJrxEy
X-Proofpoint-GUID: FKuM9b5En1rrGkDo6Wd6YHpdg1cJrxEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310135

Extend TEE mediator interface with two functions :

 - tee_get_type_from_dts() returns TEE type based on input string
 - tee_make_dtb_node() creates a DTB entry for the selected
   TEE mediator

Use those new functions to parse "xen,tee" DTS property for dom0less
guests and enable appropriate TEE mediator.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

This is still RFC because I am not happy how I decide if
tee_make_dtb_node() needs to be called.

TEE type is stored in d_cfg, but d_cfg is not passed to
construct_domU()->prepare_dtb_domU(). So right now I am relying on
fact that every TEE mediator initilizes d->arch.tee.

Also I am sorry about previous completely botched version of this
patch. I really messed it up, including absence of [RFC] tag :(

---
 docs/misc/arm/device-tree/booting.txt | 17 +++++++++++++
 xen/arch/arm/dom0less-build.c         | 19 +++++++++++++++
 xen/arch/arm/include/asm/tee/tee.h    | 13 ++++++++++
 xen/arch/arm/tee/ffa.c                |  8 ++++++
 xen/arch/arm/tee/optee.c              | 35 +++++++++++++++++++++++++++
 xen/arch/arm/tee/tee.c                | 21 ++++++++++++++++
 6 files changed, 113 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index bbd955e9c2..711a6080b5 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -231,6 +231,23 @@ with the following properties:
     In the future other possible property values might be added to
     enable only selected interfaces.
=20
+- xen,tee
+
+    A string property that describes what TEE mediator should be enabled
+    for the domain. Possible property values are:
+
+    - "none" (or missing property value)
+    No TEE will be available in the VM.
+
+    - "OP-TEE"
+    VM will have access to the OP-TEE using classic OP-TEE SMC interface.
+
+    - "FF-A"
+    VM will have access to a TEE using generic FF-A interface.
+
+    In the future other TEE mediators may be added, extending possible
+    values for this property.
+
 - xen,domain-p2m-mem-mb
=20
     Optional. A 32-bit integer specifying the amount of megabytes of RAM
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..13fdd44eef 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -15,6 +15,7 @@
 #include <asm/domain_build.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
+#include <asm/tee/tee.h>
=20
 bool __init is_dom0less_mode(void)
 {
@@ -650,6 +651,10 @@ static int __init prepare_dtb_domU(struct domain *d, s=
truct kernel_info *kinfo)
     if ( ret )
         goto err;
=20
+    /* We are making assumption that every mediator sets d->arch.tee */
+    if ( d->arch.tee )
+        tee_make_dtb_node(kinfo->fdt);
+
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
@@ -871,6 +876,7 @@ void __init create_domUs(void)
         unsigned int flags =3D 0U;
         uint32_t val;
         int rc;
+        const char *tee_name;
=20
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
@@ -881,6 +887,19 @@ void __init create_domUs(void)
         if ( dt_find_property(node, "xen,static-mem", NULL) )
             flags |=3D CDF_staticmem;
=20
+        tee_name =3D dt_get_property(node, "xen,tee", NULL);
+        if ( tee_name )
+        {
+            rc =3D tee_get_type_from_dts(tee_name);
+            if ( rc < 0)
+                panic("Can't enable requested TEE for domain: %d\n", rc);
+            d_cfg.arch.tee_type =3D rc;
+        }
+        else
+        {
+            d_cfg.arch.tee_type =3D XEN_DOMCTL_CONFIG_TEE_NONE;
+        }
+
         if ( dt_property_read_bool(node, "direct-map") )
         {
             if ( !(flags & CDF_staticmem) )
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/=
tee/tee.h
index da324467e1..9626667545 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -36,6 +36,9 @@ struct tee_mediator_ops {
     int (*domain_init)(struct domain *d);
     int (*domain_teardown)(struct domain *d);
=20
+    /* Make DTB node that describes TEE. Used when creating a dom0less dom=
ain */
+    int (*make_dtb_node)(void *fdt);
+
     /*
      * Called during domain destruction to relinquish resources used
      * by mediator itself. This function can return -ERESTART to indicate
@@ -65,7 +68,9 @@ bool tee_handle_call(struct cpu_user_regs *regs);
 int tee_domain_init(struct domain *d, uint16_t tee_type);
 int tee_domain_teardown(struct domain *d);
 int tee_relinquish_resources(struct domain *d);
+int tee_make_dtb_node(void *fdt);
 uint16_t tee_get_type(void);
+int tee_get_type_from_dts(const char* prop_value);
=20
 #define REGISTER_TEE_MEDIATOR(_name, _namestr, _type, _ops)         \
 static const struct tee_mediator_desc __tee_desc_##_name __used     \
@@ -105,6 +110,14 @@ static inline uint16_t tee_get_type(void)
     return XEN_DOMCTL_CONFIG_TEE_NONE;
 }
=20
+static inline int tee_get_type_from_dts(const char* prop_value)
+{
+    if ( !strcmp(prop_value, "none") )
+        return XEN_DOMCTL_CONFIG_TEE_NONE;
+
+    return -ENODEV;
+}
+
 #endif  /* CONFIG_TEE */
=20
 #endif /* __ARCH_ARM_TEE_TEE_H__ */
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 0793c1c758..f315d6eef6 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -1752,6 +1752,13 @@ err_free_ffa_rx:
     return false;
 }
=20
+static int ffa_make_dtb_node(void *fdt)
+{
+	/* FF-A is not configured via dtb */
+
+	return 0;
+}
+
 static const struct tee_mediator_ops ffa_ops =3D
 {
     .probe =3D ffa_probe,
@@ -1759,6 +1766,7 @@ static const struct tee_mediator_ops ffa_ops =3D
     .domain_teardown =3D ffa_domain_teardown,
     .relinquish_resources =3D ffa_relinquish_resources,
     .handle_call =3D ffa_handle_call,
+    .make_dtb_node =3D ffa_make_dtb_node,
 };
=20
 REGISTER_TEE_MEDIATOR(ffa, "FF-A", XEN_DOMCTL_CONFIG_TEE_FFA, &ffa_ops);
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 5151bd90ed..5eb5d01813 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -28,6 +28,7 @@
 #include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/guest_access.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
=20
@@ -1722,6 +1723,39 @@ static bool optee_handle_call(struct cpu_user_regs *=
regs)
     }
 }
=20
+static int __init optee_make_dtb_node(void *fdt)
+{
+    int res;
+
+    res =3D fdt_begin_node(fdt, "firmware");
+    if ( res )
+        return res;
+
+    res =3D fdt_begin_node(fdt, "optee");
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "linaro,optee-tz");
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "method", "hvc");
+    if ( res )
+        return res;
+
+    /* end of "optee" */
+    res =3D fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    /* end of "firmware" */
+    res =3D fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    return 0;
+}
+
 static const struct tee_mediator_ops optee_ops =3D
 {
     .probe =3D optee_probe,
@@ -1729,6 +1763,7 @@ static const struct tee_mediator_ops optee_ops =3D
     .domain_teardown =3D optee_domain_teardown,
     .relinquish_resources =3D optee_relinquish_resources,
     .handle_call =3D optee_handle_call,
+    .make_dtb_node =3D optee_make_dtb_node,
 };
=20
 REGISTER_TEE_MEDIATOR(optee, "OP-TEE", XEN_DOMCTL_CONFIG_TEE_OPTEE, &optee=
_ops);
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index ddd17506a9..6388166e17 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -68,6 +68,14 @@ int tee_relinquish_resources(struct domain *d)
     return cur_mediator->ops->relinquish_resources(d);
 }
=20
+int tee_make_dtb_node(void *fdt)
+{
+    if ( !cur_mediator )
+        return -ENODEV;
+
+    return cur_mediator->ops->make_dtb_node(fdt);
+}
+
 uint16_t tee_get_type(void)
 {
     if ( !cur_mediator )
@@ -76,6 +84,19 @@ uint16_t tee_get_type(void)
     return cur_mediator->tee_type;
 }
=20
+int tee_get_type_from_dts(const char* prop_value)
+{
+    if ( !strcmp(prop_value, "none") )
+        return XEN_DOMCTL_CONFIG_TEE_NONE;
+
+    if ( !cur_mediator )
+        return -ENODEV;
+
+    if ( !strcmp(prop_value, cur_mediator->name) )
+        return cur_mediator->tee_type;
+
+    return -ENODEV;
+}
=20
 static int __init tee_init(void)
 {
--=20
2.45.1

