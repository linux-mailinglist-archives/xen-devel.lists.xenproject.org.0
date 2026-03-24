Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNnDMqX/wWkjYwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B44D301764
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260003.1553352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5b-0005zO-6c; Tue, 24 Mar 2026 03:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260003.1553352; Tue, 24 Mar 2026 03:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5b-0005xI-2T; Tue, 24 Mar 2026 03:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1260003;
 Tue, 24 Mar 2026 03:05:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w4s5Y-0005rx-Tj
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 03:05:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4s5W-0073ow-O2
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 04:05:52 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c1ff6b-bab6-0a2a0a5309dd-0a2a4504edec-36
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:05:51 +0100
Received: from [52.101.53.48]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c1ff8e-c823-0a2a45040019-346535307b5b-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:05:51 +0100
Received: from CH5P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::22)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 03:05:47 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::5c) by CH5P223CA0021.outlook.office365.com
 (2603:10b6:610:1f3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 03:05:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 03:05:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 23 Mar
 2026 22:05:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Mar
 2026 22:05:45 -0500
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 23
 Mar 2026 22:05:44 -0500
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
 b=fBWYCrztVbacYgALLFzAoFrtSd7diFq16O9xyAjjysgqj3aGwVvSVI1OuCp/V7bmcl1QTXYtuWnbuO1AGP44jQi4WZwnstimzC070LB7C8H4Cohe/62lURpKQdNvuLl77335JIjVWCk6/hRrl2T/LiSxRXVl+/PjeVlYqKVaEHoXZqunfa/r5qMH7IEdRO89MtvGZgOYynOvArtLGxZQCr0eo1x1EKDAU5DqKRDyAuBa8vcHufzjYSYlBeprntvtzHHChNQjhpyWnB4yWzvtAXU9FXeUTYbwW6mtsP3rm8ZW/lVVLGEVjFNBxzIFbCU/3L81bz8LIW2QYmhjAxLP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSf/Y6hBGzyirIB8wL+Tv2JZc0KdiMNKBUOutJwXS6A=;
 b=JrbzySqIyWd1xL0qglXI3FD9FJJMq8FsYBequF9FzfUzCmQ7hgHByw4PaMftxNpwn66qFZPh2LTPj7N9wCfLXTSlZlHbsBekY5JDDavuurb/jQDbX2BfTwNanUii3MI90AYgAE6TuiFFdqHpFAa+5Utc7+Dk6PZaQUiJDaalqwN3aiTenhCuWqfhtj7VZcZBASTQOFEZPyEnN1Bh93a2JU/tiiR7KSZ1K7LENXeq2PUk0+OG1SvubEJLXoaTsCWsYdKUwxHma8EL6o3KQFA7PK4gvBZskrkbFjKUG19a5ffHniQ/gG7cmq//BrAYLKSJ0/NAypMtddo0SDPFrKahdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSf/Y6hBGzyirIB8wL+Tv2JZc0KdiMNKBUOutJwXS6A=;
 b=17MujKDVT6B7UfYc/w/K4pMI4uKWwZsYOoXbEcqfzEfyEjMd8CR06zGZCf8FZzX6hAZ8io/QUTCFtKCCMSr3PgDCWiQVHCyX0arleqeGpaB6vttzmm2vYqc6xz4W8unmZh6rQ2lpRk5spt4jMoFQY70Ou42IwbyMkQF6o/LPZDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/4] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Mon, 23 Mar 2026 23:05:01 -0400
