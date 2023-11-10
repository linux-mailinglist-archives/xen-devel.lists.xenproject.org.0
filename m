Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2D7E7C6F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 14:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630381.983252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RMc-0002YF-D3; Fri, 10 Nov 2023 13:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630381.983252; Fri, 10 Nov 2023 13:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RMc-0002WY-AH; Fri, 10 Nov 2023 13:15:58 +0000
Received: by outflank-mailman (input) for mailman id 630381;
 Fri, 10 Nov 2023 13:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R45-0001y1-DB
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97874b5d-7fc8-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:56:41 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIuvY025691; Fri, 10 Nov 2023 12:56:23 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9j2g0qjw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:22 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:17 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:17 +0000
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
X-Inumbo-ID: 97874b5d-7fc8-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7KWg/e7t6SMQhyvR+eWzfQK7yKpiVCGYHkyR5r9OuV0fCSlJr9+f2jrhKQob4ajnSpR6U8TbHnJCNzlrgycPnmUDUOIFr/tiInu0uvAwRK/9QFphNz4GFrhpQVIwCQ57F62ctD4/RSkf+RxyA/i2qYfJKQljvMIX63OWM8ClGp7n8iulbW/C3Fi2w+3kgE0UCUnOhoDQ9H6/4zoGe/JDlLNkKF0i5nmZ4fDkgbuofTEzz+GwUC4WSdqDW6Lf+GlMgMRObKF3iwiYvIhxCwXE6/+vW/hJSOiO0+TdCQ+507QZj55yW4vuqA1r31f9+sS2U8lrOhMBHZ3CpkzJUZh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDNDFGm/oYNbBFMoMI8YJN0p9d0oR7eDqt+W7CVRHVs=;
 b=atCMus5aTcQVYgMLBq+RFFGQp035wV1DJbNDIMBv8RBcU5+zIuVVvF2UhF31XyC6MTt7WjNSs2cqbLv+Q0nomhf7Z3L20hqvMJkTmsUJTTDItb+RFRdxW6R0fj+1tV5tIqPoEtAGDtb2VbEsezoRiWSenj7bFyf1peMQaYJbYV4RdEQeBRFe/pPpOSv1ktpLlSf8+JTFqUgDK+TG7gZzC6n7wQtcDzZmL1dFRsKDssthGqm5qRW0yMu2avZwxriKV97ifeIUOg/SQ+Mp94wGlE9He36Z3uvqbLceSAKCZR8Kc4SUuY/RWB+t9NI50KXD2GBLj/FM3fedAt10jPWLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDNDFGm/oYNbBFMoMI8YJN0p9d0oR7eDqt+W7CVRHVs=;
 b=enztE/TtpiIq2/65FHUvuyY8+Ik9Z6QkFe7njrzvf7IxyGVTlhqD2h25h3VPQyjPa3apptCr17SqD1E1ruZwUTBtuOVtm4HfO550udW0kHLXc6J7zRNHokpFQ1E4Z/dPJVRPWP11gVhSjJ7S47IeVBX+QNixiQXdLNjiS28Dapz4nJ8B6L8g6Tf+8OSnzYg4Rv7vQUEwGoTz6BQMdQYuxw6omd38LN5NzZj7a8yIyDMjiOPPKXOs7DAfz9VabakPYwNKYiYXMPAARKEr2HuLrWfp9Wa+yBH0nONN5MkdO4r1IA3e6RDj0jefkTYtyZ0UcFrgUVcQtHA1uKw4CkGZbg==
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
Subject: [XEN PATCH v2 04/25] arm: new VGIC: Add GICv3 CTLR, IIDR, TYPER
 handlers
Thread-Topic: [XEN PATCH v2 04/25] arm: new VGIC: Add GICv3 CTLR, IIDR, TYPER
 handlers
