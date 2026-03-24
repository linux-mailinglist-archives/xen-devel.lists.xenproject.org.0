Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDsxB6f/wWkjYwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79BC301779
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260000.1553342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5V-0005d4-PR; Tue, 24 Mar 2026 03:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260000.1553342; Tue, 24 Mar 2026 03:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5V-0005aU-Jn; Tue, 24 Mar 2026 03:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1260000;
 Tue, 24 Mar 2026 03:05:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w4s5U-0005YF-IT
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 03:05:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4s5T-00Cb6d-UQ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 04:05:47 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c1ff63-e002-0a2a0a5209dd-0a2a4506e1a8-24
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:05:47 +0100
Received: from [40.93.195.12]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c1ff8a-3034-0a2a45060019-285dc30cc0db-4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:05:47 +0100
Received: from CH5P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::28)
 by SA5PPF06C91DA0C.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 03:05:41 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::c6) by CH5P220CA0022.outlook.office365.com
 (2603:10b6:610:1ef::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend
 Transport; Tue, 24 Mar 2026 03:05:39 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 03:05:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 22:05:38 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 20:05:38 -0700
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 23
 Mar 2026 22:05:37 -0500
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
 b=t5FgPdj1RCZ31jrBXunHvWq+IsX6FE8POSDNlmpQoMSLK+rBsFLTmPpp8AHc50Dc1sl0bnLhEH3JIJJpQwLUh22F1HhNTQhD83e+FPWyJq+tAUacTHKmY2UbSS3dxcPlOwcQYZS9AMFsG2gsXPCwoxPlSi/sEOF4/Qj2dlBzf66+r0GnZOezb/t8fANQWymoWfPWHg+F0yQlcCArzIPN36NJdMhBYOlacHbk0lHq9gM41Ud0+jWMMsOqCDsV+1tDw7kje/1MuQvXdNnF1GJ4lFYcvAnXeIsZ65CUpMF8rJ961FQMechYjP6tOZ2+vKDZXQj6sz5u7PMJm7zVWMd8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej96FSNwLfsqOcUf6P4qAFaoiP/qDKeFikSYtl3VuBk=;
 b=u8rL0qDuomB1wvvABsbZgpXkp8/UAmXLL0kEnH/JM0cTkwOuaDGdutIiU/VO1GwpwYpBvgKJ4MuewIpCv5/Yh8rMvv13atsYgfQzw2VgrXyd0KG7VavBu0xcacXC8jSYKRvTdRlO1iF8mZvu3L5zqA4kUMHWC4lKmM7mb0vf1XiStiitr9vdCkzQtiPUyhE/JUX3zc5u2EtHTACyW3k9myRAuxtx80AURvtNqp8/Hphuq/jVBhbT7R1c5OGYKpo4lihTDv1sBAP6jjJ8JlLn3hZQyZD+0On/WG8sUFaCmJoEfHkYq3D8b/nApuda3m6R12+FPkSZUAVZb6ILCSIm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej96FSNwLfsqOcUf6P4qAFaoiP/qDKeFikSYtl3VuBk=;
 b=eFkjgUuTkjkTvsfGfzjVt5cYEMSAyADaltllvmBym0o6okTfUhEo3VRZchwfWzm3b1F8Xx43ebBEy/S+Oo2c/qSuDAFsS+hERHk+SAutt0xzdy5Ep2yFpUV7ExCcHGvDdAiy6ms4XsrxHSyG88WR8q7LI64PHXzWz/EhOq/OFAo=
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
Subject: [PATCH v3 3/4] vpci: allow BAR map/unmap without affecting memory decoding bit
Date: Mon, 23 Mar 2026 23:05:00 -0400
Message-ID: <20260324030513.700217-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324030513.700217-1-stewart.hildebrand@amd.com>
References: <20260324030513.700217-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SA5PPF06C91DA0C:EE_
X-MS-Office365-Filtering-Correlation-Id: db9fd6d2-defe-412a-5cf2-08de89523aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yKpfiNJHlSCYobLhZn2wKSsmqk23qMUsex/MCUc7+nrS4pYRMlXbXIzK10u1Webv/9N4N78plKtz6fWxL1lmNNY7O0rQgwUKtE7txM050kV3CNDVRV9Ey4S6m9NZz/jKTgELF7nO8COzqE3+NGwM7f76WwS9vzfsjqHMZ2/zFt+s6iZtir8WRGFFSLletg8lUylaOtjPxdCSR+n+dSf85alREKdLV7/UsDdEDyJ6db92arFpSQ3V33K6ALWM/HmhnTkrPfcGzbQNiGCoFZbgHIZXv0ZBlQWDQo5D28Lr60hmvch4puLeNlPSO2kTSdTuyEig2D1+po7OWNZH3wRU0lTRjAyn8W2PNTgEoC52xyheg79BCqZeF0AVLVgQm5qf1sESPUEkv+eAsi4Q+24lhrDQNEclItNEE7MFSntJdyqyrHGoO35hh9kllv/DNNVCrwMEnXcBHB7QW7BwHZrQY0JORZ2FNFm/6LVQEG9acyn6gZBohY2pMMKkvEgsIljQwMiWcJc4MCzTWfUFkYSQEGb1A6PbnBPfgijoY+HBkVYC+aoT7YHd3HWmwQn2mmcJ0tjZYGlAlGyys7huZCPjwuYHmw/xucLGlAIwzyw0oetDa5o2r9Capshngta7eOq72UYyrFGSf5bgMSVA5UjpMTBoFi83Ie9iZrq0PDFcZzfNxs3moBuXzKZx1YQBNxvOtYL1G4EfXbiA5IKp58L6V35AxmANJHiM/INYHAPkQ5HcitUj452rtnnOCgynEsMDZf+OcMsgeLG/X4GDyyls7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k4DizxoBtvDgA23IZZy/k4IiEhNpUOJXdsWsM7uHXUh3QGY1ofFaRc4qqNaThT6FjUZRC0cXwN5K8A6tfYzFAJAb5RkpX3DM0mJh9OiTU+ozOY2I6h2BeUs09HKLB4RAK7QhxhJMJqyNKeDodytoV8GNYdVHy4h30xKjoNbIb+1pkQ2DHDJTux+XP5TZV9B42cKFj92UW7b31t75srqeiQXE3XgRlJbA+iuhCFyd8aiu9/InaQZS+xMDCSeFBHin4DD12TGIElxtREURJ/WSmbTioGlYKIRjSvN8utWnquDEzY0C+bHcITZmYiLzXoiI9zPMTTf/IOJjVtfnEvjOP7MYX5suWwnJZLDiq2Qb17ZDLqIu9y/Dkcwi/EKDUNxyqrcLphg8hKYtEsRl6q/mcQKCSJ7byFhBj8LF3aFecVx/WLSEpbsVNVrzKL7UGf5W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:05:40.1959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9fd6d2-defe-412a-5cf2-08de89523aef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF06C91DA0C
X-purgate-ID: tlsNG-16d1c6/1774321547-7A5911C2-FFC5F53C/0/0
X-purgate-type: clean
X-purgate-size: 6322
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: B79BC301779
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

v2->v3:
* use bool
* switch to task->map in more places

v1->v2:
* new patch
---
 xen/drivers/vpci/header.c | 38 ++++++++++++++++++++------------------
 xen/include/xen/vpci.h    |  1 +
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e57c00839841..9856840c3c87 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -116,11 +116,12 @@ static int cf_check map_range(
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
@@ -167,7 +168,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
     if ( !rom_only )
     {
-        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, task->cmd);
         header->bars_mapped = map;
     }
     else
@@ -190,7 +191,7 @@ static int vpci_process_map_task(const struct pci_dev *pdev,
         struct rangeset *mem = bar->mem;
         struct map_data data = {
             .d = pdev->domain,
-            .map = task->cmd & PCI_COMMAND_MEMORY,
+            .map = task->map,
             .bar = bar,
         };
         int rc;
@@ -205,9 +206,11 @@ static int vpci_process_map_task(const struct pci_dev *pdev,
 
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
 
             /* Clean all the rangesets */
@@ -225,7 +228,7 @@ static int vpci_process_map_task(const struct pci_dev *pdev,
     }
 
     spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, task->cmd, task->rom_only);
+    modify_decoding(pdev, task);
     spin_unlock(&pdev->vpci->lock);
 
     task->pending = false;
@@ -305,7 +308,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         }
     }
     if ( !rc )
