Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260AA7E7C87
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 14:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630406.983273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RVI-0007Me-PU; Fri, 10 Nov 2023 13:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630406.983273; Fri, 10 Nov 2023 13:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RVI-0007KQ-M7; Fri, 10 Nov 2023 13:24:56 +0000
Received: by outflank-mailman (input) for mailman id 630406;
 Fri, 10 Nov 2023 13:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R46-0001y1-DN
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 986c3da6-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:43 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuve025691; Fri, 10 Nov 2023 12:56:29 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:28 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:22 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:22 +0000
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
X-Inumbo-ID: 986c3da6-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwakm3dedQbbCRT58GmfcLpH849mY1mzaFkP6KfSaPEncNut7zMW2V4ZuksjWtd69Hd9VFdjHrDiwpZXfkP6ZYZRtRXEcerG+ZD+W095V4d3mOBHot1GV1AvlCYZWusSFy5HtB0J7xMABzKTiDU3H4c5WcDsml6LlydmFPkP7di3xIwe1feX2W8Lcgbd3cM3B5NGvjEzeyHbmo+eEkuwW36W3luVOa8y46qJyUQHuvQIV/0V/Vcv+s+VH6q5VfBhXQ42n08sVTcM5PVHNY7Gs5velv4IXgt7oAJ5U8gflDhxasnHuccvDzs9ueGELgB2aL1Eq8t4EL8NZpkK8T+4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUBkCvuEESmq7r0a6CekkNPCW4U9CXDKahAfynlOBYo=;
 b=P8lr++2ljXrtIhLYjHVPczJDl8fp8t7Jn1EJMo1IsVi/UFvKIIQPMuWJj9JUK3QEFmYiuoscNZm4p1usKio0wUmGe4DfubKYAX6INDRSPp/ArPqLbZa3mf+/zFTlomDu81YwlK2dptSL6mk4uTRV+FX9cVtP7IdJ9g7jlRpREPiMJHYpvAHaN2MlyLuawu8BLNXGUy0bFzL4vup8u9iCRn9yLbT2NHJFFg1XV5Fe/GzVBil9YW9dv61NGxOnQI6hzRc4oY6/fYFAU8BQY5LvmTnvrhgApY9WBJi5lzJRHZDuaJ5/xVWPm4JiA3ZgHeih7zL+0JZYpA0ajpqsF5B2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUBkCvuEESmq7r0a6CekkNPCW4U9CXDKahAfynlOBYo=;
 b=lfyTzCkdnjSW77PoVz/xG0Bq6GgGTeyZj0GDK/HD0nq8NLlKY0GihMQVaUWh9GeVlEbVk26R65ll2lmp9SngoNQsDKLPvaKCb9x9LD8SNBjBFLfcX8d/LCrK/f5PS4VAPF+Ly9OcDzh/HrgKjclsusH+blUrQGfJNNemn/Mii/gFBFrqnUKmlKO/3CkvmswWWAxqEhRHsDK+CTiK4TeeAgJEXQCEasOIwhaB6NZr7SnN0Z8Qad3u0vmpt7tPgEejyY84p4H08VisQQOohJrt+UfrFVOH/C3cSONYRk59jlysqDIHqaAClqqPjzVy8O3/zOPT8uXeALii4YHMmMYcxw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 13/25] arm: new VGIC: Handle ITS related GICv3
 redistributor registers
Thread-Topic: [XEN PATCH v2 13/25] arm: new VGIC: Handle ITS related GICv3
 redistributor registers
