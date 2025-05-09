Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6058AB0E33
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979883.1366421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgR-00062X-Qw; Fri, 09 May 2025 09:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979883.1366421; Fri, 09 May 2025 09:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgR-0005zI-M7; Fri, 09 May 2025 09:06:19 +0000
Received: by outflank-mailman (input) for mailman id 979883;
 Fri, 09 May 2025 09:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgP-0005aH-Pi
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2415::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbfeb54d-2cb4-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 11:06:15 +0200 (CEST)
Received: from BYAPR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:c0::43)
 by SJ0PR12MB6709.namprd12.prod.outlook.com (2603:10b6:a03:44a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 09:06:12 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::83) by BYAPR05CA0030.outlook.office365.com
 (2603:10b6:a03:c0::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Fri,
 9 May 2025 09:06:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:11 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:09 -0500
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
X-Inumbo-ID: dbfeb54d-2cb4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRqA53s60BaB7utvC4ithQGNPwdHp65elNJPBVgy2ZtOVqoPTpZgzD6dfP4eguGi2JoL09RQpq0qDh4qHbxT/ewKZaRD4cpgsHGdxfmrRwtglF1LNM/pcRy2KdH4eviWdXCfWAuoaPfOFNykWMa5sUiL9uJ5aAT+5ajbFfEW/xy4ITc/oW/ibIgugsdrT2K3gmM0TLobhkDFLboneX7lP+3vYnVrkkI/9RiRGPLEYZcYZEvk9TcX/MBpBP3QxqrMBdQxoS7PKeatpkDHTMrTSisq3e9Ji3dFqaLtTxpxUtERCR+pHsYLQm2F8F70UhXosgAlgl97VUYlV2c1LNigmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6G7DJ7nIDNTyKDlrjUtQimi6DsZE3vULZcx6kuZrv4=;
 b=VhYz7nWnIHg71+u9tPkEQWyJm/zdQLMdHjqX7FL6MG6qeTnLml3f/TfropiWwyLRqayWzcKSUU8xh5kFnNlGCy2Gw1j8f2sdncJBTNWVDIAFy4DPgKMlq/NYbhxt4qyBfxb8T479UDtVTJC/4RGsBdM+91g0L5X0K8DYjOleGSe4ULCRhP7IGkyC+2+ZxihbaXsue0pcDvvOftSARHBkAvTGeIrbxxtRRptzSxnCKYIJwSZTgusfEpen8UBRn7Cy0jmusiKx3o6RsTJIOtVBiem2o8e/YOTHLm/FzRu5QcVb0mFcEblCbU36xUfYdoWwjqnkEr0fNxoGx0fBFCZrHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6G7DJ7nIDNTyKDlrjUtQimi6DsZE3vULZcx6kuZrv4=;
 b=zQsQd6DpBvm8ghD5pUGGY54HEt4skN5iUgNWphaKZ/mYJm55nRtAeux5xaFbUzKIzCB9/0p+etpg2II6DdN9PYbwbihrispwh+IuePwArFD/SDxq2r9WXUcX5OAjiCclXbOUAZEQgFqI7GfE9sbgatPwufksRwEZgbH/XFD19bw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v4 07/10] vpci: Refactor vpci_remove_register to remove matched registers
