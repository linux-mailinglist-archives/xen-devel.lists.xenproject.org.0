Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PrWBbwF1Gk9pwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:13:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60B3A684C
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274358.1560508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pNF-0000Ka-Dg; Mon, 06 Apr 2026 19:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274358.1560508; Mon, 06 Apr 2026 19:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pNF-0000HR-9z; Mon, 06 Apr 2026 19:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1274358;
 Mon, 06 Apr 2026 19:12:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w9pND-0000GC-B9
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 19:12:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9pNC-001f2t-NL
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 21:12:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d40580-2eae-0a2a0a5409dd-0a2a4508a27a-44
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:34 +0200
Received: from [52.101.53.59]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d405a0-fab6-0a2a45080019-3465353b4fad-4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:34 +0200
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by PH0PR12MB5680.namprd12.prod.outlook.com (2603:10b6:510:146::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 19:12:25 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::b8) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 19:12:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 19:12:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Apr
 2026 14:12:24 -0500
Received: from ubuntu (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 6 Apr
 2026 14:12:23 -0500
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
 b=vX/KcJpIrMDz8U5t+WAvcidI3IUiYIxR6xW6GnE7Oc9Um5bbcMH6cEVGhjHATt/dbkkk5mEUFuzdhJjpdiVWyki41cZa5vWxzIiDB54Rub3qdBYnt1XjKANqL6sobEI1631rh75yzQKzwlz82+a4krGoeLHUggxp0O3n7BwNuLbv3dIMtGk9PacS5HQl0N4cojI9yLcmnm4BUp390WbW1gZVcMjMoVCnJsHIRu7n7C8Eb9Mps5J1IuaLMFa0KtVc+LB1sUlon6fQUKHa5F6erIF6D27Rqkd/Qf/PhazXW+Hnmh//LZJiflpI+rpJpcMSBiLk/2jhbN3Al5IV33YhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdGllGUK8TiRaZWvVqFEsyu4uOoRMu93WYGtX/iLMdg=;
 b=W9iaZ3XVeboi4gxyZe8c5t31WiM4CIOaUdNzKnavKgoX613V3TVugFUbKw0I+KOHmGCwuBupiczYgE94tnS78YOfTCgf3XOQ53h3HWTGGfcZtXasXtuTSpVFsnSy5ijVOecDkiJHp3gzIL4S//YjAo5/s2L0IBmOMnc/FJ8WXTYsPR8ZGiPs4wsK12rclWIveIyxNUdF5P9w44RYy/EPDr3wv+6kBlZvhLoe+9Cv00ZRNnhkmlVexwJ7Yu5BNzMa2I5T6zPpwKAOC1oDacLoAm8ojMVhM3+AHzYO5a/JvJYbamaoyQ0oxzh8TD63qkPDnNvHFZr9+7skA3Zm713U7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdGllGUK8TiRaZWvVqFEsyu4uOoRMu93WYGtX/iLMdg=;
 b=0qTb0+uRhafBHRHwVP9nqpl9R/tudSlOewmfMjhHbrxMjdVRYo39x5sV0MlxhfW91WZvZqxdigeZTjhYQ2ouXM7vKce2ayxMWMjxEbBvvY2mfA+x3feJB5o4D1sbw/A6jTRS5sKSteSNwB5MCqKZPtm+b9Bw7OXbLegjDwB6DOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Mykyta
 Poturai" <Mykyta_Poturai@epam.com>
Subject: [PATCH v4 2/4] vpci: allow queueing of mapping operations
Date: Mon, 6 Apr 2026 15:11:56 -0400
Message-ID: <20260406191203.97662-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406191203.97662-1-stewart.hildebrand@amd.com>
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a4cc13-f6bd-41fc-fab9-08de9410700c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FC/OqTwKNX2oTpQAloN/lICTIwv/HsgAhl7z3DzZ6VM3eFslz/MijlcOvBf4cWTnLquEFBT9WI84WzP/eWoXEaPwNWjGutv26StfewVIvFuvJGaBRWzra8mHHFNH9g3NM62vxIgUUyJHZybMW3veAAoNh2Jbb8W6OIPSswr2PqSYGa+huDDVrkpqpKjrHnqiZ3v5wDrFE7jldOtnTLjJ6QnDh8e5Z0ZaOkueHIkRHhZIJodlYMFbRvnELqp9/uKH71LvLu8SO9Zjjarm1zlWRE9sg8leGGQVFsN4g4zMvRKQXjGXjw6wXEpsmnC+/Pip1rsBcPXIo6581oGNdsF3LQInMPQakkVjyush0IgAONU9D4Y+qYNND4Bmsb796i7ML8psAe4qWkbsvgByE4Qt8uRgu6XERecptmr9AUB5/r1U9/VQFSzNKisyn8hhhDtb8BBZXkpsFfhWW1lEwxVDVRSnmWBpX/SjT6lEtZhETbKaFMoBBDNvdXNQt5S4FZD4Yyxs/pqBUVP0ZOlEvQRyDcSy7xneKUeoRXmfCRWHmkDT98xnuD3Sv0oeDG/PhQPlQ9AiHmwgBnwht+pLV6g+9dAd291saU0x64YX5MYkKJoApv+hnqcUCepT53jve1wg7EEPZd+yd1DgKdLoSAzHTIiqI/gCyHv/kMEHl289XZAI7ZakvP3GE4zJIOFOGo2Q/xw6kpTjlLvZ3lMOiDV5khxoiURcgSaafadp+YEgMUY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3XvrUkjh8W/iUp+zpqbnOR7jk1qqNxFh0P3TE/VBbLTecE55CrOM+SvhH2GK1gQc3swr6BCluTSgLf0BifMfDt8aEevu2jHCGcOaj5qgliFoX2B653MXt/ujf5LodjdqT0EYHp2WycundMAQzqGwsYAGUEnZ0QDJsApKq9YFCfQUntzsiw0F+L9bubrtjZRPLn5wU+Fn6y+jb0B7BltOqUFHBWMh8BFdvH/GblidwYcDg589IMw3nY05WujJG3MgTHyw+a8iX+xGwi+D9cxQcaekp5TiwdsvnqbK/lywVWOrGkhpJMDLruHFaEOhDhHnDV6qtUOSjaCXN8xfXPexTNpDJH9atCSQy08EldURibHM4KjLkWtJpyCwZopuxMVESLGAPPytnzN2MACZA7ipu8Qlg5B+4jlyS/rjiOfmZS4KpVqA7RlAz0E55NM+A7m6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 19:12:25.2126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a4cc13-f6bd-41fc-fab9-08de9410700c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680
X-purgate-ID: tlsNG-c1860d/1775502754-F5B54497-CB89D6D1/0/0
X-purgate-type: clean
X-purgate-size: 19758
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 5E60B3A684C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce vPCI BAR mapping task queue. Store information needed to
map/unmap BARs in struct vpci_map_task. Allow queueing of BAR map/unmap
operations in a list, thus making it possible to perform multiple p2m
operations associated with single PCI device.

This is preparatory work for further changes that need to perform
multiple unmap/map operations before returning to guest.

At the moment, only a single operation will be queued. However, when
multiple operations are queued, there is a check in modify_bars() to
skip BARs already in the requested state that will no longer be
accurate. Remove this check in preparation of upcoming changes.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
apply_map() and vpci_process_map_task() are very similar. Should we try
to combine them into a single function?

I concede that the dynamic allocation/deallocation of struct
vpci_map_task is not ideal. However, to support SR-IOV, there will be a
need to queue many mapping operations (one per VF), and statically
pre-allocating that much would seem wasteful. Only the hardware and/or
control domain would need to queue many operations, and only when
configuring SR-IOV.

v3->v4:
* switch back to dynamically allocated queue elements

v2->v3:
* base on ("vpci: Use pervcpu ranges for BAR mapping") from [1]
* rework with fixed array of map/unmap slots

[1] https://lore.kernel.org/xen-devel/cover.1772806036.git.mykyta_poturai@epam.com/T/#t

v1->v2:
* new patch
---
 xen/common/domain.c        |   5 +-
 xen/drivers/vpci/header.c  | 227 ++++++++++++++++++++++++++-----------
 xen/drivers/vpci/vpci.c    |  30 +----
 xen/include/xen/rangeset.h |   7 --
 xen/include/xen/vpci.h     |  21 ++--
 5 files changed, 179 insertions(+), 111 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5ef7db8f0960..b1931be9870b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -455,8 +455,6 @@ static int vcpu_teardown(struct vcpu *v)
  */
 static void vcpu_destroy(struct vcpu *v)
 {
-    vpci_vcpu_destroy(v);
-
     free_vcpu_struct(v);
 }
 
@@ -514,8 +512,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 
-    if ( vpci_vcpu_init(v) )
-        goto fail_sched;
+    vpci_vcpu_init(v);
 
     d->vcpu[vcpu_id] = v;
     if ( vcpu_id != 0 )
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 89dce932f3b1..146915e28c50 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -23,6 +23,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#include <xen/xvmalloc.h>
 
 #include <xsm/xsm.h>
 
@@ -35,7 +36,7 @@
 
 struct map_data {
     struct domain *d;
-    const struct vpci_bar *bar;
+    const struct vpci_bar_map *bar;
     bool map;
 };
 
@@ -174,32 +175,20 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
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
-
-    read_lock(&v->domain->pci_lock);
-
-    if ( !pdev->vpci || (v->domain != pdev->domain) )
-    {
-        v->vpci.pdev = NULL;
-        read_unlock(&v->domain->pci_lock);
-        return false;
-    }
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
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
@@ -210,58 +199,116 @@ bool vpci_process_pending(struct vcpu *v)
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
 
-            /* Clean all the rangesets */
-            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(v->vpci.mem[i]) )
-                     rangeset_purge(v->vpci.mem[i]);
+            if ( !is_hardware_domain(pdev->domain) )
+                domain_crash(pdev->domain);
+
+            return rc;
+        }
+    }
+
+    spin_lock(&pdev->vpci->lock);
+    modify_decoding(pdev, task->cmd, task->rom_only);
+    spin_unlock(&pdev->vpci->lock);
+
+    return 0;
+}
+
+static void destroy_map_task(struct vpci_map_task *task)
+{
+    unsigned int i;
+
+    if ( !task )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
+        rangeset_destroy(task->bars[i].mem);
+
+    xvfree(task);
+}
+
+static void clear_map_queue(struct vcpu *v)
+{
+    struct vpci_map_task *task;
+
+    while ( (task = list_first_entry_or_null(&v->vpci.task_queue,
+                                             struct vpci_map_task,
+                                             next)) != NULL )
+    {
+        list_del(&task->next);
+        destroy_map_task(task);
+    }
+}
+
+bool vpci_process_pending(struct vcpu *v)
+{
+    const struct pci_dev *pdev = v->vpci.pdev;
+    struct vpci_map_task *task;
 
-            v->vpci.pdev = NULL;
+    if ( !pdev )
+        return false;
 
+    read_lock(&v->domain->pci_lock);
+
+    if ( !pdev->vpci || (v->domain != pdev->domain) )
+    {
+        clear_map_queue(v);
+        v->vpci.pdev = NULL;
+        read_unlock(&v->domain->pci_lock);
+        return false;
+    }
+
+    while ( (task = list_first_entry_or_null(&v->vpci.task_queue,
+                                             struct vpci_map_task,
+                                             next)) != NULL )
+    {
+        int rc = vpci_process_map_task(pdev, task);
+
+        if ( rc == -ERESTART )
+        {
             read_unlock(&v->domain->pci_lock);
+            return true;
+        }
 
-            if ( !is_hardware_domain(v->domain) )
-                domain_crash(v->domain);
+        list_del(&task->next);
+        destroy_map_task(task);
 
-            return false;
+        if ( rc )
+        {
+            clear_map_queue(v);
+            break;
         }
     }
     v->vpci.pdev = NULL;
 
-    spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
-    spin_unlock(&pdev->vpci->lock);
-
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
@@ -281,15 +328,52 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         }
     }
     if ( !rc )
