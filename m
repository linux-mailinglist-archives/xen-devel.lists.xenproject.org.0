Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J7lMab/wWkjYwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61465301778
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259998.1553334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5S-0005LE-Ey; Tue, 24 Mar 2026 03:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259998.1553334; Tue, 24 Mar 2026 03:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5S-0005Ir-BE; Tue, 24 Mar 2026 03:05:46 +0000
Received: by outflank-mailman (input) for mailman id 1259998;
 Tue, 24 Mar 2026 03:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdnX=BY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w4s5Q-0005H3-QC
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 03:05:44 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56dae6a3-272e-11f1-b166-2bf370ae4941;
 Tue, 24 Mar 2026 04:05:41 +0100 (CET)
Received: from SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 03:05:33 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:334:cafe::78) by SJ0PR05CA0099.outlook.office365.com
 (2603:10b6:a03:334::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Tue,
 24 Mar 2026 03:05:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Tue, 24 Mar 2026 03:05:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 22:05:31 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 20:05:31 -0700
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 23
 Mar 2026 22:05:30 -0500
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
X-Inumbo-ID: 56dae6a3-272e-11f1-b166-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw+eMHjusyykH3qKhLlwGm4+rgdoAqyS89199VRhViKj52DshH1vUAii0Du6l5eJK1nviaLyjNRkMZ7NDNIlJHHP86v0cKU+fdBvCwFbvva2YxejaH+44RB2cgOhtfcwtpp4X0ZcH9o+4JYFKfmQP1JqHV/75KPA299+0uCvUpY5/KO6le6loqy2orRD6433OXtkgXhhzJTtavkXxUM41lhEBclTTBg3ZdiVKjOlrqe0pWPV4Y7nxrookoWjpteh8PJwyA9tFKHACeNWWzNHs2F3iPVCJuxGOVVUS2iMweiqcGUGHu4rVEDWgcCGyJiZ4C7nOg88qwbNchp4eVlbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHZJW9WDn0STWGtdXipUHQXXnVAbQYDfOvCtR2vCnXQ=;
 b=QPLJh9qG20QEM6bx+mUuwm0h8KqwhzQm0iLJyMIefOxjBwUKn9Hc9F9uj0TqThgMlddFn967r7ucML+Tjo4PKTnwc+Fi1ILOvTSOLHsZa9aKntMn+duTjl9n/6LwjVwlFRRpgmqiesI6ISNUDeCiJgbEmaLGnG/AsmVcB2XC6SXGKbZ5F6pFX/Eeb/7yH1PDVPG1ks091xZEjUFtRt/Lm48v/zcWVYPRbDyyisCn8iRACEEhoUtjZPhVkaQTswLAqJdc9gdHjPeFn/HgjFVgVuTKohH/R9oPnD6hUx6nnmjQoMgk/wuHdEvMF6c6r7xz3CzdJ0bGsflCZqQz2RucTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHZJW9WDn0STWGtdXipUHQXXnVAbQYDfOvCtR2vCnXQ=;
 b=KpkDWrYAJaH0iTBukXjZv5x3AArTmKQFxcZ9jOeaVZiOeH5KFtLNk6D2NlexCQvABT9ERXbgQSv+EUPLtejbMmsm2mXPUJww2dsDGBWGNR+LaGwdE45ZzQK+q5phwNI968Sncvbw6mLJsX6Li3vJ4IddskIM+TPEXR/JIwviu+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/4] vpci: allow queueing of mapping operations
