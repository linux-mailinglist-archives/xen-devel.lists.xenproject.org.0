Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7B44A746
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223704.386588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9y-0002KW-HU; Tue, 09 Nov 2021 07:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223704.386588; Tue, 09 Nov 2021 07:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9y-0002G7-B3; Tue, 09 Nov 2021 07:03:10 +0000
Received: by outflank-mailman (input) for mailman id 223704;
 Tue, 09 Nov 2021 07:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9w-00004s-P2
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:03:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16a729db-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:03:07 +0100 (CET)
Received: from SN7PR04CA0151.namprd04.prod.outlook.com (2603:10b6:806:125::6)
 by BYAPR02MB4215.namprd02.prod.outlook.com (2603:10b6:a02:f4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 07:03:04 +0000
Received: from SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::d1) by SN7PR04CA0151.outlook.office365.com
 (2603:10b6:806:125::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:03:04 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0011.mail.protection.outlook.com (10.97.5.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:03:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:47 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9b-000Ga6-7N; Mon, 08 Nov 2021 23:02:47 -0800
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
X-Inumbo-ID: 16a729db-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCweG3OeKbLm9pcVQWFFHmJcUZ0nghsurtf4L/I02bztruGwX8hqQ8abDpBXSQF9D7Ajt4mkwg0zQHM34/+ItWl8kdl6KX0K3exeUNk5kO/OCA6OpZkYv83EhgHHihtzEsEVmpjKhXJ0GksU0VMB5+X1TFewWeuAjWjyrAga7qW/ZKFeJHkHAycaHFxPaokqgOaJsrdr/slRF0AOz2f3SAIPP8StiKWU4efaBmSTlAC5/n3dxA35nOGYd2gmuC0pZkWxlaLGj3vJ4VKncsX26soXrjBoyD+QsaCiC+2DKUVslw3i1exLgadMfy6aXuLr5sdbYotW1f5JkHewj9zM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Fql05hs8YXgjepE7Xhz/cxP9a1+eoyB0oUmynBhbxw=;
 b=YPBnihvDhnOIbwb5E9kVJtYoe6m0Iw2q8bFCVn1c0fJb+ZB+Zjn1cno9wZPun1CBTPB0IrJ3gSpBlEN0Jtm/LtWS/ADqBQAm+hgZXudFqMZlKBFPcnzZsN45mSCKcxReqkQW/gqfOBPlW4EjyKrQF+f7unjcnnYU3hjnROCFDvFIoRc8tgGkLUzobKsHd1C/7Mcswb2FIoQGfG5Z7BLIXfHKjsGJcEtRKC42nxV1N7YgfTC9dFNm2yazxq08Mf6TOX1ndSl0hEVKeYkLSZKHrGuoQm2hxzlg3ncy+J2f2VPaA3dIoPkZBgEJZOrM4cWHl6OeTshyFhQmF550JzgoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fql05hs8YXgjepE7Xhz/cxP9a1+eoyB0oUmynBhbxw=;
 b=JvjNCc7VuZtbQfnJMoD07KzES5qIdZp8+xqzDsHfRog5t/gsIRQ080FXK2Yz8damjCYWJ/gRngmCWJEo+iMLnJInrZeAQauh8S2osN0yyfRMoI08Q2AxbHrA3l8iNLJgXZt3eZDyXHD9lUYFt0BepBBUWzXq6oYjq0ufZvm7NO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v2 04/12] libfdt: Add fdt_ prefix to overlay_get_target()
Date: Mon, 8 Nov 2021 23:02:19 -0800
Message-ID: <1636441347-133850-5-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c742b77-b06e-4ddd-5241-08d9a34ef96b
X-MS-TrafficTypeDiagnostic: BYAPR02MB4215:
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB4215995403F3D6F2E3B30383BC929@BYAPR02MB4215.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HJ6phTSI/Gijv0Ww1XTUIN83/EGjiM0a19/68+rSWLFmWq58diQPM9taCgYW588TY1aKPvBBUyAd105VfF+In8sngwJmBvFR72yIp95FRW9HEdLyKlre35G8W4pxWc7GxbolqC88bmtTqSUJtSgs0HNuKOtxZrlQNiyP6pyRgO8P2iHjo+jMKkqAdoHZc5j3cWVzA/j0c7AmfH7Tfu+/0XJr3b+gib048unvygYR26qSaropagRovYBBno/7J0BqGKvhYFdiQpxAv4eOSK6m98L/DEz1P+gZll/N7llsE+k7JtTvfPGB7eL0pO7ADEzmuSTNExdg9eJMLv8tVvd8kVXt2JOXtXPPhsUbqUDyLCKYNSTLEQv+jTQ9NkkmcGsrOrbWazWzC9TL3H+UI8Kx7aRCjDgl/B0RM8lbaTgFl+pnP+/5jMi4iLfQ5jifEVVHHhkAr35iBU+VMFewAfiQeIF3Pruqd1XKyiS6dM+oJ+IHDyBpJlc1+wdPxAouCYaPEt7oXw5fyYYihUnftPENPpuMKWfJ9K+vmsWcs16CAREaAO1tloB1gPF6Vz02PR61WN9v3ehEtrm5v4eC816lPMTVUwphVEvicVQ74XkAfWb2ddaKAw59HwJkatJGCehTDEEPiBV6iR8TuLaYp94ipr8DyZenRT1IZuyLwT2hRcVIMSAsA/Kbmd5KZJi3p/B8HSHYEOeFYyFye8zwrbngevBz1B2Py3uTHqEVj7Oxl3A=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(7696005)(4326008)(2616005)(186003)(356005)(5660300002)(8936002)(36906005)(508600001)(107886003)(8676002)(82310400003)(47076005)(70206006)(316002)(54906003)(70586007)(426003)(9786002)(6916009)(83380400001)(36756003)(7636003)(336012)(6666004)(36860700001)(26005)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:03:03.6132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c742b77-b06e-4ddd-5241-08d9a34ef96b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4215

Add fdt_ prefix to overlay_get_target() and remove static type. This is done to
get the target path for all the overlay nodes. This is useful to find which
nodes are to be added/removed in dt_host.

Also, sending this patch to dtc mailing list to avoid the divergence.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/fdt_overlay.c | 12 ++++++------
 xen/include/xen/libfdt/libfdt.h |  3 +++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
index 7b95e2b..194f51b 100644
--- a/xen/common/libfdt/fdt_overlay.c
+++ b/xen/common/libfdt/fdt_overlay.c
@@ -42,13 +42,13 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
 }
 
 /**
- * overlay_get_target - retrieves the offset of a fragment's target
+ * fdt_overlay_get_target - retrieves the offset of a fragment's target
  * @fdt: Base device tree blob
  * @fdto: Device tree overlay blob
  * @fragment: node offset of the fragment in the overlay
  * @pathp: pointer which receives the path of the target (or NULL)
  *
- * overlay_get_target() retrieves the target offset in the base
+ * fdt_overlay_get_target() retrieves the target offset in the base
  * device tree of a fragment, no matter how the actual targeting is
  * done (through a phandle or a path)
  *
@@ -56,7 +56,7 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
  *      the targeted node offset in the base device tree
  *      Negative error code on error
  */