-        modify_decoding(pdev, cmd, false);
+        modify_decoding(pdev, task->cmd, false);
 
     return rc;
 }
 
-static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
+                                            uint16_t cmd, bool rom_only)
+{
+    struct vpci_map_task *task;
+    unsigned int i;
+
+    task = xvzalloc(struct vpci_map_task);
+
+    if ( !task )
+        return NULL;
+
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
+    {
+        if ( !MAPPABLE_BAR(&pdev->vpci->header.bars[i]) )
+            continue;
+
+        task->bars[i].mem = rangeset_new(pdev->domain, NULL,
+                                         RANGESETF_no_print);
+
+        if ( !task->bars[i].mem )
+        {
+            destroy_map_task(task);
+            return NULL;
+        }
+
+        task->bars[i].addr = pdev->vpci->header.bars[i].addr;
+        task->bars[i].guest_addr = pdev->vpci->header.bars[i].guest_addr;
+    }
+
+    task->cmd = cmd;
+    task->rom_only = rom_only;
+
+    return task;
+}
+
+static void defer_map(const struct pci_dev *pdev, struct vpci_map_task *task)
 {
     struct vcpu *curr = current;
 
+    ASSERT(!curr->vpci.pdev || curr->vpci.pdev == pdev);
+
     /*
      * FIXME: when deferring the {un}map the state of the device should not
      * be trusted. For example the enable bit is toggled after the device
@@ -297,8 +381,8 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev = pdev;
-    curr->vpci.cmd = cmd;
-    curr->vpci.rom_only = rom_only;
+    list_add_tail(&task->next, &curr->vpci.task_queue);
+
     /*
      * Raise a scheduler softirq in order to prevent the guest from resuming
      * execution with pending mapping operations, to trigger the invocation
@@ -313,11 +397,17 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
+    struct vpci_map_task *task;
     unsigned int i, j;
     int rc;
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
+    task = alloc_map_task(pdev, cmd, rom_only);
+
+    if ( !task )
+        return -ENOMEM;
+
     /*
      * Create a rangeset per BAR that represents the current device memory
      * region and compare it against all the currently active BAR memory
@@ -333,19 +423,18 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
-        struct rangeset *mem = current->vpci.mem[i];
+        struct rangeset *mem = task->bars[i].mem;
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest = PFN_DOWN(bar->guest_addr);
         unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
 
-        ASSERT(mem);
+        if ( !mem )
+            continue;
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
-                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
-             /* Skip BARs already in the requested state. */
-             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
+                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
             continue;
 
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
@@ -368,7 +457,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             gprintk(XENLOG_G_WARNING,
                     "%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\n",
                     &pdev->sbdf, i, bar->guest_addr, bar->addr);
-            return -EINVAL;
+            rc = -EINVAL;
+            goto fail;
         }
 
         rc = rangeset_add_range(mem, start_guest, end_guest);