Date: Mon, 23 Mar 2026 23:04:59 -0400
Message-ID: <20260324030513.700217-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324030513.700217-1-stewart.hildebrand@amd.com>
References: <20260324030513.700217-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: dec31223-e36b-49b2-df63-08de89523605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+TWipBCn7SZUG3jPfdBoE7SsJlU7fJwUrp192eKG8Q923tQTUWKYDk8PyB0Az00p4Aa7e1oK7CxnZI9H6BjLYD0/CxRXDPFmTrOhcbdMlFiJopYf7B/qk/oPZYJ9II1tnWyMnHWHgFlCNxtAU65m+BXcmqlAWZ0E+Y5qjORu6Y0UJlyJZ9UrxtA6Q/irxEMqsit+9O4j44SslG+iFtAaBcNSs/keIlxvagkcFS5VyRpbtTECfqPFI0LeLNkrfSi5emgJ3bVxlRuLSSmXaaY+eWfbysv3R6zngqzeeNNJ6mdxfHbFh0GLplC82R2gmlGGYX4IUtDzEi9CveahKboQ5sil3QriTxaNeb9fNgXyyk9tM+L3Abwfn4HZuT1qSrTwqBVpjQKDThHv02hvRJPEMtKC4baAWPmTJLG9i72k1L2Z4d1kVzT5IWZKRZIMwwJPXOk2Jv1gzaJUG43IY6J9O/j3mf8jj1iK9LKQ2YfflWUgsOL1MhpGCki2FPe5meEC/BMnL8mt16gqJx6Boas2uuhphAUB8DmtLXHL1Aj1At56Jgp89D7Zvv/cq4qlUqhenfV+nEkU0GTdCRHaRWOUDnfMkeY0Kdkp2WbQIeTJoV9a8n/oY+EkLcqjSgKGGZ74rgJ2beG1DVV4ZhvEmflZaQJa0Yodw3pciBKNJdxbX4XRO1nZflvbE8KO7jLwNoR65zQGm/iE7fCiQDX6pqU00nPT9YUhFjZ6khBeijzt9EkCzF/ATSVMqU/o6POGi4w3mioo9Wr3OU/djrOUmxwWBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g2+sCOUQXqUSIlww1tBrzZ0+kHo//9AMThDhxh00jQe+81ndrbP+9U6g81da0OX/4npu2/yGNQ/l0BIZv2eE+BciauNF2P04BNr6Vfmcl/PFbufJNHsPEH5u1xe2A0irlt9FQ8rSbENUDBX4ZKjD8rM/rSKoYjiNPY3Fg1NWYglRLMcmZKQS344joqT34g4pVV+r9vvWa3qdEyu5l+wHz5CBxmdITVcqKy7A2ELrAX0cB/o3GsjKlVlkoYkMGaXUooaCG2cvFRhgEgxNdi6CS+5a6ji2BpkrUj3P5AtmUVbE46IRiJsD6fpCSP0OEgsghbQOUe0WSbsmBaf7O76FgroUJpiNePsOeRMv7knBI1jaIK7L0m1SVeNSB2Y7hr4w4pvdyPRzPNFG3o5H0OHbmnqOHL0geZ0RNdgHCFeYb4kgouAIS9I1CTow3A/XtkcZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:05:31.8512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec31223-e36b-49b2-df63-08de89523605
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 61465301778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce vPCI BAR mapping task queue. Store information necessary in an
array in struct vpci_vcpu to perform multiple p2m operations associated
with single device.

This is preparatory work for further changes that need to perform
multiple unmap/map operations before returning to guest.

At the moment, only a single slot is needed in the array. However, when
multiple operations are queued and pending, there is a check in
modify_bars() to skip BARs already in the requested state that is not
accurate. Remove this check.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
apply_map() and vpci_process_map_task() are very similar. Should we try
to combine them into a single function?

v2->v3:
* base on ("vpci: Use pervcpu ranges for BAR mapping") from [1]
* rework with fixed array of map/unmap slots

[1] https://lore.kernel.org/xen-devel/cover.1772806036.git.mykyta_poturai@epam.com/T/#t

v1->v2:
* new patch
---
 xen/drivers/vpci/header.c | 154 +++++++++++++++++++++++---------------
 xen/drivers/vpci/vpci.c   |  27 ++++---
 xen/include/xen/vpci.h    |  15 +++-
 3 files changed, 122 insertions(+), 74 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 89dce932f3b1..e57c00839841 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -35,7 +35,7 @@
 
 struct map_data {
     struct domain *d;
-    const struct vpci_bar *bar;
+    const struct vpci_bar_map *bar;
     bool map;
 };
 
@@ -174,32 +174,23 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
         ASSERT_UNREACHABLE();
 }
 
