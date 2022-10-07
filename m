Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C33F5F76F1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417681.662394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf7-000588-Ls; Fri, 07 Oct 2022 10:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417681.662394; Fri, 07 Oct 2022 10:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf7-00050I-CM; Fri, 07 Oct 2022 10:33:01 +0000
Received: by outflank-mailman (input) for mailman id 417681;
 Fri, 07 Oct 2022 10:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf5-0004PE-AW
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:32:59 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6821c197-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:32:57 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978PgUg009630;
 Fri, 7 Oct 2022 10:32:53 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2237.outbound.protection.outlook.com [104.47.51.237])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k20nb3gbm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:53 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DU0PR03MB8622.eurprd03.prod.outlook.com (2603:10a6:10:3e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Fri, 7 Oct
 2022 10:32:49 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:49 +0000
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
X-Inumbo-ID: 6821c197-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbSvElxJ17FifaxdNXwj8TabeRhJLRm0CSMIbDlcyALJpgGBEMiZY2JES/RlXBLVd131VwIwFvXkP4lze0TQkOKLIpAvZauxg095VL1oVtTKPi45NAb4s1lMR2TzjYIg/7t6XWsJgbb1tZfGAB7/2Yt7HhaYymr3975XB/jpjXxslak0xdL3PEjvDVSTlaBnryKY2eZpTCW7nftZ/HNISpnN00j5fMLm97SH+x/0byCXR8sIK8/BMRecX8dtqy8JD3MuFNq7B11/nBAQzQdt1kQEgcb7WmvM1CkK75sEe296FQtCrHE8FuRWemwwrzHVkzFxLwkf6nHiDtutDRkh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6yJ0yDZf36EG3Um81KKQS4asysiZbHKT9YQCuxEkmg=;
 b=WNi/ztOMpM9SvReWp6Alo0zm/7bqijc6dhhpVxL+8dzqXtO4PSMLyKrcRiqIzCrI9gSFjODmEZD1mXhiCgYh9cFYqw9loKH/JzmFWmKIYsU6aEgdkNOsi4l+0H9MqxtMpEOMTZNMnWwqzVFjjPXzCn0dBwC8jPshwWbuakKX/PM0IpkVZN44mhFFOEGiAB92Z3grJN3HS3fgOOC4BR2V+uuIdbJ+CafDhUFXKCeN7Y5QsbmCLuVlk2yU0pX9i3XIulDh5diV8O8bEbRPThPt8z0EU5Rriyi7QsQGHdb3YzS6+9cDtufsx8XY8ZrK7N/ww+9AuDLXUrYqrYyipJ9obQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6yJ0yDZf36EG3Um81KKQS4asysiZbHKT9YQCuxEkmg=;
 b=Q326g/s1s4KCV7K3TUmAl32nOItO0tZ6J0aElMbWZydcRFmMDb9ZUJ50M8/UUquEsZWCBM01QONNsMbGbj/smPH+1foLBsFH+otPIsGNZj3ONyi3FU/qCwnxB8qE/vtX9XqJPvz7K07n/CqTy2eY6L5u7XmGrX28uu9JQCIE+BYR/kOsj5trv/6MjPWskuDl5Mu9ICmOGSnQbnPK7bNBYma1UBuiMda305AsWMFRxoseRTuf8dRN/RxTk0bW7n+9mkUY2l3VW6nqX3q3j9siqxAbzWRkXYGDnPBDEfPDcy81XwCdsJAD5RQhMbc8tyQBZuNwsno6SQgQAroc1uiBdA==
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
Subject: [PATCH 09/19] xen/arm: Implement GIC suspend/resume functions (gicv2
 only)
Thread-Topic: [PATCH 09/19] xen/arm: Implement GIC suspend/resume functions
 (gicv2 only)
Thread-Index: AQHY2jglV560PC3YdU2+hS8j4FDcKA==
Date: Fri, 7 Oct 2022 10:32:48 +0000
Message-ID: 
 <0f1bebffe29c96c5b66c83b62b0c67752114c53a.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DU0PR03MB8622:EE_
x-ms-office365-filtering-correlation-id: c2199bc9-b017-4d33-fd7c-08daa84f482f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lVOeAWQjbIEC/MIwv30KXusencYFaQzxibUSqY6V7IzErQ9zzHXvAgdvb6/tjOPU3THojvpht+j3Fw/gY/s7XeaVX+24DDp2Ho5cdxx+95/7dJpXE17V1BR3p0phBhQPv5slOBriO7GJ/HYW3LfztXBq45Ooc2+f/j4DmFk1Rctw8IOMPsaHqde7iCKT3e3WjI2ey40uduD6pr8nhJ/KDEsOoCt98kIvyuPjGRUvFN9KA35IQuRbK1T9PowRDg4v4IRzgFE0pVti77e1Kgwe2Ttd387G2KeggohNT54F2WJm9C69w3zz2+ghkzgnCDeRI/4S7S7FEW81OWT7u68xlj/ucPlu2QP4F2XDNklsNFAOs3h0ePe2okzVqjRrZ8uip0z6+1xLu39eGLGSHpGv6eZQAPpastgZBQg4vQSETSGj7kask4nbAs++TsdNxraPWYlbk6OBfIGx1cA7yLZKPVl7ClhRzWAT/Kbt1aP2Dhzx1/xrkUZdML9cRl2i5lpIotvCCefjtOFtwaKsqPgjDulEwrEk4UChsU5L1i9ohQhGi+C0AMUdP/xfTTtKaNVjgZWzPungnYOaPmAq9WDLX+5P579oW7AYcQaOKrc9v59Bc4WWorq4yoZlykxl31rCHPRuMucxZ1hULfLZkH7Fts2Iy2FPbnlCD16JrpNaLyFvJbrfrEZxLVNepdWeCcf+aNUTYePO5erlvRXsIGbDHO0uc8HRDRQWUmcJFjicqJMMb9QMwOfKXTjHLeeQPUShv/VuZzpBED2QzW2tQQWU0Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(36756003)(2616005)(6916009)(83380400001)(122000001)(38100700002)(86362001)(54906003)(8936002)(478600001)(8676002)(41300700001)(6486002)(66476007)(71200400001)(26005)(38070700005)(316002)(6506007)(186003)(55236004)(66946007)(76116006)(64756008)(91956017)(4326008)(5660300002)(2906002)(66446008)(66556008)(15650500001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EadNRHZotYtjNTQ622NHTWyGSMUo8vV69UO4GbtinKyagiT8exDRQphxRq?=
 =?iso-8859-1?Q?5jegh9KIiXQqsQUw7JtRhVBC7Q0He/yZVOD/Lr+uNc4KPrCKPK/hHPzYRc?=
 =?iso-8859-1?Q?PXIUIoVChuIRidElL8B5b7JfaMj4NDdzzOkw4t3UE8E/cOUEIUxH/Cp1Wy?=
 =?iso-8859-1?Q?22/GFJ0dTvnG8M2Oac7I6xIaF3O63VDjhpxdJ/74OSTPwRDEySwT8+J9NW?=
 =?iso-8859-1?Q?HV5tFFGsWMF7m7qXmHZdFu6I4vu3E6ISMjsyF8LVldQN8s5uaP7TPF/obD?=
 =?iso-8859-1?Q?ZFesf064aSUojgSyxzPlTWgFy2epMSVStiMqHHKX7c7hI6p59ebs0CTNIJ?=
 =?iso-8859-1?Q?zrs1wty1DpINtaeHWoTaOC9EsItZo+O8YoQ4bszgAEBkwYUaLzHsTFo0yw?=
 =?iso-8859-1?Q?7Agwoz+Lx02t0wq+wI0VbLQI1akcwIs18TKJ8eI5AOuG+vleWJ1Kq8FT8v?=
 =?iso-8859-1?Q?4/2pEyYUs4a4RAIuV1l8nkjz5GuiLYQLs4sLK/A3R45hrxtt+6J2r3jObL?=
 =?iso-8859-1?Q?9FfyczRHjuAWoLCXoYD68xK694kVSmXVRjEbbQVI2Mmb0VMbPTu3SH8VAi?=
 =?iso-8859-1?Q?DED6INpTD6ouzk7k4X7wKGZN3jRDCizbdnljzoMmn1Ywrzc2XT9mJS2tbE?=
 =?iso-8859-1?Q?nRihNwDzOeQVlEK0JYRoWhOnWkhbOX2g6hbw4Ke3XqF/ICfVnbacmEklZ0?=
 =?iso-8859-1?Q?2odDpDxvlDSYpSOCMeiOX//vtunSOvTtLnINVyy85t8yaZlKH9HI1X7odf?=
 =?iso-8859-1?Q?36nHsycDOoJrkMAB6NGjIDBzEgU5atu10LB+zeiUxMDnF2298IN7iGgCce?=
 =?iso-8859-1?Q?7ufWSX9PXyq6jkC7R2wuy6AwRxhh/Er+nnKYsNxFFUr3RlfA6v2CpIZZSG?=
 =?iso-8859-1?Q?tA1xspiRY4xeyzQAt51/zne8fgOLUMoUfAc6idwD4P4OFUIsHikAetJG3C?=
 =?iso-8859-1?Q?TDRwXArgciVE7uONrOQ27cJmXJ4BPSPvCQpMixlQIx4iSz5wQLIfcL2LBR?=
 =?iso-8859-1?Q?XbHgd9xmlBE75D0I+O2I7clhb9bz2Df7wgcfHKb70tYpk4HQgpcaxmNWgz?=
 =?iso-8859-1?Q?88ze7+HTktb9vs0MIuhc7KBzDd6a1I+S8quNZF6+SPW6vAzopIJS7ipaZ+?=
 =?iso-8859-1?Q?j90oQ9AW4egcXfaMlW7zx5ClLuh5KOserR28/yDuPwRuWVv5kBVgaYGBfO?=
 =?iso-8859-1?Q?1RmzXvoMok47I9clbqeZuyXtV/7fLOzqMKTDDhTmauY6g5Bs/777CzCaNz?=
 =?iso-8859-1?Q?BHSdi8Fdc/Y1JJ2WE5/bt+wgAoWHC33/I4+fz5il0yfd9Y+cVbQuR41A0l?=
 =?iso-8859-1?Q?3ivHwBeq9UcGz2R/WUhj1ZdITumjzsRrHiiFWvm2CL4wwxOL75dKCEK72L?=
 =?iso-8859-1?Q?+UNm/Naij5x0Vi1S6GfJnr3jQeegRFEK1xPJhX0rgMnEm8AHaELAwkD6o8?=
 =?iso-8859-1?Q?uy/J41oAGVKOMEFpxhmUaYD4rRSyXcTUpeEmMXmxi70cMASBBaRV5sspZz?=
 =?iso-8859-1?Q?VfCpAx8rQbUPk4VcXXAdWSJXs2mizvvmdR/Zx/6PVmD/WoIsGPTjGut2rc?=
 =?iso-8859-1?Q?oPQluWJf5J6VOV94yNEWKsM33B4/XgM1sBDz21DaN0GiJTQDqGbxo9jViq?=
 =?iso-8859-1?Q?2hCpO050hceWr/8+Dc17ZCMwHVOQiNmGcer/brnYk2hhTEOpe45a9HSA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2199bc9-b017-4d33-fd7c-08daa84f482f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:48.9427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnvkRYWgL8cssGVoO298A95zqV8020OZSLIKjJBDXJZBxnjyk5Q9oj5T+F+fVmK5UzVp4+haBElDwpXypJehCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8622
X-Proofpoint-ORIG-GUID: RuDHMRXrZFaca-OYX3A6AsXEwKalTYd6
X-Proofpoint-GUID: RuDHMRXrZFaca-OYX3A6AsXEwKalTYd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=552 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.
Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.
Tested on Xilinx Ultrascale+ MPSoC with (and without) powering down
the GIC.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/gic-v2.c     | 138 +++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/gic.c        |  27 ++++++++
 xen/include/asm-arm/gic.h |   8 +++
 3 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index b2adc8ec9a..b077b66d92 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -123,6 +123,23 @@ static DEFINE_PER_CPU(u8, gic_cpu_id);
 /* Maximum cpu interface per GIC */
 #define NR_GIC_CPU_IF 8
=20
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    uint32_t gicc_ctlr;
+    uint32_t gicc_pmr;
+    uint32_t gicc_bpr;
+    /* GICD context */
+    uint32_t gicd_ctlr;
+    uint32_t *gicd_isenabler;
+    uint32_t *gicd_isactiver;
+    uint32_t *gicd_ipriorityr;
+    uint32_t *gicd_itargetsr;
+    uint32_t *gicd_icfgr;
+};
+
+static struct gicv2_context gicv2_context;
+
 static inline void writeb_gicd(uint8_t val, unsigned int offset)
 {
     writeb_relaxed(val, gicv2.map_dbase + offset);
@@ -1251,6 +1268,40 @@ static void __init gicv2_acpi_init(void)
 static void __init gicv2_acpi_init(void) { }
 #endif
=20
+static int gicv2_alloc_context(struct gicv2_context *gc)
+{
+    uint32_t n =3D gicv2_info.nr_lines;
+
+    gc->gicd_isenabler =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
+    if ( !gc->gicd_isenabler )
+        goto err_free;
+
+    gc->gicd_isactiver =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
+    if ( !gc->gicd_isactiver )
+        goto err_free;
+
+    gc->gicd_itargetsr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
+    if ( !gc->gicd_itargetsr )
+        goto err_free;
+
+    gc->gicd_ipriorityr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
+    if ( !gc->gicd_ipriorityr )
+        goto err_free;
+
+    gc->gicd_icfgr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 16));
+    if ( !gc->gicd_icfgr )
+        goto err_free;
+
+    return 0;
+err_free:
+    xfree(gc->gicd_icfgr);
+    xfree(gc->gicd_ipriorityr);
+    xfree(gc->gicd_itargetsr);
+    xfree(gc->gicd_isactiver);
+    xfree(gc->gicd_isenabler);
+    return -ENOMEM;
+}
+
 static int __init gicv2_init(void)
 {
     uint32_t aliased_offset =3D 0;
@@ -1318,7 +1369,8 @@ static int __init gicv2_init(void)
=20
     spin_unlock(&gicv2.lock);
=20
-    return 0;
+    /* Allocate memory to be used for saving GIC context during the suspen=
d */
+    return gicv2_alloc_context(&gicv2_context);
 }