-        modify_decoding(pdev, task->cmd, false);
+        modify_decoding(pdev, task);
 
     task->pending = false;
 
@@ -333,7 +336,7 @@ static void defer_map(const struct pci_dev *pdev)
 }
 
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only,
-                       unsigned int map_slot)
+                       bool map, unsigned int map_slot)
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct pci_dev *tmp;
@@ -534,6 +537,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only,
 
     task->cmd = cmd;
     task->rom_only = rom_only;
+    task->map = map;
     task->pending = true;
 
     if ( system_state < SYS_STATE_active )
@@ -546,7 +550,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only,
          * be called iff the memory decoding bit is enabled, thus the operation
          * will always be to establish mappings and process all the BARs.
          */
-        ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
+        ASSERT(map && !rom_only);
         return apply_map(pdev->domain, pdev, task);
     }
 
@@ -583,7 +587,7 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything as-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false, 0);
+        modify_bars(pdev, cmd, false, cmd & PCI_COMMAND_MEMORY, 0);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -747,11 +751,8 @@ static void cf_check rom_write(
         header->rom_enabled = new_enabled;
         pci_conf_write32(pdev->sbdf, reg, val);
     }
-    /*
-     * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
-     * this fabricated command is never going to be written to the register.
-     */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true, 0) )
+    /* Note that the command value 0 will never be written to the register */
+    else if ( modify_bars(pdev, 0, true, new_enabled, 0) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -941,7 +942,8 @@ int vpci_init_header(struct pci_dev *pdev)
             goto fail;
     }
 
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false, 0) : 0;
+    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false, true, 0)
+                                      : 0;
 
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e4fbf7b702d6..a6f8cb67dcac 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -166,6 +166,7 @@ struct vpci_vcpu {
         } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
         uint16_t cmd;
         bool rom_only : 1;
+        bool map : 1;
         bool pending : 1;
     } task[1];
 };
-- 
2.53.0


