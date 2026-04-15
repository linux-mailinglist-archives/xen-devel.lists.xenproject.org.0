Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJZSA51432kATgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B050D403EA7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282284.1564934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYh-0003PJ-Po; Wed, 15 Apr 2026 11:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282284.1564934; Wed, 15 Apr 2026 11:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYh-0003KB-MG; Wed, 15 Apr 2026 11:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1282284;
 Wed, 15 Apr 2026 11:37:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCyYg-000318-KO
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:37:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyYe-00AKHN-Ew
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:37:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df7861-2eae-0a2a0a5409dd-0a2a450aeb5a-48
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:25 +0200
Received: from [52.101.57.67]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df7874-ee98-0a2a450a0019-346539433ad3-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:25 +0200
Received: from SJ0PR03CA0208.namprd03.prod.outlook.com (2603:10b6:a03:2ef::33)
 by BL4PR12MB9484.namprd12.prod.outlook.com (2603:10b6:208:58e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Wed, 15 Apr
 2026 11:37:21 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a4) by SJ0PR03CA0208.outlook.office365.com
 (2603:10b6:a03:2ef::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.44 via Frontend Transport; Wed,
 15 Apr 2026 11:37:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 11:37:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Apr
 2026 06:37:19 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 15 Apr 2026 06:37:18 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFMqWsGHznRzvoBXDTBOQmCQkHNGoYGtOwFw0gs2uOOmeSQEm9S8QD+A7P0L51uEl46mXcHH9G0X/HQ/GgYDLLoujyHEFit1Ekyxmv1iU3+lbQ6XlKw2idsf7gFYCzFKZzaog9J0gZWKwZ5qLoIyZnwyANH02gs8XuWPhoLFVinVkT0AF/3aDaeYsy5MFjTvlu2db0pcDIhVhCWmsRGizseC0yNNKb94LKGlXBz05Ve1Zb25oQvxEKm8RQuAFWEwu6ySVEPCDunm8ptJ98hrnPMqeMq/oBE6c8J8vDxNd2nRoAQI4cwbLruB3QmjgWsFW1vzLinusEfUprDsnAQYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4OWT3wEIvjpzw9Xkvlr6Mw8vRGWd6LHuIzfFhcybcE=;
 b=iHH9aSJ+FR0xZqG5ECX5V3pYjWly6vk9xb0frxqz3RuZy1vsD2KS+sMr16kRvOKV6CezaZrywZTxLM08/JizotXkhP6LK74Ikhc6BPOAlXQ6nQO1TAAsLwUUMBJuII0+ZJLumakdjgyAd1pdjZkH24KcQsY6EL56Uf8otCzpAE0p6aJGAB9a2Y54wfyGbYiKM166gzjg1mh/xTplDnjoOVAYXN5SzMj7NdAqhuMFdSDPN91y5CcUySwTsNOwCqBQI+8w45h1K2PUpOJmTtxFrrDMTIw0O+MUJtPbbAbwk1qyWMjDAnnRK6dleC/jfOHBU1B+yM7IQatVQC4/051e3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4OWT3wEIvjpzw9Xkvlr6Mw8vRGWd6LHuIzfFhcybcE=;
 b=bElhxLrn5fOhoh7zsIG8rNp/tonKNicY3yvXmkMZkqYZW1WZ8ZNcOECGFKD2N0YOZNzOri7hi7nF501jTmror80iXK6jxL/4zm0fcXYkJlqcR1hl7jT2cu7mPYdap5+7UXhTw+ArQq6nIdW/ni+vrzMxC88x5E+1WWrMqqghrt8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in overlay_get_nodes_info
Date: Wed, 15 Apr 2026 13:36:59 +0200
Message-ID: <20260415113700.107915-6-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415113700.107915-1-michal.orzel@amd.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|BL4PR12MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: a3562573-1ea7-4114-f66a-08de9ae35ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pfzXJtEAUbsowuNyJqo3RkzJ+U4keejQBjqn4ymkRLVBPUH0FEN9YCQk1LTeJ5ia/l6h7YQ9wR0deLtmtL49jwFWNNPaT1XRLtDPXATq+SX6OWRcUGPISdpjSA4qR0lg15mYolWVsBjrYGyezeSQjutMNlnE02zbYIb1YJjQc6+cjnd+wEFbJnyFVrWtsUtCchZR/gsbaJaZuf7KmqyCCDW7wnMdXev6fdi9fOqaLk3MwatJQdGi7xFE7BSEbAgVQ5umba7CfOpRf6lTzgkgHuWtARq+fGMArXC6WI5b8Zoa96rF9+7Nivt1sNN4rAjKbqGTgA6HVNn4N7DR20zGlLSwQeKnRYsMku7H4BKTd7YGLuZTpaJD7O9Q6Xo2PrZRqy5pVJaEImgo2cobCvi+CG6TU3etAobdVm5RPe2ZXxvURl385G1MUiDCUzW/f5rnphroHD6ciocsw3O2zyXpE1sg9ksojHtiJwGiOtb5FwPfw90sHi046QGjWgCpfninwx8XD6bp4urF8t823u25URRm1P1WhF59chJ6u1W3JQ//+t+6uX/ow4o1wpoBt9eSHynyUHGSsTiE5J6hCLwNdVXaTNSN4IOig8r5k1FXle6mjH/nwCqjjRd6oKB4LJ7zrckVjkgRi3Rq6EXeQluqZoqJH0seSsrORUTjI6FA0rQSSYlmhz8QXWWj2DFNX3nyvXYvNTFwjfSfOIeE0iorXTbKLd1mHtHFfsFk5VcSqAbVV/OLBHTvgKMtX94374rULmRSfT5OuljtX/pvy3JRiQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K9SoG0BYfzgMKjd46y0D4bnfU9nHxGrGzrojGF2DYRTTlyJ3y5xbTcdHh/HWXJebvD9Px7pl8rigf3CtC7FC0vL0v4ZjjQurNMenlqUk84aMmx936AD8FbxUuzlzHbL2wV5J2toufvI1xjRIhDBTSXe6ELRsIhLJZ+o00lnjW8xhC/nS8kjzjJhlss8zMg4Yb7b/wTctLOyOXRXG+vZSZ5cYJaY/Obd3PDZw6nAMV4+Kw7mxgfO7wX4Tyefo4mmTbabvegugXAwrMLB8FiVG5DRz/NMBF+ZOHVv6bKAg1Bah/dTLivFqhPqYiwZShEmsHax2jF746hG+4x5qdHG6J9Cn0UnwJV4yf3E0bap2knt6pnGjpDChvs4cHcl6G0+4ySCXtU6nVlKFSajAMCEcMDOv3ExIbJEWras2rSMhhkXPjT+NRzhcYDOM4lPFjYQr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:37:20.4402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3562573-1ea7-4114-f66a-08de9ae35ada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9484
X-purgate-ID: tlsNG-4011c0/1776253045-0EF4B0B1-E223FD59/0/0
X-purgate-type: clean
X-purgate-size: 4420
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B050D403EA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

overlay_get_nodes_info() is called before fdt_overlay_apply() to extract
target paths from the overlay. This fails for overlays using phandle-based
targeting (target = <&label>) because DTC compiles these as unresolved
fixups (target = <0xffffffff>), causing fdt_overlay_target_offset() to
return -FDT_ERR_BADPHANDLE. Prior to this change users were forced to
manually modify the dtbo (even for hwdom) to switch from target to
target-phandle by manually inspecting also the host DTB.

Introduce overlay_get_target_path() which directly handles the two
targeting cases that occur before fixup resolution:
 - target-path: the string property is returned directly.
 - target = <&label>: the label is found in the overlay's __fixups__
   node, then resolved to a path via the base DTB's __symbols__ node.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/dt-overlay.c | 65 ++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index d3d4669718ac..a0dee7edb7e5 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -286,6 +286,63 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
     return num_overlay_nodes;
 }
 