@@ -376,13 +466,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start_guest, end_guest, rc);
-            return rc;
+            goto fail;
         }
 
         /* Check for overlap with the already setup BAR ranges. */
         for ( j = 0; j < i; j++ )
         {
-            struct rangeset *prev_mem = current->vpci.mem[j];
+            struct rangeset *prev_mem = task->bars[j].mem;
 
             if ( rangeset_is_empty(prev_mem) )
                 continue;
@@ -393,7 +483,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
                         &pdev->sbdf, start_guest, end_guest, rc);
-                return rc;
+                goto fail;
             }
         }
 
@@ -403,7 +493,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             gprintk(XENLOG_WARNING,
                     "%pp: failed to sanitize BAR#%u memory: %d\n",
                     &pdev->sbdf, i, rc);
-            return rc;
+            goto fail;
         }
     }
 
@@ -414,9 +504,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
 
-        for ( j = 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
+        for ( j = 0; j < ARRAY_SIZE(task->bars); j++ )
         {
-            struct rangeset *mem = current->vpci.mem[j];
+            struct rangeset *mem = task->bars[j].mem;
 
             if ( rangeset_is_empty(mem) )
                 continue;
@@ -427,7 +517,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
                         &pdev->sbdf, start, end, rc);
-                return rc;
+                goto fail;
             }
         }
     }