Date: Fri, 9 May 2025 17:05:39 +0800
Message-ID: <20250509090542.2199676-8-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SJ0PR12MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 06864198-1481-4caa-8782-08dd8ed8be81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEVndzdqRXkwd1JlVGFtSWNEUDZBVnU3a01rWE9QY1ZwM3FSWXB3QlFnK1BL?=
 =?utf-8?B?eThmVFNGYzRSM0dya3Z5K0haa2pBN1huTXRacVgzL0JUMEkzRWdodXYrVXQw?=
 =?utf-8?B?RWhRcVhFaWJFS2ROQ29GYzZ6L1grS1BjRE9sR2p4NVZ3QVMxMXk0dXJkaEdE?=
 =?utf-8?B?MnNSZUNrWWQ1ZkV2USticE9Gb3ZkSFBuNU1tcmVaUEoxTi9VdEFraG9Ob2hs?=
 =?utf-8?B?T25sTjRhOWw4VkZ3Uk9IN0doSFFsSXNUaG5pd0VvRGxOQmVHLzJlT0xzVzgw?=
 =?utf-8?B?cnFQbzVMTDN2b2xnZUdFekJWT0laZ1gyVlJ5QXhQQXVuTEdXZjhrNjREZUdR?=
 =?utf-8?B?U0pORzFLZ0VhZmswMVRmUlpvRzFNa2RDWmNibG5YWHk4elZEVUdTbUNUd1JF?=
 =?utf-8?B?OVdrb3RGMU10Nm9mREh2VVVSczVvdGg2ZnFwWUdJZDJuc2liZjJCVCswM2Yz?=
 =?utf-8?B?dkp4MEwyOEk2YWJENUR2NHJmK2RXY3RpQUM5enZUL3pHT2ZkWlpBRWFxZWtx?=
 =?utf-8?B?UVRleW5OdE1FOHluZktSbk5IWjdCcUZRemhkTHdKQWtXSWJIWnIyM2lrcmQy?=
 =?utf-8?B?WmxaVnlTaG9kYWI3YzY3UjhoU3R3Nk9GQkdWODRhMXMzaG95UGQ0eFhCd01E?=
 =?utf-8?B?QlJRNHdmUHZsdVo2U2l2d0pSdVZOb3pmQmlOTEUrWUhPRUJXdFlqZmtNOUIx?=
 =?utf-8?B?a0czdDZHV0lURFdNWTFCR000NDFIZStSRjJwZ2xhUmVtRzd1a1pXNlM3VndY?=
 =?utf-8?B?cjR6ZjRiSC9KTjZIT1VlTFh6QkQ2Z1ZWcitrVXp4bExjTzBORnI2Ni9VSGV4?=
 =?utf-8?B?TWppWWZDYmxCUUlFUkFVVllsZDRHMmdIa2JhNXEwRUlpNHZDQkJ3UzMyV2VE?=
 =?utf-8?B?SDFNSW5sZ00xaWlJVFlXVzdJNzJ4dlQzQTRhdFRpSHd4dTZ3UnEvaHhWdzFD?=
 =?utf-8?B?Mlg1VmZ0V2VJcWpDME9wR0tucTRtRnhka2hJeCtabSt6TDJIYjc1UTBhNS9w?=
 =?utf-8?B?Y2dZT2JUNlJwN2RScURUZGh3T3pKYk5icjZGZ3dwNGJXK0JteENsa203aUJV?=
 =?utf-8?B?WG5RZ3Vja0JVL00zYkY2RlovOUt0VFlRdENsbjJRQjJFODkxci9aQm5maGlE?=
 =?utf-8?B?TzRZbVNHRWhpc0FJRHZnMTcwV2huUzJHR1ZYSGdVclBLL0R3bWRZakxCMktU?=
 =?utf-8?B?VjV5d1l1TDNsRjdwSGhJcDFzNDhoY0lhaklHMlhaU210YzFoSzZhN0EzTGpR?=
 =?utf-8?B?bGtSZHFYK2lDQ2dpcDNiazFnZkpOMUJtam5hRHJFWkhkNE9pWHdrWm5ENFdv?=
 =?utf-8?B?N1Z2b3VmUmhCTWsxd1FhWkVPQW9sb3FjaHV1RnAvRDhwQUxUTUppUGF1Zjll?=
 =?utf-8?B?dVU3OXJweWtoQjVEUmY3OTNMc1pGK2MvYlZiR0xvZ1pQb2ViTlU1WEVhcjFz?=
 =?utf-8?B?T3FCL2E3SUY1NXgzNkVoa3dDMWM5eEhEVFg4Uk1JUDlBbHRCNmp6aFBaRDhm?=
 =?utf-8?B?Y0ZYZVVSbTQwNDk5U05EUzVxTWlWZXdZV0FQUjY1NHhYS1dhQWhGUndjQzN2?=
 =?utf-8?B?d3VISnJ6TnlHV0xMR3FhOVhCUXAvQlNBQVhvanVzdStMSWhpakRoZXptUmRV?=
 =?utf-8?B?OUk4U3R3VFZIMTI4eVpPUkltZ3JQSVgrQmVKbGRNQWVpYTFsWlVQR2NSVFdh?=
 =?utf-8?B?Mi9CK1k4MkVFNElhMFBJOGVhK0hENUVNOU5SUnR1N1lSYWp0UmZhZjl5aXZH?=
 =?utf-8?B?b3FiM01NOE9XNlRvOGZaSExpcDF3TXI2R29XOTR2RGZya1Y1dGd1OUlFTkJo?=
 =?utf-8?B?aFVTRWJZTzAzR2FwNFNUSGRIRzdRRENIN3N1Z3JDbldaNWtaODdXY2FzVE96?=
 =?utf-8?B?OW1EOElqbjZFQW44eHBuNGhKeHVabVJPNGxRRjhqTjlydEhqY1A2dHc1ZVFH?=
 =?utf-8?B?aVJEQndCMWU5M2ptYndIMmE3elRUdHlYdTJUNkdmTWlMNzRzU2p3eGkvYjZk?=
 =?utf-8?B?QnRkaUpMZy9Cd1dZY1IwRm9mcnlQS202OC9sK0Irck1jM2x0OEF2UHVndXI5?=
 =?utf-8?Q?q7m7Wp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:11.5334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06864198-1481-4caa-8782-08dd8ed8be81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6709

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a range.
So, refactor it to support removing all matched registers in a calling
time.