-static int overlay_get_target(const void *fdt, const void *fdto,
+int fdt_overlay_get_target(const void *fdt, const void *fdto,
 			      int fragment, char const **pathp)
 {
 	uint32_t phandle;
@@ -638,7 +638,7 @@ static int overlay_merge(void *fdt, void *fdto)
 		if (overlay < 0)
 			return overlay;
 
-		target = overlay_get_target(fdt, fdto, fragment, NULL);
+		target = fdt_overlay_get_target(fdt, fdto, fragment, NULL);
 		if (target < 0)
 			return target;
 
@@ -781,7 +781,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 			return -FDT_ERR_BADOVERLAY;
 
 		/* get the target of the fragment */
-		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+		ret = fdt_overlay_get_target(fdt, fdto, fragment, &target_path);
 		if (ret < 0)
 			return ret;
 		target = ret;
@@ -803,7 +803,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 		if (!target_path) {
 			/* again in case setprop_placeholder changed it */
-			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+			ret = fdt_overlay_get_target(fdt, fdto, fragment, &target_path);
 			if (ret < 0)
 				return ret;
 			target = ret;
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index c71689e..1f549d0 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -2115,6 +2115,9 @@ int fdt_overlay_apply(void *fdt, void *fdto);
 
 const char *fdt_strerror(int errval);
 
+int fdt_overlay_get_target(const void *fdt, const void *fdto, int fragment,
+                           char const **pathp);
+
 #ifdef __cplusplus
 }
 #endif
-- 
2.7.4