Thread-Index: AQHaE9VLWPTx8QfRV0CE+z+WCKth8Q==
Date: Fri, 10 Nov 2023 12:56:17 +0000
Message-ID: 
 <e68d3a969c4fe917743cd18bd315a491c9f7ec7e.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: a571b0c7-d149-47a6-da7a-08dbe1ec6dfc
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7gJLPvOPQ4de6sALUMupf9rBQoGwwXFnxJAQrlJ3duN5+Jgxd13ctD09QqJwF9RWi2MesGvCSu0/lRPoD6yGRV4Fc249Z100/UudtVN4XdS7RyzyYlFclRMAfxGNj5Brzl06Rmu9ruM9zJW1e9yT7Qb73vtex+8iJD3oJXKIq3R1nSo9ZMYd3EviEatW6TWx9wHK2UrOTg7147LsffCdaeB3s5wzt9huNXhHXjYYUjigX/PObK+kFvs0ymzVRjTa8uUCKFPm25rx+MB9L50+MazqKhuddlhn7kmh2fi4qBBbzU+9luJ/C+xtD3atf7Ky2PQ+f9WhzePuxPWrg28iDmy2X3NnUQeiXUZnu0/xCt1iNkbmKB4b4FjrUI8Gpt4vtWjEjCfpn/TKHGhCXtHCvxB8I4lBX0YiWRZc/ee2SipaeSCoXfsbKLRXxFqQRuleqY7fQ5h4gusG5AJaKYbI5k1sihoQnAxw2Vu35lFKzX8L7/D/tiZvoWPLuihu5kBv4jFak3id2An5PH9wvURsLvDGrAZrBIBBrbez6iTizTuC9X2Lx3GvYlRAdIMDwp1M62RRssk2G3k2A2OqSVExLJ1qfp0Pb1Ss6OuWtOBBWPJ5KthJWLbGq+wzzp/bksw/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?16q/IIuG4aHCtSFPsxHduyMTV5n8kO0y8CSiP7+dLNmXFEeI7lyBU7jpTS?=
 =?iso-8859-1?Q?i3SaE7jO+gd6JzNCgsR7eiRzwbwIsaACYR9fnNIZiyO5DTEr7Z/rOzCFwn?=
 =?iso-8859-1?Q?7Dfj6BXXfhhmRxR0LZlTXMgvUDJGf5MbdQlnbMY4Hosi7xc8N9EFszTIR7?=
 =?iso-8859-1?Q?MC8p7fmNN0tH11VliUQW1u9ZnkFWaG1w5zufVuFwQ2i0a6RP8J67QcvhI6?=
 =?iso-8859-1?Q?/KThKvXaShhV768XRDsBzJUtwj3KqM88QRxjmuSvDzANd3XUxHlppxROq6?=
 =?iso-8859-1?Q?Lew/ndV10TDhDVXWHVDwyXjZUmLIFqNaC6MgCeVlnsgLEmJR+3V3T+BjRr?=
 =?iso-8859-1?Q?RAHHDzx/3yXiFAynnSg95+Ze19EeSAkX3YQMz1ZRcY8Qli7Au8za6yHUG1?=
 =?iso-8859-1?Q?oOJIGxFx5t0OC4cCfm28LWlRJRoTuBL+bpKX36A5QVU0HJq4602jbku3Ty?=
 =?iso-8859-1?Q?kaPBEFFzGh3Os2JRSZKCGKSuZWUWFpzv5JhIbnXlHEIDrLC+bisZ4MkOrV?=
 =?iso-8859-1?Q?m7gOZlrvAitsTf7WotsYvvZHaxdiV35bN0q6UUEHIsBiRnb1Q6hhICG586?=
 =?iso-8859-1?Q?DijWe6ozzmhiUv1drgyQ8+s/ey4jaNnGIjefb36FGgSw6EXb1H18tk+jVH?=
 =?iso-8859-1?Q?YYO4j3WInaze4s2KD4mEtG1A3S+8ktwQHDYfNRzEsgmowWCgwry/yEXgo2?=
 =?iso-8859-1?Q?ge5uOZPtWZpXYyVyfdLH7M/xK6IH2C3C/BgrVN10OODyzUgBvdp44Iqd5L?=
 =?iso-8859-1?Q?qdLj98oZPRf4PUa4geeg4aXw6tqjv1uLMNXYYmc/26Xgyc+by1NIgUCdXR?=
 =?iso-8859-1?Q?2tmdPMZwZDnq7Kp3pdLDU/KGQk+RxYUfogwDdfjRILcGGmpwohbq6JoVMp?=
 =?iso-8859-1?Q?FJL1e+r3t7AbTKxaNUxJEtj/SBLAjfM6g63wro0cVYBbm+P8eyIQS4rF/J?=
 =?iso-8859-1?Q?2LNLV3R5xOxyTkQb6pa2jA4EOFb88vJO+X7BJaTj/hpv7v7dSizIoQuCt/?=
 =?iso-8859-1?Q?+By0xbBC+Du5BvfvkosN2E9EJ7q89kQe4oR0EXcTc3uwYVApmKg9MQ/Bdl?=
 =?iso-8859-1?Q?7blgu4/L3sPXB77kxNTsGrNnD6SXXqmFQysUEUPVucHhzgxoisWTiXSVMK?=
 =?iso-8859-1?Q?IfGEN8TwHUHW6dg3pP5G9gaseTt2+dtsk/aOTSf6w45uaVIPd17jorq9Rq?=
 =?iso-8859-1?Q?4WAT/PYLrMqL4b977qDIE6xekGFNumQgqNHO9n6Sg+U4g4PmDR/r1hjjFg?=
 =?iso-8859-1?Q?1W0ll50n5e+DgndhCcdlj6slPCgkty2cZQka6hNwh7mxcV1TCk1Dh7Z38S?=
 =?iso-8859-1?Q?lTNQxvZs6dXNC7+or/8FJrPBxeKZiQ6U+K4ZX8ZAYpLYoIyB5aWATP53Mz?=
 =?iso-8859-1?Q?E+72IA9rNOmaHUSCLuPfEn3cSnR2mX2kJhpJ3ig5C28A7V6bCBreuEZ0w9?=
 =?iso-8859-1?Q?c47BC4xr0Dbjq1+v/fP1ZEypj74CY1tlYrWPYseKWh1umlpn9qdw6GDqIf?=
 =?iso-8859-1?Q?A+arUUV+ETvOfTrywPUaYcprea56BkZSf76O7LAWTkPTzCmQkESBFlKgMo?=
 =?iso-8859-1?Q?T3ale2Ip465PmmzJMgbwUjsnFyeIB+MW40pMNnBg72PRGuE057eBiiD8kv?=
 =?iso-8859-1?Q?knwqD6Na1itaZvoHY4Ax97BcdQwe/yI2y2r4djXDKGdyUgS8UXBgNpNA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a571b0c7-d149-47a6-da7a-08dbe1ec6dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:17.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: caN7i1Rj+smbIMRx6LR+czihsIjyT8Q66iKab/uumUsizAeHd9HEy0YCHVChIql5GdG4qgQ/KrkhPQKDuqcYIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-ORIG-GUID: 5PDy9eZtwdV906AuYLrt5Ou7JaXknPj2