Thread-Index: AQHaE9VNjC2fHo/UK0SkGOgI1kkZBQ==
Date: Fri, 10 Nov 2023 12:56:20 +0000
Message-ID: 
 <c20cd7affcf945d7ddc5eed5e5b0e27d0a39cfd7.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 03841872-a201-4450-46d1-08dbe1ec70b0
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qcaDAYFB8UI3Ktom6uopoFJFe/m/mVmWUh+T8TSZwwlBU4AkWT3URnA6+5Xehfl6TTbNpn2J3DFbWHGh6iTb9QLi3OLWxH62musjLP8TW0+kzBlsEs6/kzd6637LUCb/PN3cns2oAMKxe9Id/OMrxsTk2J0ZLFPRLciAgbX+uIaTzJbesipYD0UPHfhPkO+gn1MS8P0GhjUrnNNnIsLi3EMMDo0j/dkrSDyPsu6tkWacqwDLRguUvJRZQ1qHGS4innEeG2vjPbG9YXRZRKuLNE3iorHsPGg5ePUIoHV0ZPS5aIFTt+wjsJY7cntQ6buT4ADo1cRO4cN/+ZGFT0h0e2zWh+Rx7dm4uZdG5k/pEDbPDyhLcZFi1LGcWVcyRj/Xhi5wG87xSf4ln0fWnTC652m4zfbLPO0m4sjVgBpMg3odM0saQDb32UedEO+65XMYRooqsT/HmV2rFo9lAL51GpG49HU9rsNY0eYOk07Ws1qkpYk6V5q66ELgl2Sze1qiZdzV4Bedo1ILBREgjiRgbckdmvdveZTTGb+euud/lT9AH4iHJzr0GnIKWzOrTVwKz9zX3n46CuTVi5pVOiVIwJUlc6TEppUpL4CHPH8LXTLLqWHB4rsODmGkE4UkaN/l
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oREEzXYYGUt5YHyB9VbE1csmxdK6SDAZmdnPed+Fq9okNhBM5Tz6uUUBCn?=
 =?iso-8859-1?Q?HS7X0Cs3DQiWir+9i76WNO65CSGuFXd2RlFld8XBtilc3CHo031qgEaav4?=
 =?iso-8859-1?Q?JMe/VBnf5psk22g1NCgVMSx8lQoxVXJ/0qmNqLPpumOAU/9a1faMkxgbHl?=
 =?iso-8859-1?Q?2Sp1IeagtWtAyePbd4qhAIKvcquik7lMVptaeqcIS+pij7I2g5KBilybro?=
 =?iso-8859-1?Q?hPnWbGYnyN28v45AHoQrf9yqOgR+sRtIHqaYS0DSUPInYwTpj19oXqO5hu?=
 =?iso-8859-1?Q?ZCm7T0dLrceuOWVJPhWXd2opc+ksZornxpTEsMt+pu0OM+tW6k4DWlvIUv?=
 =?iso-8859-1?Q?egTbtKmC53Hbgnc7bkgcWEPS8V3D5HFoVIZxxXn/zvrBJqAe5JNwaHHDDd?=
 =?iso-8859-1?Q?5cMEFYeSZkqMwfXHjopcswFW7aPhP3GfSXbc5EgcTrua0gUCBX0tPpQPFS?=
 =?iso-8859-1?Q?5Jw3Rjh5Ymai5IVi9a/Z1GkiT6rdrLiYLrEJgg2ZVRw/Bm+TzPo/ZOUWBE?=
 =?iso-8859-1?Q?NzSrkDCjOAgrD43HNz8/gJdxg7FshPJJHXQVZKAZVT0fOMUYvO3HvgenKL?=
 =?iso-8859-1?Q?NBsB14emNe8h9ybjztuZUdsKzlHAcwUD5JWKO51QdiUpPEptjCGFH5jCLw?=
 =?iso-8859-1?Q?4dhKNnaTAxt6rwFX0fi+3vNWr1amB16NrvPv49sGap9n31s1SbnTvHp7N0?=
 =?iso-8859-1?Q?kF9AyL9GCtg74eMFxUowQYXiRvIC6wbLSEOt/VAcymdJRAKRW5zrdKg6TF?=
 =?iso-8859-1?Q?T+e12+Yeui4q2n/o9bkuhu4Hs8mJXT/ZzJG6+BrUMJ5HPooe1v2z6Q7+Rk?=
 =?iso-8859-1?Q?jEpZlCSO9dpQ8MfAXLvP1uI+cVwVlJ5oOTYqJZDSupI6XUQr+II5Q+JVfR?=
 =?iso-8859-1?Q?XU7QLTASeO0bSSjQq+XQQmqX1208AFFmGtK1hHmT20007+i1YJIAeOCdRN?=
 =?iso-8859-1?Q?iRCkayUADnlqreLNNNeGhYnf0k3m4kaf2kpo7YwGMO8kR+cZGOCK8H3D4l?=
 =?iso-8859-1?Q?Yljqx7eS6S2nmsRGuD/4/Oqt9bcNbAnmAm1txnNIOD/Jvr8xKtx5u4eBCN?=
 =?iso-8859-1?Q?qBdU/LbZufH9YqpC1TsHXOONTyQyg781UZg7m9ueCO7qYqpkHzozpiCN4J?=
 =?iso-8859-1?Q?AJZgVaTC4O/hHEBVS2RXJMQkpCmXBlQCvz8kjgfgXMkngWkHwCEdmSDTq3?=
 =?iso-8859-1?Q?Fku24Q+gHdz14/0NP9PswsL2Rm9nZwXYuQ4AYqoDq7z2h6kZkntnosYwOW?=
 =?iso-8859-1?Q?8hZwBkxpEyiQv1VX6xZi/ewpgiBVIoXk5gPl7+95VR+19FUKF1cxge7+5C?=
 =?iso-8859-1?Q?b8SkRNpWRnSgOo7yhVbUyw9TGv6r8LOX+vYbcQGnoBpL7p1tDSwlNIfPlQ?=
 =?iso-8859-1?Q?It07wXxh0AezS0+e8TFLRj81lK9HAzgkkkL/cZx0ZWZ5Vs3fnH2tTIfXiK?=
 =?iso-8859-1?Q?T1yMikKjMKECQhIOAqWV1g2RlHJJPbH9DcJpMjr5u9toHfA2Nr5VuuODSk?=
 =?iso-8859-1?Q?CyGjfvznO5IQxMrP1EWtX43dpqTh6kdvGxzZgfssXyJLWjwnbjzgCMmdSV?=
 =?iso-8859-1?Q?I3gU2k87uuK4mg3IhGtuBsx/vvpGPa1Ljo8AaceCjn0CmgBsFNASumv68L?=
 =?iso-8859-1?Q?0D57Fra45PWNnhp9NhZqMGy+wQvzIORPM8k/Gl1NgdIyStbAKeWnMM9A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03841872-a201-4450-46d1-08dbe1ec70b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:20.4111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8K61EN5L2yJmXfYhEy9fx1Y/YGInlxfYqdoSTF5mJmrs1pKtSMZROYe0K8Y/TlXVgWSGwaTe8GKeOnSCzPdaMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: 3DubnSCnFA0Wo9rZ81mLHfH_4Ogv9pIm
