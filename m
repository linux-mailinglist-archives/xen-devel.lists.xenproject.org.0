Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OL7C74F1Gk9pwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:13:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C03A6860
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274363.1560517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pNK-0000bs-LE; Mon, 06 Apr 2026 19:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274363.1560517; Mon, 06 Apr 2026 19:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pNK-0000ZG-Hd; Mon, 06 Apr 2026 19:12:42 +0000
Received: by outflank-mailman (input) for mailman id 1274363;
 Mon, 06 Apr 2026 19:12:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w9pNJ-0000Yf-TC
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 19:12:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9pNJ-00GVO4-9E
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 21:12:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d40584-5cb7-0a2a0a5109dd-0a2a450c8bf6-36
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:40 +0200
Received: from [52.101.48.17]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d405a7-f40c-0a2a450c0019-34653011c6d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:40 +0200
Received: from DS7P220CA0084.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::14) by
 DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Mon, 6 Apr 2026 19:12:31 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:259:cafe::70) by DS7P220CA0084.outlook.office365.com
 (2603:10b6:8:259::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 19:12:40 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 19:12:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 6 Apr
 2026 14:12:31 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Apr
 2026 14:12:30 -0500
Received: from ubuntu (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 6 Apr
 2026 14:12:30 -0500
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
 b=VjhhFJjbsCbDSZBSlFohGcViA83znlxt0aBeFGhsVJRFSJwrAGG6zJ+EDEDA2/N6xJMrGCUsZqLlaMeNMX4ApERKHRKgkHbG/AMGzmt8TIkQVXwUhQynjFz2HAfMjt5V294tstGwMTVYCnwfXbRkxMxp+zIdqnkMujW53OCKQBwawJWjVQU1TbJldyfIY+nxIIdM+Oa9Xb1mtq+1c1GFCOK0zryEEmyvc2yu/BdUoT3buZ0SN0If7JF0VrWb4JT6otwT1pNFRX5L9E74BLuCkZsg+iuL0i+CuFrvLcarzFG3u/aNlPMkBCUq5UNW9/rVRlSU3G5s0BTQJPL+VeSbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjkD8mh/45ccq+3hyulqMZKE75dA55AV1KAofnrWsA=;
 b=QGO9kFTVQsnRqGpF90zB8hpfzmh7uFr7VXWjY2njLRWf+rTeVZKlBjheZEBYhgqd9ynuqUb+3BkN2ZHpWU16cIBZ+y3ktaZGgAL9Kt2OKm2LNhMmOfLT1uiIiKwyIcLOuLTRfXnEOC6fGgyDZ+sclWU5so2/lggO0VzKzqT557HVwcirgR+z9qe8aVhofy+wA9Zn+vewrbeieCpmFuxKgdEHgcf4hAWkpZlsNq8vC6WJN2jRrm28SEOLGuByzJ9MMKA6AHgBWwu8DGzSHozE4YnYbEIo215DX7AglzhPZhwHXqQx+7K4m8HQS69fyga11uyysyGibTSV+3Ndyd5Rng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHjkD8mh/45ccq+3hyulqMZKE75dA55AV1KAofnrWsA=;
 b=kc+gQYR5IHjcUztCnek9K0AG97VfccnCAum2dbLupGioyy++7zgW0L27NxGzhGytdNtM47QG/berO6Qg0stYj9OH4/UZDkmHNyNousaYqr+CpBmc0uKNaphYsISq1nvYV7u7TA0mIaQETam5+fJLVuWdbaU7cbFh1sSdyxYZrNA=
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
Subject: [PATCH v4 3/4] vpci: allow BAR map/unmap without affecting memory decoding bit
Date: Mon, 6 Apr 2026 15:11:57 -0400
Message-ID: <20260406191203.97662-4-stewart.hildebrand@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DS0PR12MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca8c865-67e4-4bcf-4710-08de941073d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	enR8OMFliM5I6OmSnbwo7PrqfYxN+XH/iTsQGD/qU/5xUxTyprSd6SWqjwNmlCMLqDnay3sb1xc+fgcd4tNOppbtf2Y5UojJyveDOCpH+y9EmnSAYlGmHkPxXwL/wRB/6bJGvkt0aHAqNRWm4xx9MJ2gJNPu/kar494zcuxw8bJ2aV7t6IrrTzVokP46br07aPIgjdHV0ekNbr6NnwVWhOd/e1+LwntYxK6tQcoy51m2lxwRTxaL+qmVpQmQVVdfPmmezltmIJOJbyYXjhgx1NZQ6i5EipMVk36EMTvrIy0tD5OEO6jaPWrybJnw3AnAWjithjsaMhYdEmeaEkrouia/HR+dQC8DKVT17OmWukGR4jl3RnQ4qrYKqZXZaHutCvL4O/pDog0JMWtSey2C+p0oJgNI93shq8+cG09BjFG+jjSt7KSGsuuUeus5wgb/CrjlfWDZemKGIoHUmeXLLW5bEpx/s5kq/T1LPKi3qRhRebZxzqccr9PK2BdeBTl7Zr8sc54wsvLtLFd07msFM1gWwqND7/yacVljhoBSrz1CW+A5VJ0qp5ZuwvO8rGRuMXOLLOW52w8PQnJWDuHDi6ouFjd7GVZw7ufDc3/YG4eC6JKulL46TKrq64/Swe59P6nkN11YWmFTpJhhRHBjBAfkNxD1chmnITLnGdPF+8a8Xb5zrYwQklhuYh6MEqdGzTs4AwmZQCjtLPoarhaR3oah3W/mAyW0uv8bKoyKNktgrD8YJSbEArVnefVIR4S36g3Mfi/P5cgWF++hMaPAvw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	90fzKIoC6c4BCDcstdgw5brz1o+3t0pbXfWQNlcRzbsUkAnz1Qd3ilhi2lJvOC+EUbXE9Kkd8Gl6WtudNYnvHI079c+O157gwCQsxjMqtHctAmxZVVR06HTD9i9EFi+Qy6mpxcUcBG4edpzveXVnPP0F0H+r7VOtsHATAFIuVTU+V+7PiZF+TMXgqop38xj6v/XzyUvmP7KawaGahCKQXdmEWkLTiDDoz8t89UDVkqILcebSokPsk+wt4WtUtNqkn2yUQgR5Pxab4cuPpN2C3hullES9FiKYR+So03pp4fFlJjxGGzYQ/5GUasWFp3IsHfVHIOgLXlZcALJzLTB9Nlri8pzjfecm24RC8CG4lLddD/9rQtI0ve2vzCaeOpAj8gBJ9aAaGq09xT0+EhzFjAG1+nGOtEd/uPRwGl8vVy7DHesFHfeXe3uy2u1DetrG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 19:12:31.5941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca8c865-67e4-4bcf-4710-08de941073d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630
X-purgate-ID: tlsNG-d25034/1775502760-81F52A3D-4CA2EAAD/0/0
X-purgate-type: clean
X-purgate-size: 7003
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: B56C03A6860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce 'bool map' and allow invoking modify_bars() without changing
the memory decoding bit. This will allow hardware domain to reposition
BARs without affecting the memory decoding bit.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This also lays some groundwork to allow domUs to toggle the guest view
without affecting hardware, a step toward addressing the FIXME in [1].

[1] https://lore.kernel.org/xen-devel/20250814160358.95543-4-roger.pau@citrix.com/

v3->v4:
* rebase on dynamically allocated map queue

v2->v3:
* use bool
* switch to task->map in more places

v1->v2:
* new patch
---
 xen/drivers/vpci/header.c | 43 +++++++++++++++++++++------------------
 xen/include/xen/vpci.h    |  1 +
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 146915e28c50..20fe380552f4 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -117,11 +117,12 @@ static int cf_check map_range(
  * BAR's enable bit has changed with the memory decoding bit already enabled.
  * If rom_only is not set then it's the memory decoding bit that changed.
  */
-static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
-                            bool rom_only)
+static void modify_decoding(const struct pci_dev *pdev,
+                            struct vpci_map_task *task)
 {
     struct vpci_header *header = &pdev->vpci->header;
-    bool map = cmd & PCI_COMMAND_MEMORY;
+    bool rom_only = task->rom_only;
+    bool map = task->map;
     unsigned int i;
 
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
@@ -168,7 +169,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
     if ( !rom_only )
     {
-        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, task->cmd);
         header->bars_mapped = map;
     }
     else
@@ -188,7 +189,7 @@ static int vpci_process_map_task(const struct pci_dev *pdev,
         struct rangeset *mem = bar->mem;
         struct map_data data = {
             .d = pdev->domain,
-            .map = task->cmd & PCI_COMMAND_MEMORY,
+            .map = task->map,
             .bar = bar,
         };
         int rc;
@@ -203,9 +204,11 @@ static int vpci_process_map_task(const struct pci_dev *pdev,
 
         if ( rc )
         {
-            spin_lock(&pdev->vpci->lock);
             /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(pdev, task->cmd & ~PCI_COMMAND_MEMORY, false);
+            task->cmd &= ~PCI_COMMAND_MEMORY;
+            task->map = false;
+            spin_lock(&pdev->vpci->lock);
+            modify_decoding(pdev, task);
             spin_unlock(&pdev->vpci->lock);
 
             if ( !is_hardware_domain(pdev->domain) )
@@ -216,7 +219,7 @@ static int vpci_process_map_task(const struct pci_dev *pdev,
     }
 
     spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, task->cmd, task->rom_only);
+    modify_decoding(pdev, task);
     spin_unlock(&pdev->vpci->lock);
 
     return 0;
@@ -328,13 +331,14 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         }
     }
     if ( !rc )
-        modify_decoding(pdev, task->cmd, false);
+        modify_decoding(pdev, task);
 
     return rc;
 }
 
 static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
-                                            uint16_t cmd, bool rom_only)
+                                            uint16_t cmd, bool rom_only,
+                                            bool map)
 {
     struct vpci_map_task *task;
     unsigned int i;
@@ -364,6 +368,7 @@ static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
 
     task->cmd = cmd;
     task->rom_only = rom_only;
+    task->map = map;
 
     return task;
 }
