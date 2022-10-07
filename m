Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8415F76EB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417682.662401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf8-0005Cx-9K; Fri, 07 Oct 2022 10:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417682.662401; Fri, 07 Oct 2022 10:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf7-00058M-ST; Fri, 07 Oct 2022 10:33:01 +0000
Received: by outflank-mailman (input) for mailman id 417682;
 Fri, 07 Oct 2022 10:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf5-0004P4-H4
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:32:59 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6812d72b-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:32:57 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978P174005817;
 Fri, 7 Oct 2022 10:32:54 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjk3-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:53 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS8PR03MB7159.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 10:32:48 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:48 +0000
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
X-Inumbo-ID: 6812d72b-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOU5Aq74f7Et7kpU/iC+iUbECEoxq1J0mKXp8GRh6pLSp7b1+V9CBPx4JOEOE2iAyuOVenUN97eE2XUb3egMbdSgJhZTZ39xN9pyhzLJ64hFn7K42JN5aQSgvMIC2/PAcvx1OY+IGlehAghxr3VFRxsUEm9usk4Szih+zFjMrMI5ZLpitK/WLV47wCMMQAeqoOr27hxEsphqgiB9FBEE+IdZzL3CuessBDevMA9LHuIV72A/QF6q6MApxdCQZnU4pZXr7iZZAmabFpnFu79Z2Z0ccHImXjOScXfzzLyD1mj8ZQp+EIGP/PLqcucGu8SuMO/JN1zIOcNAD8A6ty5AXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P67wZi9wRvsTNIiKgd4NqFNYGAuUHcR/ii4CMj9fkQk=;
 b=Q5Fo1lUabUqeX6lcHX5+UnsbgaW83W/DHpvNoQxvzUqClJ8j4OSVOokuXf/QkVbcmn1510feey6EVjd7fdm07rWNyQVTsjLQ3GqTvk98jWcKFJDSfvYqN7j8OQJ5G5dexHXaIoZyv/wmv34s2c4gGEkoNSOUmbFiq2qJhygm6/zDeadQ1q7S+IpJYoGyIFurWDiw/wScrX7VKnVIr2Dv74qKKZXJ/CkvaA2B5+ZbUfUqaRcXw/RnA3kpPqvZEd1YGzW68taKziM/fT8rSpHTOU0ttPl4GIfuLxHnRNtMvCakW5+DumYRbx4OJGv5ky9+PDUU41knqy4QLClqTTIRuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P67wZi9wRvsTNIiKgd4NqFNYGAuUHcR/ii4CMj9fkQk=;
 b=lLqN+gs2XLVIMAqnZw5fDXVtLt4f3pLDiNdCoG53nIadtF49Yq4OH1sNHqDNFUnwTVBM2R+YWWpmH/poI7aOhd8kQ6uXRVvc8Ek/DILnugZuKSMI4iTeu5SdrLibwmVsTkjfyJKn37MEMmAnQV5+jrCwWSsI4AImoSrjAJduXkhzm/PnnASoYB6B2d+6Cbps74SxIgs8tjLnOkU0Bma8gMpxKR4dqvLirpah97HQNmQ56G+HFR3sJEzDn2RHPOKILXRvKN8RzNVaETmzrPSkFNrW+/hbJv8nr4lK8wPHbEKINKWlfLQYLT/d2PVpypfPMAbuGoMIU+qJce8TLPFuYA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 07/19] xen/arm: Disable/enable non-boot physical CPUs on
 suspend/resume
Thread-Topic: [PATCH 07/19] xen/arm: Disable/enable non-boot physical CPUs on
 suspend/resume