=20
 static void gicv2_do_LPI(unsigned int lpi)
@@ -1327,6 +1379,88 @@ static void gicv2_do_LPI(unsigned int lpi)
     BUG();
 }
=20
+static int gicv2_suspend(void)
+{
+    int i;
+
+    ASSERT(gicv2_context.gicd_isenabler);
+    ASSERT(gicv2_context.gicd_isactiver);
+    ASSERT(gicv2_context.gicd_ipriorityr);
+    ASSERT(gicv2_context.gicd_itargetsr);
+    ASSERT(gicv2_context.gicd_icfgr);
+
+    /* Save GICC configuration */
+    gicv2_context.gicc_ctlr =3D readl_gicc(GICC_CTLR);
+    gicv2_context.gicc_pmr =3D readl_gicc(GICC_PMR);
+    gicv2_context.gicc_bpr =3D readl_gicc(GICC_BPR);
+
+    /* Save GICD configuration */
+    gicv2_context.gicd_ctlr =3D readl_gicd(GICD_CTLR);
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
+        gicv2_context.gicd_isenabler[i] =3D readl_gicd(GICD_ISENABLER + i =
* 4);
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
+        gicv2_context.gicd_isactiver[i] =3D readl_gicd(GICD_ISACTIVER + i =
* 4);
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        gicv2_context.gicd_ipriorityr[i] =3D readl_gicd(GICD_IPRIORITYR + =
i * 4);
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        gicv2_context.gicd_itargetsr[i] =3D readl_gicd(GICD_ITARGETSR + i =
* 4);
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
+        gicv2_context.gicd_icfgr[i] =3D readl_gicd(GICD_ICFGR + i * 4);
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    int i;
+
+    ASSERT(gicv2_context.gicd_isenabler);
+    ASSERT(gicv2_context.gicd_isactiver);
+    ASSERT(gicv2_context.gicd_ipriorityr);
+    ASSERT(gicv2_context.gicd_itargetsr);
+    ASSERT(gicv2_context.gicd_icfgr);
+
+    /* Disable CPU interface and distributor */
+    writel_gicc(0, GICC_CTLR);
+    writel_gicd(0, GICD_CTLR);
+
+    /* Restore GICD configuration */
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
+        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
+        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + i * =
4);
+    }
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
+        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
+        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + i * =
4);
+    }
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR + i =
* 4);
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + i * =
4);
+
+    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
+        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
+
+    /* Make sure all registers are restored and enable distributor */
+    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
+    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_EOI,
+                GICC_CTLR);
+}
+
 const static struct gic_hw_operations gicv2_ops =3D {
     .info                =3D &gicv2_info,
     .init                =3D gicv2_init,
@@ -1361,6 +1495,8 @@ const static struct gic_hw_operations gicv2_ops =3D {
     .map_hwdom_extra_mappings =3D gicv2_map_hwdown_extra_mappings,
     .iomem_deny_access   =3D gicv2_iomem_deny_access,
     .do_LPI              =3D gicv2_do_LPI,
+    .suspend             =3D gicv2_suspend,
+    .resume              =3D gicv2_resume,
 };
=20
 /* Set up the GIC */
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3b0331b538..e9feb1fd3b 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -467,6 +467,33 @@ int gic_iomem_deny_access(const struct domain *d)
     return gic_hw_ops->iomem_deny_access(d);
 }