X-Proofpoint-GUID: 3DubnSCnFA0Wo9rZ81mLHfH_4Ogv9pIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=805
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

In the GICv3 redistributor there are the PENDBASER and PROPBASER
registers which we did not emulate so far, as they only make sense
when having an ITS. In preparation for that emulate those MMIO
accesses by storing the 64-bit data written into it into a variable
which we later read in the ITS emulation.
We also sanitise the registers, making sure RES0 regions are respected
and checking for valid memory attributes.

Based on Linux commit 0aa1de57319c4 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/new_vgic.h |   3 +
 xen/arch/arm/vgic/vgic-mmio-v3.c    | 168 +++++++++++++++++++++++++++-
 2 files changed, 169 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm=
/new_vgic.h
index 9eafab45ff..b037b6cf61 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -199,6 +199,9 @@ struct vgic_cpu {
=20
     /* Cache guest interrupt ID bits */
     uint32_t num_id_bits;
+
+    /* GICR_CTLR.{ENABLE_LPIS,RWP} */
+    atomic_t ctlr;
 };
=20
 static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index 19ebf723ee..2fb44cfe6a 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -42,6 +42,18 @@ unsigned long extract_bytes(uint64_t data, unsigned int =
offset,
     return (data >> (offset * 8)) & GENMASK_ULL(num * 8 - 1, 0);
 }
=20
+uint64_t update_64bit_reg(u64 reg, unsigned int offset, unsigned int len,
+                          unsigned long val)
+{
+    int lower =3D (offset & 4) * 8;
+    int upper =3D lower + 8 * len - 1;
+
+    reg &=3D ~GENMASK_ULL(upper, lower);
+    val &=3D GENMASK_ULL(len * 8 - 1, 0);
+
+    return reg | ((u64)val << lower);
+}
+
 static int match_mpidr(u64 sgi_aff, u16 sgi_cpu_mask, struct vcpu *vcpu)
 {
     unsigned long affinity;
@@ -369,6 +381,158 @@ static unsigned long vgic_mmio_read_v3_idregs(struct =
vcpu *vcpu, paddr_t addr,
     return 0;
 }
=20
+bool vgic_lpis_enabled(struct vcpu *vcpu)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+
+    return atomic_read(&vgic_cpu->ctlr) =3D=3D GICR_CTLR_ENABLE_LPIS;
+}
+
+/* We want to avoid outer shareable. */
+u64 vgic_sanitise_shareability(u64 field)
+{
+    switch ( field )
+    {
+    case GIC_BASER_OuterShareable:
+        return GIC_BASER_InnerShareable;
+    default:
+        return field;
+    }
+}
+
+/* Avoid any inner non-cacheable mapping. */
+u64 vgic_sanitise_inner_cacheability(u64 field)
+{
+    switch ( field )
+    {
+    case GIC_BASER_CACHE_nCnB:
+    case GIC_BASER_CACHE_nC:
+        return GIC_BASER_CACHE_RaWb;
+    default:
+        return field;
+    }
+}
+
+/* Non-cacheable or same-as-inner are OK. */
+u64 vgic_sanitise_outer_cacheability(u64 field)
+{
+    switch ( field )
+    {
+    case GIC_BASER_CACHE_SameAsInner:
+    case GIC_BASER_CACHE_nC:
+        return field;
+    default:
+        return GIC_BASER_CACHE_SameAsInner;
+    }
+}
+
+u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
+                        u64 (*sanitise_fn)(u64))
+{
+    u64 field =3D (reg & field_mask) >> field_shift;
+
+    field     =3D sanitise_fn(field) << field_shift;
+    return (reg & ~field_mask) | field;
+}
+
+#define PROPBASER_RES0_MASK                                               =
     \
