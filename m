Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKLoALwF1Gk9pwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:13:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA2B3A684B
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274367.1560526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pNQ-0000xg-3c; Mon, 06 Apr 2026 19:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274367.1560526; Mon, 06 Apr 2026 19:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pNP-0000v3-W3; Mon, 06 Apr 2026 19:12:47 +0000
Received: by outflank-mailman (input) for mailman id 1274367;
 Mon, 06 Apr 2026 19:12:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w9pNO-0000th-M9
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 19:12:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9pNO-00DVi8-2C
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 21:12:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d40570-bab6-0a2a0a5309dd-0a2a450acf26-30
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:45 +0200
Received: from [40.107.208.41]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d405ac-ee98-0a2a450a0019-286bd0296cf3-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:45 +0200
Received: from DS7PR03CA0059.namprd03.prod.outlook.com (2603:10b6:5:3b5::34)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Mon, 6 Apr
 2026 19:12:38 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::ca) by DS7PR03CA0059.outlook.office365.com
 (2603:10b6:5:3b5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 19:12:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 19:12:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 6 Apr
 2026 14:12:37 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Apr
 2026 14:12:37 -0500
Received: from ubuntu (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 6 Apr
 2026 14:12:37 -0500
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
 b=pHVJvIgrD2pktkmpYzJn94ygxj7InypvB0yigxcj6ZeTXuF3h9Ap8ofGOyqbZwsVb9Tn87FUToRQAdEBSj6yPLRBB+BaR2+yG1icjfCfp8+L8ySRxRIwx6+YxkLR7tdO/nt+bHh3yfk6M98wLWiJErLhBokqfpn01yAux1WQmFVrOSzKUWeJW+D5n4qei2+Hx2rSSTuZuRPuwz4kSYvJGTTs/cUvsW8ScrD6AguFOWmocKL1/mf7zbW8WVtA2u0EOToB5jUcnMbuyKaiTmJtntiWim/vSKOlrvJOdgfNWJFYgx296V0chBRE8lFM2mtTZ/ZI49XnNMbSMc1quZLozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5KAxsB5+rjJP69DJz9pK/1jNINXHR3glsZici/9duI=;
 b=dInQYgcRYjFjzUV75YCdkw2jeIIiatXIHYow8kBFUdDBzWFmUzsuDxLwtnpX32pyzh1NaqQft4i0glPvdTUfL/UghXKJSqiCHqv6Yp0dR4xHXNE8ijBeYZ2F8h7JOsXLu0m7Rc4j1PMj/EihOYdvZ5DrxEf+hq1cCfTKRnvfQg5mqjzXvgu7JXvmYBYgyEDciMHgtD/5+R2Cc0b+9QmDo7wsk+LzR89YFm6C6i6cDK1Vf5jA6rkQuWytkl9MnJnt6u1JQacn4QN5bBd3nIlWAGCkk24SqFy48kTNqCmq/GqIFp5z6b8k/iZJW7suppXnXEwX40Ft0/XCJ0i29R0x6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5KAxsB5+rjJP69DJz9pK/1jNINXHR3glsZici/9duI=;
 b=UqtzRE6Tf0g20EzKpj2JVg5LJrncHAFtXmi9wPmXlS1giHxlvohP7fwmp3lXNy9sLKu+pAJRlfIqeQu9xrOhrzWl6F2D0Zxk32Ph2WPXo/MlGiZbbqcCw8oohqVBl/T01eATMWE/gV0M8ra8BCzV3GGFTB4pikcjSgZ/66T8Lxg=
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
Subject: [PATCH v4 4/4] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Mon, 6 Apr 2026 15:11:58 -0400
Message-ID: <20260406191203.97662-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406191203.97662-1-stewart.hildebrand@amd.com>
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 5348181e-dcf2-40d8-6071-08de941077da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G3MX5L2g5IlopSPWZPkdgtwUizEuoqM+dbvxxoSRkBEqa0en1bxNeriAgZ6MJPizkLiMWk7ejZsYjfFvY+y/bSia1rjIMmoqOhavzgZ9BZ6H28siPl9U+IlY4iWUKTeKhpFZ0Mq7P+Nd4GZLWG3Sn8h5tCdErIwiAFqYWcCwbkhnCd/xQP5tDSlR3xbdPWnBqXNaVppfqEoEbKGyvzv0Z8VU60kT6N/hq6gGlxW9EAUD5ruz6N0mratXo/+bM5SJtUMsAjIm2BJW0rSwpT3IlPXUrPBHAEHT1eq5ajUsNYRdc3jx/FQgedF3MRVjQ/0z2h7SlGirXj2wTwLSJ6/BV4nlR/Ff6s3gr98nvH8LRZdOHDk/NCzluRTJjEOYc1nSpZoORT03t6x7cBR3GXUrSaMmTuL491M2sgaeKcptchDL0FNuj6xBWsfR1lWj2oxCANnZSms3tKipHfaXwsbH4pchAzGsh8LZmlFkKfLbRfDAfxO9Jdk2WsRmCPS0pUlWciiqN6US8yzvvHqp1jybJiEXO7e4MyPBIvw5W6do7OGqK102e517riGMR7rWkvcITSGtIFJFCeNE/oCRPJhYhKRDuElNZAKf/s4MyWd1jjW001XEv0cch6XV8User+RyF/VW9V326rBFGt4j24m7y+wCoSbnn642jpbGQiRy+y9R4tM7ejEGaPR/uE6hKmpi6VDcjzUYkFjt+LmZ939FOMlW3ijFJdat99Q/BJ34qs9+adUSO747J0cG1IeTAkLGSpaMODyaEp7efyHeQwRhHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uBV75Vm1+YeDJLyxJV5iOWAtxOZTFtYmwYCI8VgLM4g+uwdf6PE0s5As3LyoFNcDo2HPHE0B1Caa07unfbLNPre1wuZaF+SuLhSyaYizDHyk9WVbYRVtLZSj6VpBeM8XdN3zyk5NLzPrHBXsI/PSPGBptxusIodjuYah0ZBoLVFyrgVL3BW61zWDSHcJDAoQcVLNbbUPnep3AtOtxWqjn9Z2mQQ6DzjJ6SFo88nZh/pie/BhFLJEAgnSlD9WIR84jopCTSnBoGhSBgEjeYF+W+vq7OGW8WD8ory4plQMYUMSOxXPGIq4qdV9UVgYR0nrdCpqkl5tljBQuKZ2D5dOpxMKZZivJ3STHYaCTMFM0QJqW3PrgtbbC6FWmRZ9r1GWQLItvtBjn4xf4L+xkXdMDO+wgpPebFnNfQ9tDIVcyKC7GjdxvW1MZNoPTog7Q/lA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 19:12:38.3570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5348181e-dcf2-40d8-6071-08de941077da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
X-purgate-ID: tlsNG-4011c0/1775502765-0FB450B1-AF63A496/0/0
X-purgate-type: clean
X-purgate-size: 3444
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 5AA2B3A684B
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

Resolves: https://gitlab.com/xen-project/xen/-/issues/197
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* rebase on dynamically allocated map queue

v2->v3:
* minor tweaks for fixed number of map/unmap slots

v1->v2:
* rework on top of queued BAR map/unmap operation machinery

RFC->v1:
* keep memory decoding enabled in hardware
* allow write while memory decoding is enabled for 32-bit BARs only
* rework BAR mapping machinery to support unmap-then-map operation
---
 xen/drivers/vpci/header.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 20fe380552f4..dc4f585b4e40 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -670,6 +670,7 @@ static void cf_check bar_write(
 {
     struct vpci_bar *bar = data;
     bool hi = false;
+    uint16_t cmd = 0;
 
     ASSERT(is_hardware_domain(pdev->domain));
 
@@ -683,19 +684,29 @@ static void cf_check bar_write(
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
+            modify_bars(pdev, cmd, false, false);
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
@@ -715,6 +726,9 @@ static void cf_check bar_write(
     }
 
     pci_conf_write32(pdev->sbdf, reg, val);
+
+    if ( bar->enabled )
+        modify_bars(pdev, cmd, false, true);
 }
 
 static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
-- 
2.53.0