Thread-Index: AQHY2jglFRIa/47fQkyi/IjVCOcpsw==
Date: Fri, 7 Oct 2022 10:32:48 +0000
Message-ID: 
 <74bf02f1c6c5280f2d79b9cd60515895e8ba3319.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: dc1d985a-8b31-47c0-deae-08daa84f47ac
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HLDbf3Sz9TBZJU3alLbtm3k8z+gy0Ix/JNcEAmzvHU/fbAASF+fz7Bzw4Bs0sI77K2wi9Aws0Rk0RDsa9wTtcJCP0nwUOBZdbyRHe0R72C1Nceee7S4EHuyRgXG0s/w3ci2UmNc9NyZSzY6mPWKT3GKFWV8cQp3OFHA52uptZIIG0vxwY6JgyTGxcoa25EyWkJM7zJtHemNXYo3MYG0+lXEeHxln8gEEHuSetIdx1lEJrCJuKDxkYUPMS3dLDdwviRNQZEqPxH5Xsme01IAqGZfhYhT+SDuqYXlBNXfUcyLdiCRrnAVeSxi6RP6mT1Ms09KWse0pPYC9k6MD/XalP/Y1IwhlE76PUtuKlQIE2qzxRJSAC8qbPG0Ig1CdkjbKI1genh5/iKmOHURjEo3SRTVQ8jhjYrjPrjalqxPayUyLzEEUSzBwpS4D7zWixe+ia34uDbcSpeynopC2f2WxLd/fpIEZuLScpT6HrmeTlLNQZCIJVJkJCMGPtOOm5y/haFAeBBSZgPyQvVUg1jGsrnBor2NY5f/PAoa0xEKeQdp+1jIonZSchu2Gn/l/Hmteea8x9iUi40KU6AQzkq/bnAtPLdOfWxnxyKvhOvW5ur6LUHpV/FbpD9nrBckx1LcVlD3szL2mgLCaMSEonAvRfvyMi/AYeQumcs+cGLuty78SnPYFxtTEgEMG+rHJCXZ+F1/JlcyQNam0ytDa0zTI7/0DH2JW3VB3IO2H0+etCLD6L4qxU8V/ndneK7A3+FlCOoRP8phgjBBPnKVw7EOdAw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(86362001)(15650500001)(5660300002)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(38070700005)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ekAGhs7Tw09gAl7jXa2f0W5XssVNYbexeFfiP3BgOYim37KCE8HK2dSeU2?=
 =?iso-8859-1?Q?CQ8R2LVJqVjIxICOk8tUyxGucCKLNhi6bzLUgoghjieRNdvLI9fZtRT+Pn?=
 =?iso-8859-1?Q?6dUA/BebEH4/iPWACf8ED7e8Akce20RVcFYboUEwAUDdj0PA07QWaDMMCT?=
 =?iso-8859-1?Q?ZQj4IwLVN9Rr+paclZTBNWmzFGF6SL3XfoQj52bhyTufwHtlbO/K0T+j9t?=
 =?iso-8859-1?Q?ADQF5yV9x+O8TqV5H+LOl95O2NJG7+OUky0w1ciZHWdlb4MseOwd+010go?=
 =?iso-8859-1?Q?ZEfw639kLtoZB5TLEWoztoQ/4vnG3d99adGRKBu6VQav798QU7uS5ZETRx?=
 =?iso-8859-1?Q?+V5klR5EyHhql8ibFxUb8riddMT5lqXFIAaXA7BRxhtakrUOHItA8wIMUy?=
 =?iso-8859-1?Q?AESGECBiEk8czgMLUOusnbsTL0LCiBqAjAnFpd8i1TrJr8SkWhvYjXrPDp?=
 =?iso-8859-1?Q?gRqZRvidD9xuJidmQRbXOG9tIs3Ln9B8Ik5BQlV0/eVQkUuCX6egcnJCiU?=
 =?iso-8859-1?Q?B1ShI22IeIP/uFlz08MkBJIDaV3sy/o+lC1mlDedNdYWlp6co69oUvEerP?=
 =?iso-8859-1?Q?tBnwUXClg/0O7yemw6fQQ5Z0Bw6S6sfnxoUE8K3kT4rsFR51pke21z+tY3?=
 =?iso-8859-1?Q?QFZRN8RxMe5Sdvp8cmxbjX6yc83ypgY7374xn3LkeGzxf+sYDgfiMbaSMA?=
 =?iso-8859-1?Q?2TH0/iUkazEcaGrlXt9TlHLfGRtfHz/y8KUx/ottt14rUSTeTSx3AYnQch?=
 =?iso-8859-1?Q?Fy7K357QDp2k2gb7dXZNdad9WIUcaFQm0l4TuTtCrEkHzVU+jYdEWtbqdQ?=
 =?iso-8859-1?Q?ltbMcs0sPzyLUrXoGZXJ+/EoeJl4pZlqdQ+nlsjQqXfdDPaoBwAvzJML11?=
 =?iso-8859-1?Q?iuHyYV52isOaEUPlQSUQLAnHNAnz8BhXdVctJV8R8xGXACObrb2g4reV4R?=
 =?iso-8859-1?Q?mpgG29Hh7MS9PDtnWi0KoD/xp0W0XLMlm4D1wcrR53pPHnWiJduy08Am5B?=
 =?iso-8859-1?Q?YBmatHKLQrzbTuzg/ChAP7BtuLejEv6iPafKiy1zONhbct6XMPtU7Rzd3N?=
 =?iso-8859-1?Q?yw8oi8n03Hc5OT3Um6BxqIeNLtdX8I4ZJ8j37gbvaTH/doWIDBVvarbxub?=
 =?iso-8859-1?Q?cd5OxO51oytLSjJbD2gxFpRjtSYsIG2RI/GzR/17nFityu3EZM89whn2bK?=
 =?iso-8859-1?Q?xPmvGBwpYUHCFb0uTNjJHt3vibmhaL6IIHm3mKA7HjKodFNCj5l9VfZ5lH?=
 =?iso-8859-1?Q?JPl0N4po22wEyxtD0h9HUv2dpf2eCkE37e+jM8yW9dejduIPvQlI17cpxJ?=
 =?iso-8859-1?Q?z918oOfABiXrxPOLb2la1jg9PGHMxbiNje2Y3LA7UJ+n62TQwPivTmht6X?=
 =?iso-8859-1?Q?fb9G0Q/B8vx++inxMKxHba/k7rW/X84aILF/Bttdec1TWFQFDCJ/vfcKrQ?=
 =?iso-8859-1?Q?plA7Qu/moS0AXdbt7/nomo+4JEyVBDuUCwlCTIi6HqkbIz9A+GKaCFbdGS?=
 =?iso-8859-1?Q?P8eQLlTDnY+fCQuh4VPSNsdcBYGc8npaJl71Pl+UTq576cgS9x3780jTnP?=
 =?iso-8859-1?Q?o5vkEQn81uHpuvi9FvepmLEDubBPsdQo7WcvconwTk1PjbS/DBzcunnWkd?=
 =?iso-8859-1?Q?tXP+W/OpSz1fqJrwREZib6VGYP18rePzkiUz6dYYOsGqKqJr+MdCyjmg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1d985a-8b31-47c0-deae-08daa84f47ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:48.3490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2bUT5wOJC/iQGxH5dBNbrTFzw45901mogBX1DGXOeGA2gSXY94G1MoIJ6W8zMv1L7mCvR6sheboqEhIUMN1QRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-GUID: yyx5z2NBX53xCa659FGs13DAOFgEbfZS