Message-ID: <20260324030513.700217-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324030513.700217-1-stewart.hildebrand@amd.com>
References: <20260324030513.700217-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3906ae-c441-4881-a403-08de89523e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3lnNFZnNczC6zi1wJttteuNOPSdKpTuSe6flfxYZMeVDb+5oVVZfkg9KkWO84TW83H56gXFkVS2PPYAlMDfF7KpVvhHhDMYO4edlmTqYpPgvOrzCLl+d/wQwF/7ivHXquIXiz5nUmnjeHY3SIHjwXpTtT/3KljQmdg7R2VfeeEm0SZpda2CzsFb8kZNAj2M7CspnMchSeUPbaA9kUmkEZD42O+o9Gn7oYvq0sw+DCdwE7OBzg+qZxI2CM9y6fTEHSwLn/1jA+dwFAmUTgY7xIYy4tbTchW+xtwB/letkap+3jWdUnpL+P0BX62sjEA9/L7ab0HZMzHMCFgCWWlcMg5RPYdVRMCUluZBSsqaPLCtGMnpRkuuj6ZuBqfcheMb4BfNkSduBAH7JuXzIM9KBAI6hSvwwb8Nf+Kp5KDd4MZHYWoTPQMUbI7jtahQt0jFzJGHdZ1OtCyEFU7YHX9Tdmm6eCWkUdOlvwQZ1d915yXbRXdPgbvb1mG/T05GdfcUrbrfblezO0ELG1YHf4SzPgh/NL6jyJqKgKehDxNSfKavu0a8LN+/IkytTXv6JdldlU79hT+ONjofpCGJAiGscNz7VmC7iFNyrkf3XHkLryXvD90JTbqT6rIL1KaWS+Lo2qbtKP4h3HIX6F4HDQpJJHSCSI94Y72fX/YcpaqdcSwmbyi0A1I0cYlCytjWIEhaLxpgoj5DIktZh5lJK0mcfIVQmp86ZDcSUyjlnmdVF2MusFwVYztmlVeatkRiOIxgLd2B0kZN8KV+DH60dj8bfAw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1622F/nCeCDomiFjtGhBVgyHtrx1HBTfXQBEVyW/doLbGMNv/hwpGpOHJGgwGOcAOK6qOSvQlczNvuHTh7NZzgwNvIqsvGFBJm/CaJ4zfIQMg2d986w4TthFkgEY6cxTT2AAUSxDqcB57O8P/FBRdAd/ceCnE95g0RHNds/iTW6l8eH4XocyXUQNIyT7M0yCn56HbxIvi1zDEzFnxMjrTX533Km/MroOSeVUcN+yhhyUJomRMHudRQ+3CUpkJsQnAnh43Y6Luxy2cJ03ylM8aMzZF/cfaiiHcWOWVA6nV+HERsJ58jZN5V4udF8aitEeu2PDVxWnS56g4CqKdz8U99OoHrLBwH7zT85zSKQW2bXmA7w6CeCrxOtFZLPdhhu7FPBwtuI+Dm7cdQYX8YJ2uRkbUDQ7uH6y3nLQF8PMzXhA2yrYMbtauJqLWpAMp+LS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:05:45.9169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3906ae-c441-4881-a403-08de89523e5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989
X-purgate-ID: tlsNG-ebf023/1774321551-B249D9D1-6C2F1D6C/0/0
X-purgate-type: clean
X-purgate-size: 3882
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 1B44D301764
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
firmware initializes a 32-bit BAR to a bad address, Linux may try to
write a new address to the 32-bit BAR without disabling memory decoding.
Since Xen refuses such writes, the BAR (and thus PCI device) will be
non-functional.

Allow the hardware domain to issue 32-bit BAR writes with memory
decoding enabled. This increases the compatibility of PVH dom0 with more
hardware.

Note that Linux aims at disabling memory decoding before writing 64-bit
BARs. Continue to refuse 64-bit BAR writes in Xen while those BARs are
mapped for now to avoid mapping half-updated BARs in p2m.

Increase number of unmap/map slots to 2.

Resolves: https://gitlab.com/xen-project/xen/-/issues/197
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* minor tweaks for fixed number of map/unmap slots

v1->v2:
* rework on top of queued BAR map/unmap operation machinery

RFC->v1:
* keep memory decoding enabled in hardware
* allow write while memory decoding is enabled for 32-bit BARs only
* rework BAR mapping machinery to support unmap-then-map operation
---
 xen/drivers/vpci/header.c | 33 ++++++++++++++++++++++++---------
 xen/include/xen/vpci.h    |  2 +-
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 9856840c3c87..2df992468383 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -605,6 +605,8 @@ static void cf_check bar_write(
 {
     struct vpci_bar *bar = data;
     bool hi = false;
+    uint16_t cmd = 0;
+    unsigned int map_slot = 0;
 
     ASSERT(is_hardware_domain(pdev->domain));
 
@@ -618,19 +620,29 @@ static void cf_check bar_write(
         val &= PCI_BASE_ADDRESS_MEM_MASK;
 
     /*
-     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
-     * writes as long as the BAR is not mapped into the p2m.
+     * Allow 64-bit BAR writes only when the BAR is not mapped in p2m. Always
+     * allow 32-bit BAR writes.
      */
     if ( bar->enabled )
     {
-        /* If the value written is the current one avoid printing a warning. */
-        if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
-            gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %zu write while mapped\n",
-                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
-        return;
-    }
+        if ( bar->type == VPCI_BAR_MEM32 )
+        {
+            if ( val == bar->addr )
+                return;
 
+            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+            modify_bars(pdev, cmd, false, false, map_slot++);
+        }
+        else
+        {
+            /* If the value written is the same avoid printing a warning. */
+            if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
+                gprintk(XENLOG_WARNING,
+                        "%pp: ignored BAR %zu write while mapped\n",
+                        &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+            return;
+        }
+    }
 
     /*
      * Update the cached address, so that when memory decoding is enabled
@@ -650,6 +662,9 @@ static void cf_check bar_write(
     }
 
     pci_conf_write32(pdev->sbdf, reg, val);
+
+    if ( bar->enabled )
+        modify_bars(pdev, cmd, false, true, map_slot++);
 }
 
 static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index a6f8cb67dcac..a458b722cea6 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -168,7 +168,7 @@ struct vpci_vcpu {
         bool rom_only : 1;
         bool map : 1;
         bool pending : 1;
-    } task[1];
+    } task[2];
 };
 
 void vpci_dump_msi(void);
-- 
2.53.0