-bool vpci_process_pending(struct vcpu *v)
+static int vpci_process_map_task(const struct pci_dev *pdev,
+                                 struct vpci_map_task *task)
 {
-    const struct pci_dev *pdev = v->vpci.pdev;
-    struct vpci_header *header = NULL;
     unsigned int i;
 
-    if ( !pdev )
-        return false;
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
-    read_lock(&v->domain->pci_lock);
-
-    if ( !pdev->vpci || (v->domain != pdev->domain) )
-    {
-        v->vpci.pdev = NULL;
-        read_unlock(&v->domain->pci_lock);
-        return false;
-    }
+    if ( !task->pending )
+        return 0;
 
-    header = &pdev->vpci->header;
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar = &header->bars[i];
-        struct rangeset *mem = v->vpci.mem[i];
+        struct vpci_bar_map *bar = &task->bars[i];
+        struct rangeset *mem = bar->mem;
         struct map_data data = {
-            .d = v->domain,
-            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .d = pdev->domain,
+            .map = task->cmd & PCI_COMMAND_MEMORY,
             .bar = bar,
         };
         int rc;
@@ -210,58 +201,91 @@ bool vpci_process_pending(struct vcpu *v)
         rc = rangeset_consume_ranges(mem, map_range, &data);
 
         if ( rc == -ERESTART )
-        {
-            read_unlock(&v->domain->pci_lock);
-            return true;
-        }
+            return rc;
 
         if ( rc )
         {
             spin_lock(&pdev->vpci->lock);
             /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
-                            false);
+            modify_decoding(pdev, task->cmd & ~PCI_COMMAND_MEMORY, false);
             spin_unlock(&pdev->vpci->lock);
 
             /* Clean all the rangesets */
-            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(v->vpci.mem[i]) )
-                     rangeset_purge(v->vpci.mem[i]);
-
-            v->vpci.pdev = NULL;
+            for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
+                if ( !rangeset_is_empty(mem) )
+                     rangeset_purge(mem);
 
-            read_unlock(&v->domain->pci_lock);
+            if ( !is_hardware_domain(pdev->domain) )
+                domain_crash(pdev->domain);
 
-            if ( !is_hardware_domain(v->domain) )
-                domain_crash(v->domain);
+            task->pending = false;
 
-            return false;
+            return rc;
         }
     }
-    v->vpci.pdev = NULL;
 
     spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
+    modify_decoding(pdev, task->cmd, task->rom_only);
     spin_unlock(&pdev->vpci->lock);
 
+    task->pending = false;
+
+    return 0;
+}
+
+bool vpci_process_pending(struct vcpu *v)
+{
+    const struct pci_dev *pdev = v->vpci.pdev;
+    unsigned int i;
+
+    if ( !pdev )
+        return false;
+
+    read_lock(&v->domain->pci_lock);
+
+    if ( !pdev->vpci || (v->domain != pdev->domain) )
+    {
+        for ( i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
+            v->vpci.task[i].pending = false;
+
+        v->vpci.pdev = NULL;
+        read_unlock(&v->domain->pci_lock);
+        return false;
+    }
+
+    for ( i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
+    {
+        struct vpci_map_task *task = &(v->vpci.task[i]);
+        int rc = vpci_process_map_task(pdev, task);
+
+        if ( rc == -ERESTART )
+        {
+            read_unlock(&v->domain->pci_lock);
+            return true;
+        }
+
+        if ( rc )
+            break;
+    }
+    v->vpci.pdev = NULL;
+
     read_unlock(&v->domain->pci_lock);
 
     return false;
 }
 
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-                            uint16_t cmd)
+                            struct vpci_map_task *task)
 {
-    struct vpci_header *header = &pdev->vpci->header;
     int rc = 0;
     unsigned int i;
 
     ASSERT(rw_is_write_locked(&d->pci_lock));
 
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar = &header->bars[i];
-        struct rangeset *mem = current->vpci.mem[i];
+        struct vpci_bar_map *bar = &task->bars[i];
+        struct rangeset *mem = bar->mem;
         struct map_data data = { .d = d, .map = true, .bar = bar };
 
         if ( rangeset_is_empty(mem) )
@@ -281,12 +305,14 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         }
     }
     if ( !rc )
-        modify_decoding(pdev, cmd, false);
+        modify_decoding(pdev, task->cmd, false);
+
+    task->pending = false;
 
     return rc;
 }
 
-static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static void defer_map(const struct pci_dev *pdev)
 {
     struct vcpu *curr = current;
 
@@ -297,8 +323,7 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev = pdev;
-    curr->vpci.cmd = cmd;
-    curr->vpci.rom_only = rom_only;
+
     /*
      * Raise a scheduler softirq in order to prevent the guest from resuming
      * execution with pending mapping operations, to trigger the invocation
@@ -307,16 +332,20 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only,
+                       unsigned int map_slot)
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
+    struct vpci_map_task *task = &current->vpci.task[map_slot];
     unsigned int i, j;
     int rc;
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+    ASSERT(map_slot < ARRAY_SIZE(current->vpci.task));
+    ASSERT(!task->pending);
 
     /*
      * Create a rangeset per BAR that represents the current device memory
@@ -333,7 +362,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
-        struct rangeset *mem = current->vpci.mem[i];
+        struct rangeset *mem = task->bars[i].mem;
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest = PFN_DOWN(bar->guest_addr);
@@ -343,9 +372,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
-                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
-             /* Skip BARs already in the requested state. */
-             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
+                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
             continue;
 
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
@@ -382,7 +409,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         /* Check for overlap with the already setup BAR ranges. */
         for ( j = 0; j < i; j++ )
         {
-            struct rangeset *prev_mem = current->vpci.mem[j];
+            struct rangeset *prev_mem = task->bars[j].mem;
 
             if ( rangeset_is_empty(prev_mem) )
                 continue;
@@ -405,6 +432,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                     &pdev->sbdf, i, rc);
             return rc;
         }