@@ -391,7 +396,8 @@ static void defer_map(const struct pci_dev *pdev, struct vpci_map_task *task)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only,
+                       bool map)
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct pci_dev *tmp;
@@ -403,7 +409,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
-    task = alloc_map_task(pdev, cmd, rom_only);
+    task = alloc_map_task(pdev, cmd, rom_only, map);
 
     if ( !task )
         return -ENOMEM;
@@ -602,7 +608,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * be called iff the memory decoding bit is enabled, thus the operation
          * will always be to establish mappings and process all the BARs.
          */
-        ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
+        ASSERT(map && !rom_only);
         rc = apply_map(pdev->domain, pdev, task);
         destroy_map_task(task);
         return rc;
@@ -646,7 +652,7 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything as-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
+        modify_bars(pdev, cmd, false, cmd & PCI_COMMAND_MEMORY);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -810,11 +816,8 @@ static void cf_check rom_write(
         header->rom_enabled = new_enabled;
         pci_conf_write32(pdev->sbdf, reg, val);
     }
-    /*
-     * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
-     * this fabricated command is never going to be written to the register.
-     */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
+    /* Note that the command value 0 will never be written to the register */
+    else if ( modify_bars(pdev, 0, true, new_enabled) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -1004,7 +1007,7 @@ int vpci_init_header(struct pci_dev *pdev)
             goto fail;
     }
 
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false, true) : 0;
 
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e34f7abe6da2..e6d40827a43a 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -164,6 +164,7 @@ struct vpci_map_task {
     } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
     uint16_t cmd;
     bool rom_only : 1;
+    bool map : 1;
 };
 
 struct vpci_vcpu {
-- 
2.53.0