+/*
+ * Resolve the target path for an overlay fragment.
+ *
+ * This is called before fdt_overlay_apply(), so phandle-based targets
+ * (target = <&label>) are still unresolved (compiled as 0xffffffff by DTC).
+ * Handle the two cases that actually occur:
+ *  - target-path property: the path string is used directly,
+ *  - target = <&label>: the label is looked up in the overlay's __fixups__
+ *    node, then resolved to a path via the base DTB's __symbols__ node.
+ *
+ * Returns a pointer into the FDT on success, NULL on failure.
+ */
+static const char *overlay_get_target_path(const void *fdt, const void *fdto,
+                                           int fragment)
+{
+    const char *path, *fragment_name;
+    int fixups_off, symbols_off, property;
+    int fragment_name_len;
+
+    /* Try target-path first (string-based targeting) */
+    path = fdt_getprop(fdto, fragment, "target-path", NULL);
+    if ( path )
+        return path;
+
+    /* Phandle-based target: resolve via __fixups__ and __symbols__ */
+    fixups_off = fdt_path_offset(fdto, "/__fixups__");
+    if ( fixups_off < 0 )
+        return NULL;
+
+    symbols_off = fdt_path_offset(fdt, "/__symbols__");
+    if ( symbols_off < 0 )
+        return NULL;
+
+    fragment_name = fdt_get_name(fdto, fragment, &fragment_name_len);
+    if ( !fragment_name )
+        return NULL;
+
+    fdt_for_each_property_offset(property, fdto, fixups_off)
+    {
+        const char *val, *label, *p;
+        int val_len;
+
+        val = fdt_getprop_by_offset(fdto, property, &label, &val_len);
+        if ( !val )
+            continue;
+
+        /* Match entries of the form "/<fragment_name>:target:0" */
+        for ( p = val; p < (val + val_len); p += (strlen(p) + 1) )
+            if ( p[0] == '/' &&
+                 !strncmp(p + 1, fragment_name, fragment_name_len) &&
+                 !strcmp(p + 1 + fragment_name_len, ":target:0") )
+                return fdt_getprop(fdt, symbols_off, label, NULL);
+    }
+
+    return NULL;
+}
+
 /*
  * overlay_get_nodes_info gets full name with path for all the nodes which
  * are in one level of __overlay__ tag. This is useful when checking node for
@@ -298,7 +355,6 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
 
     fdt_for_each_subnode(fragment, fdto, 0)
     {
-        int target;
         int overlay;
         int subnode;
         const char *target_path;
@@ -307,11 +363,8 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
         if ( overlay < 0 )
             continue;
 
-        target = fdt_overlay_target_offset(device_tree_flattened, fdto,
-                                           fragment, &target_path);
-        if ( target < 0 )
-            return target;
-
+        target_path = overlay_get_target_path(device_tree_flattened, fdto,
+                                              fragment);
         if ( target_path == NULL )
             return -EINVAL;
 
-- 
2.43.0


