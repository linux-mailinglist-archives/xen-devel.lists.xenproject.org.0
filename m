Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFXIF7lp8GkOTQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:03:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE747F8A8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295431.1572074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdOy-0003rF-0o; Tue, 28 Apr 2026 08:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295431.1572074; Tue, 28 Apr 2026 08:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdOx-0003p2-To; Tue, 28 Apr 2026 08:02:39 +0000
Received: by outflank-mailman (input) for mailman id 1295431;
 Tue, 28 Apr 2026 08:02:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wHdOv-0003ow-G0
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 08:02:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHdOu-007slm-AJ
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:02:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f06995-5cb7-0a2a0a5109dd-0a2a45068e8c-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:02:35 +0200
Received: from [52.101.62.2]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f06999-7371-0a2a45060019-34653e026b7b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:02:35 +0200
Received: from SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 08:02:28 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::1a) by SJ0PR03CA0194.outlook.office365.com
 (2603:10b6:a03:2ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:02:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:02:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 03:02:27 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Tue, 28 Apr 2026 03:02:26 -0500
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
 b=hdEFm03JmKaY5iMBixm4r1XSczqkfn7ULIKuMQTK4kJ7F8qtqguFeF/kJdtIVwzeaXz7OLXmluS+i51lPVBuiMCaguie88shpsEuKjE3R5kdJz7FI8yKJC77/in3lkSullkbRxfxA877Nc257qU2JB/g7FcRe4eOPilaXk2xnE+dMLs2jQoOxW20s/3VJIT46hW1PUMgfH+B7ViEyiyBxOYWfqtH+o7GIo2nGhxZ4d47lUpl5jZqcyOyOyWesG02GxWlvsIFj6RZNZOvPD/+Onz3/+FKxZmJX1eLgC79TkTT1zVgMireWJ/1n6AynNUFoOMaIPXAa/qXLRsQ+ZLk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTbjdITFswwHetwzK/2Z6VFPRtN6WJIT0zKNPrMezKM=;
 b=hJWPJP+91s6qgKkh5Z62IQP4QKZ61VH4otiM6C3mWsZlFykFV09lOCQ6cgxCSJoOCGnR+Ozg54na+G7WAmJFTNg7/oStsSPiKB08K3Qlzl21bCl7TsLs5cCvx1x3KWPs5rf/mXQ5Nh1wv7IyBcq+XHmpNAME+QqQUvhklepTMLWuzFA2nwHXAu5LhW/LZCZbDrayOJ+fgZvFSsjtAfDBsp1JyDtTT0zM1a1WN2M2HJaXLQKU76or2KVBwDtUziWdqA0pGYtwVAC4nTBzbT7iNyPlXcTUPp6PNkGCF5xX98l+f8tau/CFm5rdBIxViHVQFix+wVslZs3tkze/q/s12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTbjdITFswwHetwzK/2Z6VFPRtN6WJIT0zKNPrMezKM=;
 b=H3WnM2QQwYMfnqSU+YGN5fJ2zneHH73PWUUtVpWRfIDUVG7Nm7fdvN/Ek+A177tS5QZC9aG0z3Znv5uGr8An3x6vC12bpEEiue35l3lta9pRJsvas7hSyD1bF4jf7CEi+wUoJvct5hxjC+XF8VvfGVVSMVAF6eQNEKHqzx3f68U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v2] xen/dt-overlay: support phandle-based targeting in overlay_get_nodes_info