And it is no matter to remove a non exist register, so remove the
__must_check prefix.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
v3->v4 changes:
* Use list_for_each_entry_safe instead of list_for_each_entry.
* Return ERANGE if overlap.

v2->v3 changes:
* Add new check to return error if registers overlap but not inside range.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 tools/tests/vpci/main.c |  4 ++--
 xen/drivers/vpci/vpci.c | 38 ++++++++++++++++++++------------------
 xen/include/xen/vpci.h  |  4 ++--
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 33223db3eb77..ca72877d60cd 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -132,10 +132,10 @@ static void vpci_write32_mask(const struct pci_dev *pdev, unsigned int reg,
                                   rsvdz_mask))
 
 #define VPCI_REMOVE_REG(off, size)                                          \
-    assert(!vpci_remove_register(test_pdev.vpci, off, size))
+    assert(!vpci_remove_registers(test_pdev.vpci, off, size))
 
 #define VPCI_REMOVE_INVALID_REG(off, size)                                  \
-    assert(vpci_remove_register(test_pdev.vpci, off, size))
+    assert(vpci_remove_registers(test_pdev.vpci, off, size))
 
 /* Read a 32b register using all possible sizes. */
 void multiread4_check(unsigned int reg, uint32_t val)
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 76d663753e7b..ae39a0436284 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -180,7 +180,7 @@ static int vpci_capability_mask(struct pci_dev *pdev, unsigned int cap)
 
     prev_next_r->private = next_r->private;
     /*
-     * Not calling vpci_remove_register() here is to avoid redoing
+     * Not calling vpci_remove_registers() here is to avoid redoing
      * the register search
      */
     list_del(&next_r->node);
@@ -188,7 +188,7 @@ static int vpci_capability_mask(struct pci_dev *pdev, unsigned int cap)
     xfree(next_r);
 
     if ( !is_hardware_domain(pdev->domain) )
-        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
 
     return 0;
 }
@@ -532,34 +532,36 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
-int vpci_remove_register(struct vpci *vpci, unsigned int offset,
-                         unsigned int size)
+int vpci_remove_registers(struct vpci *vpci, unsigned int start,
+                          unsigned int size)
 {
-    const struct vpci_register r = { .offset = offset, .size = size };
-    struct vpci_register *rm;
+    struct vpci_register *rm, *tmp;
+    unsigned int end = start + size;
 
     spin_lock(&vpci->lock);
-    list_for_each_entry ( rm, &vpci->handlers, node )
+    list_for_each_entry_safe ( rm, tmp, &vpci->handlers, node )
     {
-        int cmp = vpci_register_cmp(&r, rm);
-
-        /*
-         * NB: do not use a switch so that we can use break to
-         * get out of the list loop earlier if required.
-         */
-        if ( !cmp && rm->offset == offset && rm->size == size )
+        /* Remove rm if rm is inside the range. */
+        if ( rm->offset >= start && rm->offset + rm->size <= end )
         {
             list_del(&rm->node);
-            spin_unlock(&vpci->lock);
             xfree(rm);
-            return 0;
+            continue;
         }
-        if ( cmp <= 0 )
+
+        /* Return error if registers overlap but not inside. */
+        if ( rm->offset + rm->size > start && rm->offset < end )
+        {
+            spin_unlock(&vpci->lock);
+            return -ERANGE;
+        }
+
+        if ( start < rm->offset )
             break;
     }
     spin_unlock(&vpci->lock);
 
-    return -ENOENT;
+    return 0;
 }
 
 /* Wrappers for performing reads/writes to the underlying hardware. */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 7d4274e178ee..346006438fe4 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -71,8 +71,8 @@ static inline int __must_check vpci_add_register(struct vpci *vpci,
                                   size, data, 0, 0, 0, 0);
 }
 
-int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
-                                      unsigned int size);
+int vpci_remove_registers(struct vpci *vpci, unsigned int start,
+                          unsigned int size);
 
 /* Generic read/write handlers for the PCI config space. */
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
-- 
2.34.1