+    (GENMASK_ULL(63, 59) | GENMASK_ULL(55, 52) | GENMASK_ULL(6, 5))
+#define PENDBASER_RES0_MASK                                               =
     \
+    (BIT(63, ULL) | GENMASK_ULL(61, 59) | GENMASK_ULL(55, 52) |           =
     \
+     GENMASK_ULL(15, 12) | GENMASK_ULL(6, 0))
+
+static u64 vgic_sanitise_pendbaser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GICR_PENDBASER_SHAREABILITY_MASK,
+                              GICR_PENDBASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GICR_PENDBASER_INNER_CACHEABILITY_MAS=
K,
+                              GICR_PENDBASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GICR_PENDBASER_OUTER_CACHEABILITY_MAS=
K,
+                              GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    reg &=3D ~PENDBASER_RES0_MASK;
+
+    return reg;
+}
+
+static u64 vgic_sanitise_propbaser(u64 reg)
+{
+    reg =3D vgic_sanitise_field(reg, GICR_PROPBASER_SHAREABILITY_MASK,
+                              GICR_PROPBASER_SHAREABILITY_SHIFT,
+                              vgic_sanitise_shareability);
+    reg =3D vgic_sanitise_field(reg, GICR_PROPBASER_INNER_CACHEABILITY_MAS=
K,
+                              GICR_PROPBASER_INNER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_inner_cacheability);
+    reg =3D vgic_sanitise_field(reg, GICR_PROPBASER_OUTER_CACHEABILITY_MAS=
K,
+                              GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT,
+                              vgic_sanitise_outer_cacheability);
+
+    reg &=3D ~PROPBASER_RES0_MASK;
+    return reg;
+}
+
+static unsigned long vgic_mmio_read_propbase(struct vcpu *vcpu, paddr_t ad=
dr,
+                                             unsigned int len)
+{
+    struct vgic_dist *dist =3D &vcpu->domain->arch.vgic;
+
+    return extract_bytes(dist->propbaser, addr & 7, len);
+}
+
+static void vgic_mmio_write_propbase(struct vcpu *vcpu, paddr_t addr,
+                                     unsigned int len, unsigned long val)
+{
+    struct vgic_dist *dist =3D &vcpu->domain->arch.vgic;
+    u64 old_propbaser, propbaser;
+
+    /* Storing a value with LPIs already enabled is undefined */
+    if ( vgic_lpis_enabled(vcpu) )
+        return;
+
+    do
+    {
+        old_propbaser =3D dist->propbaser;
+        propbaser     =3D old_propbaser;
+        propbaser     =3D update_64bit_reg(propbaser, addr & 4, len, val);
+        propbaser     =3D vgic_sanitise_propbaser(propbaser);
+    } while ( cmpxchg64(&dist->propbaser, old_propbaser, propbaser) !=3D
+              old_propbaser );
+}
+
+static unsigned long vgic_mmio_read_pendbase(struct vcpu *vcpu, paddr_t ad=
dr,
+                                             unsigned int len)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    u64 value                 =3D vgic_cpu->pendbaser;
+
+    value &=3D ~GICR_PENDBASER_PTZ;
+
+    return extract_bytes(value, addr & 7, len);
+}
+
+static void vgic_mmio_write_pendbase(struct vcpu *vcpu, paddr_t addr,
+                                     unsigned int len, unsigned long val)
+{
+    struct vgic_cpu *vgic_cpu =3D &vcpu->arch.vgic;
+    u64 old_pendbaser, pendbaser;
+
+    /* Storing a value with LPIs already enabled is undefined */
+    if ( vgic_lpis_enabled(vcpu) )
+        return;
+
+    do
+    {
+        old_pendbaser =3D vgic_cpu->pendbaser;
+        pendbaser     =3D old_pendbaser;
+        pendbaser     =3D update_64bit_reg(pendbaser, addr & 4, len, val);
+        pendbaser     =3D vgic_sanitise_pendbaser(pendbaser);
+    } while ( cmpxchg64(&vgic_cpu->pendbaser, old_pendbaser, pendbaser) !=
=3D
+              old_pendbaser );
+}
+
 static const struct vgic_register_region vgic_v3_dist_registers[] =3D {
     REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
         vgic_mmio_read_v3_misc, vgic_mmio_write_v3_misc,
@@ -435,10 +599,10 @@ static const struct vgic_register_region vgic_v3_rd_r=
egisters[] =3D {
         vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
         VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_PROPBASER,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        vgic_mmio_read_propbase, vgic_mmio_write_propbase, 8,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_PENDBASER,
-        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
+        vgic_mmio_read_pendbase, vgic_mmio_write_pendbase, 8,
         VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICR_INVLPIR,
         vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
--=20
2.34.1