Date: Tue, 28 Apr 2026 10:02:18 +0200
Message-ID: <20260428080218.19371-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c31b70e-15a4-47c1-b5af-08dea4fc7d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	g9NMIZZEWmc32O0VujoxJOqMVJDClbwQcyiOxTKnoOqtRQgNJGOU77VEQk7NTmIDiGFxTiV5CVVJ5bNWQ1JlRx7hGvNGT83zMNTs47M7MU/TPh3d+e/XVK6ZfTW69rDHCw3e0DLLnoJ3gFe3uA1aFxK/6hs7jT6YfvatFnQH/2lndQnlJsjijzKnX3gRALEh2IMgkTkLs5cY3S8xQQd9SHhKYyHir1WbqBZLLFRoJPLjnJU3VWBqPYm+7lVPH6W4uWnkQ7GazVy4oNfOtfey3+ZTyuSJZhvJ3DDBMHEW66Nylwoe9YEOwnhPPl3UkyDJtJzEtQfpJdrdUGOqomNKJ+8s9Ye1DD9f0FAgr3g2+wGDGVUZ360npco0Wqj+LDfR2Bis2uNuEzEZY0UByJE9u1YKtu89/h86sC69Tg+bbBtqb7YjAiCprO6ovYPp/UI46f17mwnVOH+aAJvCqulAgBOqqQ0LgOWrAWEfGhaI4zlkHgq1gatoPZG3oWqVPWHOswqzezsR4A6K/bY+d3LrxGA/NXk6zWdZVF6g/SAAbcbc9oEoU6lmeLdH/IPUqvNBbT8DuGJgMkJ4oejBHgOxAf4pMoo3E4XyyAdlO9e/1kcLA/qNJnnL9Ig2BsXwTWKWqB49Jke2F5smK5UkBoREdxdAjBk0xFxzxn+740WyoxpgaA0lgzH1eZPaJMkSD80eqxP+ytpf+g9XN9ahNIQIDRPBEARLbDgpmzcP30H/0Pv3cYBxEmcgTrPW0TdNIqS8nW1DjqtzOCS5sN9XkSjt1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WTWjDuDybX2WT+LrV4ZQHahcgWOR3rt9LMuUyQQmQnffC2b8dHvqKCYGdg8/HPlhsz91nJrEuTQm/XbIFsFfr/VAA9+AiTRdjgbX7s/uQV26kiUmvbU5GRxA5CP6KACAuN41ATffV0w/QA6Sld46l05RCbW/ySss7tg57Ro+3Et1GOBMfrCboOMNnhSoKTKgUiAFs46Yw7AtAv690DNaeODqAatE2Eu8k5HdY3WZEe+IT1qdpIafrV1CxWMuTiuTxCHqKtRC9iJSBrY6PEFGSypHgjS6d3GgtRpQEaIqRUx6+NQ8IR4woi3spYQKZwVssDDRJhyFsDt2BPNbmSvN2fk9bPqNEO0jNBMcHhrUktNxB4E3Cb6HOYpkFgRlKh8haC5HlpWi+3mceqH5R9gOGMuEEHuB6/3SbarkjQH5iw3+67r6vVNhXDuPkwqWoKYJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:02:27.7774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c31b70e-15a4-47c1-b5af-08dea4fc7d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649
X-purgate-ID: tlsNG-16d1c6/1777363355-52576D75-10E66E4A/0/0
X-purgate-type: clean
X-purgate-size: 6160
X-Rspamd-Queue-Id: DACE747F8A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.68 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:luca.fancellu@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[sstabellini.kernel.org:query timed out];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:email,amd.com:dkim,amd.com:mid]

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

Libfdt fdt_for_each_property_offset() violates MISRA R20.7. Despite
libfdt being excluded from the analysis, this causes ECLAIR scan to
report a regression because the violation introduced by a macro is
reported at the call site. Deviate R20.7 for libfdt.h.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
In my pre-push testing I realized ECLAIR allcode reported a violation related to
the use of fdt_for_each_property_offset. Libfdt is excluded from analysis but
this does not apply to e.g. macros used in other places.

Changes in v2:
 - strip out from series that is ready to be committed
 - deviate 20.7 for libfdt.h. Discussed with Nicole.

https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2484326830
---
 .../eclair_analysis/ECLAIR/deviations.ecl     |  1 +
 xen/common/device-tree/dt-overlay.c           | 65 +++++++++++++++++--
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 30c323906924..5f0b73062474 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -631,6 +631,7 @@ not in scope for compliance are allowed, as that is imported code."
 -file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
 -config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
 -config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(file(acpi_cpu_idle)))"}
+-config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(any_exp(file(^xen/include/xen/libfdt/libfdt.h$))))"}
 -doc_end
 
 -doc_begin="To avoid compromising readability, the macros alternative_(v)?call[0-9] are allowed
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index f203e189f5ff..fd171333c6d7 100644
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
+        if ( !val || !val_len || (val[val_len - 1] != '\0') )
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