X-Proofpoint-GUID: 5PDy9eZtwdV906AuYLrt5Ou7JaXknPj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=955
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

As in the GICv2 emulation we handle those three registers in one
function.

Based on Linux commit fd59ed3be17e41 by Andre Przywara

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h |  2 +
 xen/arch/arm/vgic/vgic-mmio-v3.c       | 71 +++++++++++++++++++++++++-
 xen/arch/arm/vgic/vgic.h               |  1 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index b7059635d7..e0d536e887 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -25,6 +25,7 @@
  * Common GICD registers are defined in gic.h
  */
=20
+#define GICD_TYPER2                  (0x00C)
 #define GICD_STATUSR                 (0x010)
 #define GICD_SETSPI_NSR              (0x040)
 #define GICD_CLRSPI_NSR              (0x048)
@@ -57,6 +58,7 @@
 #define GICD_TYPE_LPIS               (1U << 17)
=20
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio=
-v3.c
index b79a63ce3e..beb3d6ad2a 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v3.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
@@ -22,9 +22,78 @@
 #include "vgic.h"
 #include "vgic-mmio.h"
=20
+/*
+ * The Revision field in the IIDR have the following meanings:
+ *
+ * Revision 2: Interrupt groups are guest-configurable and signaled using
+ *            their configured groups.
+ */
+
+static unsigned long vgic_mmio_read_v3_misc(struct vcpu *vcpu, paddr_t add=
r,
+                                            unsigned int len)
+{
+    struct vgic_dist *vgic =3D &vcpu->domain->arch.vgic;
+    uint32_t value         =3D 0;
+
+    switch ( addr & 0x0c )
+    {
+    case GICD_CTLR:
+        if ( vgic->enabled )
+            value |=3D GICD_CTLR_ENABLE_G1A;
+        value |=3D GICD_CTLR_ARE_NS | GICD_CTLR_DS;
+        break;
+    case GICD_TYPER:
+        value =3D vgic->nr_spis + VGIC_NR_PRIVATE_IRQS;
+        value =3D (value >> 5) - 1;
+        value |=3D (INTERRUPT_ID_BITS_SPIS - 1) << 19;
+        break;
+    case GICD_TYPER2:
+        break;
+    case GICD_IIDR:
+        value =3D (PRODUCT_ID_KVM << 24) | (VARIANT_ID_XEN << 16) |
+                (IMPLEMENTER_ARM << 0);
+        break;
+    default:
+        return 0;
+    }
+
+    return value;
+}
+
+static void vgic_mmio_write_v3_misc(struct vcpu *vcpu, paddr_t addr,
+                                    unsigned int len, unsigned long val)
+{
+    struct vgic_dist *dist =3D &vcpu->domain->arch.vgic;
+
+    switch ( addr & 0x0c )
+    {
+    case GICD_CTLR:
+    {
+        bool was_enabled;
+
+        domain_lock(vcpu->domain);
+
+        was_enabled   =3D dist->enabled;
+
+        dist->enabled =3D val & GICD_CTLR_ENABLE_G1A;
+
+        if ( dist->enabled )
+            vgic_kick_vcpus(vcpu->domain);
+
+        domain_unlock(vcpu->domain);
+        break;
+    }
+    case GICD_TYPER:
+    case GICD_TYPER2:
+    case GICD_IIDR:
+        /* This is at best for documentation purposes... */
+        return;
+    }
+}
+
 static const struct vgic_register_region vgic_v3_dist_registers[] =3D {
     REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
-        vgic_mmio_read_raz, vgic_mmio_write_wi,
+        vgic_mmio_read_v3_misc, vgic_mmio_write_v3_misc,
         16, VGIC_ACCESS_32bit),
     REGISTER_DESC_WITH_LENGTH(GICD_STATUSR,
         vgic_mmio_read_rao, vgic_mmio_write_wi, 4,
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index a8e3ef5970..b3bba7b5f3 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -28,6 +28,7 @@
 #define VGIC_ADDR_UNDEF     INVALID_PADDR
 #define IS_VGIC_ADDR_UNDEF(_x)  ((_x) =3D=3D VGIC_ADDR_UNDEF)
=20
+#define INTERRUPT_ID_BITS_SPIS  10
 #define VGIC_PRI_BITS       5
=20
 #define vgic_irq_is_sgi(intid) ((intid) < VGIC_NR_SGIS)
--=20
2.34.1