+
+        task->bars[i].addr = bar->addr;
+        task->bars[i].guest_addr = bar->guest_addr;
     }
 
     /* Remove any MSIX regions if present. */
@@ -414,9 +444,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
 
-        for ( j = 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
+        for ( j = 0; j < ARRAY_SIZE(task->bars); j++ )
         {
-            struct rangeset *mem = current->vpci.mem[j];
+            struct rangeset *mem = task->bars[j].mem;
 
             if ( rangeset_is_empty(mem) )
                 continue;
@@ -471,7 +501,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar = &header->bars[j];
-                    struct rangeset *mem = current->vpci.mem[j];
+                    struct rangeset *mem = task->bars[j].mem;
 
                     if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
@@ -502,6 +532,10 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         d = dom_xen;
     }
 
+    task->cmd = cmd;
+    task->rom_only = rom_only;
+    task->pending = true;
+
     if ( system_state < SYS_STATE_active )
     {
         /*
@@ -513,10 +547,10 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, cmd);
+        return apply_map(pdev->domain, pdev, task);
     }
 
-    defer_map(pdev, cmd, rom_only);
+    defer_map(pdev);
 
     return 0;
 }
@@ -549,7 +583,7 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything as-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
+        modify_bars(pdev, cmd, false, 0);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -717,7 +751,7 @@ static void cf_check rom_write(
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
      * this fabricated command is never going to be written to the register.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
+    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true, 0) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -907,7 +941,7 @@ int vpci_init_header(struct pci_dev *pdev)
             goto fail;
     }
 
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false, 0) : 0;
 
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 8e6343653078..54a4ed46387c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -26,30 +26,37 @@
 
 void vpci_vcpu_destroy(struct vcpu *v)
 {
-    unsigned int i;
+    unsigned int i, j;
 
     if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
         return;
 
-    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
-        RANGESET_DESTROY(v->vpci.mem[i]);
+    for ( i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
+    {
+        for ( j = 0; j < ARRAY_SIZE(v->vpci.task[i].bars); j++ )
+            RANGESET_DESTROY(v->vpci.task[i].bars[j].mem);
+    }
 }
 
 int vpci_vcpu_init(struct vcpu *v)
 {
-    unsigned int i;
+    unsigned int i, j;
 
     if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
         return 0;
 
-    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
+    for ( i = 0; i < ARRAY_SIZE(v->vpci.task); i++ )
     {
-        char str[32];
+        for ( j = 0; j < ARRAY_SIZE(v->vpci.task[i].bars); j++ )
+        {
+            char str[32];
 
-        snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
-        v->vpci.mem[i] = rangeset_new(v->domain, str, RANGESETF_no_print);
-        if ( !v->vpci.mem[i] )
-            return -ENOMEM;
+            snprintf(str, sizeof(str), "%pv:BAR[%u][%u]", v, i, j);
+            v->vpci.task[i].bars[j].mem = rangeset_new(v->domain, str,
+                                                       RANGESETF_no_print);
+            if ( !v->vpci.task[i].bars[j].mem )
+                return -ENOMEM;
+        }
     }
 
     return 0;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b55bacbe6e01..e4fbf7b702d6 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -156,11 +156,18 @@ struct vpci {
 
 #ifdef __XEN__
 struct vpci_vcpu {
-    /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
     const struct pci_dev *pdev;
-    struct rangeset *mem[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
-    uint16_t cmd;
-    bool rom_only : 1;
+    /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
+    struct vpci_map_task {
+        struct vpci_bar_map {
+            uint64_t addr;
+            uint64_t guest_addr;
+            struct rangeset *mem;
+        } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
+        uint16_t cmd;
+        bool rom_only : 1;
+        bool pending : 1;
+    } task[1];
 };
 
 void vpci_dump_msi(void);
-- 
2.53.0