=20
+int gic_suspend(void)
+{
+    /* Must be called by boot CPU#0 with interrupts disabled */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+
+    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
+        return -ENOSYS;
+
+    gic_hw_ops->suspend();
+
+    return 0;
+}
+
+void gic_resume(void)
+{
+    /*
+     * Must be called by boot CPU#0 with interrupts disabled after gic_sus=
pend
+     * has returned successfully.
+     */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+    ASSERT(gic_hw_ops->resume);
+
+    gic_hw_ops->resume();
+}
+
 static int cpu_gic_callback(struct notifier_block *nfb,
                             unsigned long action,
                             void *hcpu)
diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
index c7f0c343d1..113e39460d 100644
--- a/xen/include/asm-arm/gic.h
+++ b/xen/include/asm-arm/gic.h
@@ -275,6 +275,10 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
=20
+/* Suspend/resume */
+extern int gic_suspend(void);
+extern void gic_resume(void);
+
 /* SGI (AKA IPIs) */
 enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
@@ -390,6 +394,10 @@ struct gic_hw_operations {
     int (*iomem_deny_access)(const struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
+    /* Save GIC configuration due to the system suspend */
+    int (*suspend)(void);
+    /* Restore GIC configuration due to the system resume */
+    void (*resume)(void);
 };
=20
 extern const struct gic_hw_operations *gic_hw_ops;
--=20
2.37.1

