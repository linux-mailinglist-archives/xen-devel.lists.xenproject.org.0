Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C312473F90
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246486.425105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Co-0007lC-GG; Tue, 14 Dec 2021 09:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246486.425105; Tue, 14 Dec 2021 09:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Co-0007gx-B8; Tue, 14 Dec 2021 09:34:42 +0000
Received: by outflank-mailman (input) for mailman id 246486;
 Tue, 14 Dec 2021 09:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXUZ=Q7=epam.com=prvs=298265c1fe=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mx4Cm-0007DW-12
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:34:40 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dcb6d22-5cc1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 10:34:38 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE8mV6p004153;
 Tue, 14 Dec 2021 09:34:28 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxr338745-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:34:28 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6974.eurprd03.prod.outlook.com (2603:10a6:102:e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 09:34:23 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:34:23 +0000
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
X-Inumbo-ID: 0dcb6d22-5cc1-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enrWauorJnK5uwQhrawQwKjBFNAwCBs6TxAishYgWeaMlnWEBK5B88W6GIVukomqyWhA6PGuhEpQ9xRf+25k5UUTfZYGCBTaXIgWyIY+3r6q5smLixy1ngc0uUyXpAeWelNZTEuH0wfG14UAY0rGGckA/SiewfEac5dAt+tFklHb3Hq8MaymFMPZl4Yy67dHFeOEIFxUfW95BB+Ly9WDj00hYHzpDOg0CtBJni8AYWQZFUL18XxuZ0lCzNA323+o0x3Tspd75TU+btS5gOpF/LZkG5TbmsxaHYQZzlMusc9Su/8j2XNAwTlj0oBGEPRoDVrjfRgERjcbXRFmtBuAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcQmMVoAC0qvNEyr6vX6HHS2XVbpv968VA/fx82VqSA=;
 b=A+GM2DkHlK4tC1QvsieeSwkile4+UiRqcuyqssKAbgiyPYFwPl/xU80pPbWRHSSir3RjcIxql9uYlGcPNzcL8GfF7oCLAT3cA01k7vO5eHbQMlAf1yyjhqaXaJ109sz2tHGVoWAtqphWaM1Xcwnsw9wlnXbb9hhFOTKWm8CMnZluqJcPZWHNGZX3xjqObUqTFVF5miB9+9GlxV8mbvtSNJYiTjJIZDMwnwMJAXdyBMpDg7sIALxipC1rfy2CLLdx0nnSMEua4TgoWA1fZpQ6apc2IiaLRWFkicVHLNpFjzPiGP38V1QCGNU9Grkl3eP/6SDza+g+EQ15cUqd2yXufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcQmMVoAC0qvNEyr6vX6HHS2XVbpv968VA/fx82VqSA=;
 b=SXF9/50mobbK90OgrrmPFBK7zR2GeLLKcdbyfk62yxkgiF55c39Lf1myt+6X9j9IewHBcUtt34GDA3DOqjak9jihlRPLFzZFmSfmCC9rkh9DvMq0Zn1s5cN0ki+Mc4HMX2d2nJ3OEX5Z3H0HwVbppD44OJcTqlI0MQRzKhhfk/bS6hqNrJTun6kVcDA3+XiTQBRktv7jdpaqzIKXUXBJBIy1SNM8drqmeqCHMNGpgM1DtLl9BhtB7sQnY3wctEbekozG6bK35UB9d/mNYW4eTs8syEZ5k5BLQIQAiNdPYzKhxAEcBntkpLLO9uazb557KQRWhhBdSUFDijcWMAuyFQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3 platform
Thread-Topic: [RFC v1 1/5] xen/arm: add support for Renesas R-Car Gen3
 platform
Thread-Index: AQHX8M3HLq8qFfw2eU2jxqbriRiMpQ==
Date: Tue, 14 Dec 2021 09:34:23 +0000
Message-ID: 
 <7ac8512b5479cf192b4aa399fa2501d0bccaaf48.1639472078.git.oleksii_moisieiev@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1639472078.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fc9096e-b8d8-4d87-db44-08d9bee4e9c1
x-ms-traffictypediagnostic: PA4PR03MB6974:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB6974C1E1F4F96FD673724441E3759@PA4PR03MB6974.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zJ6DATxATVzBRUU688EmLQpPBx4j3peZbO3HZcXd1u8PhHywKb1h4zcM+OdF64lEwHsZQ3mCZ+dQHUXV3/CMKf1OJtLatyRBefAurWv3uLxP2gVyY6ofqbPCfZ7UfvDDZld2rs8vfUPkSQBXSbXok3hPHxjY5NRu5seC5EeiZHW3Q1GpPsK9Qacb4w3iGcGBRSqbTu5PA+VtWR2IRXv/XAQAIS79j5TRPjaB2WKdRUnt00XHDLvVOBUFMyPCcz2elZEQ6ITDooV9PVXFxP6YbjtGyMUsMT2ZN1HRoGFSxgSdnFRxyU5cntH14GhERfCpUHzWXaNt6cAxL9sj19+DqAUDuEmdaD7qXlhx9IyxDK5ZGE/4Rdv1Kl8GuivpsxzFsKMFAJt+xLtkjo5LSEp4mZhd8F9zolqg1TtyF+B7/+zWaAXcvh9i43uRPsaEdjSG561a9gKxIxhDdGwYeIy/c03GvBefbF8A55F2L2yBAosDdSzs/O/eYhub6vPyI7CmOVSHUopAVMPP5ULZIbej3UHbfvmIaP1m7d1MK0Z2e6fbDMuNFLdoucqx0hTk9rONd7fs/nw8C93YZOBhPB6jvbOvD8vo0zMsu+hpS754YBmysUjIUkIZz/40TFSP2U3vSN8ong8g8vjbqEfN78iPGj7UVPsFvqsp7QXO3uMmEl4NIiPxJl3gAOVm9QT3nD1Th9orssyAuir4pUZ1jO+KpN1djglmN8/+xZmRiduL3FA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(66556008)(36756003)(66476007)(316002)(38070700005)(64756008)(54906003)(122000001)(38100700002)(2906002)(91956017)(5660300002)(26005)(6512007)(186003)(4326008)(2616005)(71200400001)(8676002)(66946007)(6486002)(6506007)(86362001)(76116006)(6916009)(508600001)(66446008)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?sWxL27xWjsqJnZALrm+e6UpCnlJ0thLJAe11Qvz3mBjR96mFq4MjB6icJb?=
 =?iso-8859-1?Q?buHxkbH2f5v1+5zdDnEYSDs6Qjg+1znJ6UyYoTXSEw6XDxuMwyXJlPDAGC?=
 =?iso-8859-1?Q?4LM29A01vjed92eQXYwloyQkw2RTtzDuzKnVpffcnscQtRrziruMZPM05L?=
 =?iso-8859-1?Q?B9PMDiE0hdh40JkuRTbvLdJ3ckiD0KT7FR0Slb2r6D9x6S5o08krEDDAsX?=
 =?iso-8859-1?Q?KwVR5XLbTtwlCZVaO0OjJ8iblkJX0xyyoSwQKElzyQdfR3RfXvPQkGlKwW?=
 =?iso-8859-1?Q?2YJtNCXOWwxXbOxDVVXsVIY6y/J4OoeNDL3PAmHsiw18Du0pfG5pcyOPMW?=
 =?iso-8859-1?Q?QZ2n12VrBlsj/JaoOizN4kUwRIAFA+ASZaoemZEc/C+fwxSMChAqfPZwAd?=
 =?iso-8859-1?Q?EWcAfOfPbeCxVs4s0Ib38Q3qqghKxkAIdJwnrC8sWl9IdszeWb3DAxGlok?=
 =?iso-8859-1?Q?lRG2FNz/oCNiB9BmwKkfKXymeZFgZAFHcBELymS7bxA/i2WTYlQsX+8tWE?=
 =?iso-8859-1?Q?kLL8xJgYow+aMKqd8NU9+yBd06Dau1l3i7Sn+KdN1xsLQwhAho6OWNUkPa?=
 =?iso-8859-1?Q?C+snbz7S2/TVMnMY4BW3BqkWEzJaPvRw9c9KVAOisWqiWVFyAbNOm1BXdg?=
 =?iso-8859-1?Q?hqQ0gkz0Z6qjCJaNnSwA6wrYtFwDOLc/g8mkaCCw4vskRqfLnNUpG5uefO?=
 =?iso-8859-1?Q?X2AjPVtTyC7Kgo9VfSenlseEAhn+xhRLfS0oqrJFFZ1tyzwmR56H/8o4Xw?=
 =?iso-8859-1?Q?djq+4lJmyJQ/9l0UyFoFc/fLZBy6T+Y+jc4dt0U6aL7Uch11zs/uKkWn0D?=
 =?iso-8859-1?Q?cRG5psDyaA7WTc1S0EormlhSFkw1R+vQTiwJNmVoW52JaW2544VomDJiN9?=
 =?iso-8859-1?Q?fB0fV3AwwasbiiXkIzyimHyalGddYSiGIcPJEi5+ViQXHkIoh91Fsvqe5c?=
 =?iso-8859-1?Q?QU/8+BVgtK2FRkES8tL/NKXxv+FLEQKVT4+avlYKXFkN+JAbHnGkmTMYbb?=
 =?iso-8859-1?Q?EgA0f/cEra+i1GH9G5zDu2u/NBZXxM20qvJ5TwkC8T5RSQ8Bcq4GdFcD4W?=
 =?iso-8859-1?Q?FsCR6QmnybyFZo2hwbJOTMpGRDRc8tkosYsPiagFbcGWnZHVYV8/sIW8hH?=
 =?iso-8859-1?Q?EFsvm/TYRCuW3H5aDbbBJ2H1nHr4HmcCBK5ARUD2Ogh3LvBEfpX5+GsfZf?=
 =?iso-8859-1?Q?hQINgdbZrSzk68yH6OdJVLjFZsbOuWvoRp+6q37WwwPsX9ee3GuZS+bJ2U?=
 =?iso-8859-1?Q?+ix7m2bKjpkyVAiQsHjonL+Cv/YYG+J7bbKY2wqH+V5wwmPBabqh2WqyNx?=
 =?iso-8859-1?Q?rpcvqQgdW7vWvK6Qs6EhP3d7yQ6Z03jkSaID1rUYU1yDaNiof2SakqqgO2?=
 =?iso-8859-1?Q?IMg5yD+M4khqSTWdOOSxp+ELnJkB18zYele2W3AqUvqjnJSWMNuc6QaEIX?=
 =?iso-8859-1?Q?2pWWAK8kx8b4+rcSqHKmba9b8TObFNiUjXIRDGAr4BcXTegNqr8UkaIxfJ?=
 =?iso-8859-1?Q?9WaaueHHaasa9TklNQNbFTk2Ka0O5Eu8rwqmr+Omj5+bMMN35zDLsosO0b?=
 =?iso-8859-1?Q?ik7oHAbRDDMiwEAnKm0XSqkHI20ytaVMrAXyO4GnzHkZvC6cVR6JFvctpr?=
 =?iso-8859-1?Q?Flm85RFwqmjdoTUSp9BCA8xuRlmkQtnUTLE7IIx1W6y516HSmAP6bU4ppy?=
 =?iso-8859-1?Q?k6KVW9/cckVouW4Q9N17FnI0DBy7JvNluOvCSpqr1cDdqVWWoEk9BTiVSU?=
 =?iso-8859-1?Q?BHbdzOOerBmRE1GyCUwa4RwOw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc9096e-b8d8-4d87-db44-08d9bee4e9c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:34:23.2315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YshgjBnYaHk/DTSfe6ga5fXofPo0uF1HfaHx1e3gNBtZcHiWRbsLbfp6zvv5pTe7lhxjWPk8QQt3ZJ3cXzgi5e2vtwc7IyTQ8GSbkSLc/mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6974
X-Proofpoint-ORIG-GUID: ONwttEhYqV61lRlxgB1qmhuOWAZqu6it
X-Proofpoint-GUID: ONwttEhYqV61lRlxgB1qmhuOWAZqu6it
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_05,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=945 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140054

Implementation includes platform-specific smc handler for rcar3 platform.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 xen/arch/arm/platforms/Makefile |  1 +
 xen/arch/arm/platforms/rcar3.c  | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 xen/arch/arm/platforms/rcar3.c

diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makef=
ile
index 8632f4115f..b64c25de6c 100644
--- a/xen/arch/arm/platforms/Makefile
+++ b/xen/arch/arm/platforms/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_ALL32_PLAT) +=3D exynos5.o
 obj-$(CONFIG_ALL32_PLAT) +=3D midway.o
 obj-$(CONFIG_ALL32_PLAT) +=3D omap5.o
 obj-$(CONFIG_ALL32_PLAT) +=3D rcar2.o
+obj-$(CONFIG_RCAR3) +=3D rcar3.o
 obj-$(CONFIG_ALL64_PLAT) +=3D seattle.o
 obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
 obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
diff --git a/xen/arch/arm/platforms/rcar3.c b/xen/arch/arm/platforms/rcar3.=
c
new file mode 100644
index 0000000000..d740145c71
--- /dev/null
+++ b/xen/arch/arm/platforms/rcar3.c
@@ -0,0 +1,46 @@
+/*
+ * xen/arch/arm/platforms/rcar3.c
+ *
+ * Renesas R-Car Gen3 specific settings
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (C) 2021 EPAM Systems
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <asm/platform.h>
+
+static bool rcar3_smc(struct cpu_user_regs *regs)
+{
+    return false;
+}
+
+static const char *const rcar3_dt_compat[] __initconst =3D
+{
+    "renesas,r8a7795",
+    "renesas,r8a7796",
+    NULL
+};
+
+PLATFORM_START(rcar3, "Renesas R-Car Gen3")
+    .compatible =3D rcar3_dt_compat,
+    .smc =3D rcar3_smc
+PLATFORM_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.27.0