@@ -471,7 +561,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar = &header->bars[j];
-                    struct rangeset *mem = current->vpci.mem[j];
+                    struct rangeset *mem = task->bars[j].mem;
 
                     if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
@@ -490,7 +580,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                         gprintk(XENLOG_WARNING,
                                 "%pp: failed to remove [%lx, %lx]: %d\n",
                                 &pdev->sbdf, start, end, rc);
-                        return rc;
+                        goto fail;
                     }
                 }
             }
@@ -513,12 +603,19 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, cmd);
+        rc = apply_map(pdev->domain, pdev, task);
+        destroy_map_task(task);
+        return rc;
     }
 
-    defer_map(pdev, cmd, rom_only);
+    defer_map(pdev, task);
 
     return 0;
+
+ fail:
+    destroy_map_task(task);
+
+    return rc;
 }
 
 static void cf_check cmd_write(
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 8e6343653078..ce9fb5b357ff 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -24,35 +24,9 @@
 
 #ifdef __XEN__
 
-void vpci_vcpu_destroy(struct vcpu *v)
+void vpci_vcpu_init(struct vcpu *v)
 {
-    unsigned int i;
-
-    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
-        return;
-
-    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
-        RANGESET_DESTROY(v->vpci.mem[i]);
-}
-
-int vpci_vcpu_init(struct vcpu *v)
-{
-    unsigned int i;
-
-    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
-        return 0;
-
-    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
-    {
-        char str[32];
-
-        snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
-        v->vpci.mem[i] = rangeset_new(v->domain, str, RANGESETF_no_print);
-        if ( !v->vpci.mem[i] )
-            return -ENOMEM;
-    }
-
-    return 0;
+    INIT_LIST_HEAD(&v->vpci.task_queue);
 }
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index f01e00ec9234..817505badf6f 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -40,13 +40,6 @@ struct rangeset *rangeset_new(
 void rangeset_destroy(
     struct rangeset *r);
 
-/* Destroy a rangeset, and zero the pointer to it. */
-#define RANGESET_DESTROY(r)  \
-    ({                       \
-        rangeset_destroy(r); \
-        (r) = NULL;          \
-    })
-
 /*
  * Set a limit on the number of ranges that may exist in set @r.
  * NOTE: This must be called while @r is empty.
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b55bacbe6e01..e34f7abe6da2 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -19,8 +19,7 @@
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
-void vpci_vcpu_destroy(struct vcpu *v);
-int vpci_vcpu_init(struct vcpu *v);
+void vpci_vcpu_init(struct vcpu *v);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
@@ -155,14 +154,23 @@ struct vpci {
 };
 
 #ifdef __XEN__
-struct vpci_vcpu {
+struct vpci_map_task {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    const struct pci_dev *pdev;
-    struct rangeset *mem[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
+    struct list_head next;
+    struct vpci_bar_map {
+        uint64_t addr;
+        uint64_t guest_addr;
+        struct rangeset *mem;
+    } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
     uint16_t cmd;
     bool rom_only : 1;
 };
 
+struct vpci_vcpu {
+    const struct pci_dev *pdev;
+    struct list_head task_queue;
+};
+
 void vpci_dump_msi(void);
 
 /* Arch-specific vPCI MSI helpers. */
@@ -207,8 +215,7 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
 
-static inline void vpci_vcpu_destroy(struct vcpu *v) { }
-static inline int vpci_vcpu_init(struct vcpu *v) { return 0; }
+static inline void vpci_vcpu_init(struct vcpu *v) { }
 
 static inline int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
 {
-- 
2.53.0