X-Proofpoint-ORIG-GUID: yyx5z2NBX53xCa659FGs13DAOFgEbfZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=772 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Non-boot CPUs have to be disabled on suspend and enabled on resume
(hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
CPU_OFF to be called by each non-boot CPU. Depending on the underlying
platform capabilities, this may lead to the physical powering down of
CPUs. Tested on Xilinx Zynq Ultrascale+ MPSoC (including power down of
each non-boot CPU).

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/suspend.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 2b94816b63..0784979e4f 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -13,6 +13,7 @@
  */
=20
 #include <xen/sched.h>
+#include <xen/cpu.h>
 #include <asm/cpufeature.h>
 #include <asm/event.h>
 #include <asm/psci.h>
@@ -135,17 +136,29 @@ void vcpu_resume(struct vcpu *v)
 /* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
 static long system_suspend(void *data)
 {
+    int status;
+
     BUG_ON(system_state !=3D SYS_STATE_active);
=20
     system_state =3D SYS_STATE_suspend;
     freeze_domains();
=20
+    status =3D disable_nonboot_cpus();
+    if ( status )
+    {
+        system_state =3D SYS_STATE_resume;
+        goto resume_nonboot_cpus;
+    }
+
     system_state =3D SYS_STATE_resume;
=20
+resume_nonboot_cpus:
+    enable_nonboot_cpus();
     thaw_domains();
     system_state =3D SYS_STATE_active;
+    dsb(sy);
=20
-    return -ENOSYS;
+    return status;
 }
=20
 int32_t domain_suspend(register_t epoint, register_t cid)
--=20
2.37.1

