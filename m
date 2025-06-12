Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E6AD6C33
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012643.1391179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGQ-0001DL-B4; Thu, 12 Jun 2025 09:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012643.1391179; Thu, 12 Jun 2025 09:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGQ-00015T-5f; Thu, 12 Jun 2025 09:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1012643;
 Thu, 12 Jun 2025 09:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGO-00081C-FK
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:200a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d78598aa-476f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 11:30:13 +0200 (CEST)
Received: from SJ0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:33a::26)
 by BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Thu, 12 Jun
 2025 09:30:13 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2a) by SJ0PR03CA0021.outlook.office365.com
 (2603:10b6:a03:33a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Thu,
 12 Jun 2025 09:30:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:13 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:11 -0500
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
X-Inumbo-ID: d78598aa-476f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8nZuXC1MrfPA+ag+xrdjsccI48z2SFM/nWhpsLN5sAxJE2xWo90Fb8fC1XkTn4vs4ebhgBMjKJl1pNb4If1hl6x4JO4XZPYo6ancZr00CCwD9Rlk0WdA/e5fQargCPiEnuYI02JmDtpoVNjgZ6Sm5GQUSUTGmM/q5A7Yh70FN7hESNWWWnjYfkxOoPa7iIJade15gT75IqLJ45XE+6YtRtQXy2UZA+IcjcGO31ZidL5ExeyvBaVe86Gb9MNuldxOBPoC3TqbCUSRim5v4yV8+RCp8fCUta874jU2PLFCjyZiwNDRsvi9HU2336QwtffN5h3m+EY8e6Okd1Pb5AJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8Y3OSeAvLikxw9k7aYsrBhFILH2KIFALF4PKBRqUC0=;
 b=fAjrn0sPxdqLn+1FyH+DWq0muW6gHyXZ60lCB74PVOFHIf0CPK7zdwBtk+Q1+RceP51q7uUl5aiMX8ynaKXKkuR0BmHf83Uf94zHDHWUh4cMom2RNtDA6eIpysZbI0r10rPk6XP0Dzk9KzjxlEmnr80MSa5WhK0T/MsuoddX8A7btXO+ob2GcQ88Z5bvhk6DIVBWyNqQbfzIrpe1actzOUuLwm3totM6PXUSQVr8UMaBafM9L3WnYTZM8N5HcuiX7H18jzMnArtboX4NYeIHI3xNjkB2u3O/oJxzu9XBseRhC8V/N1IwUiSvRdYr2Qd4G9TzgWvyzZeYAnAbmaZUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8Y3OSeAvLikxw9k7aYsrBhFILH2KIFALF4PKBRqUC0=;
 b=zVslfNQyeWmW3Xc0OqhGGxSx2TGfDWUlwQ624abZnPnqpd1cxt8DnlmPc7eLhlJE2jiXP6Dd6dMkN6cPRFjhkbIYLn/OAPDfLL1VudsEVDlmF54fzpw4RUkBCTvMcJi5FpA8WjLldtAyrpmkatCzCDKWzqoJN2TGc8fGEzsbcHM=
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
Subject: [PATCH v6 5/8] vpci: Refactor vpci_remove_register to remove matched registers
Date: Thu, 12 Jun 2025 17:29:39 +0800
Message-ID: <20250612092942.1450344-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|BL1PR12MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: a348788f-8091-4d22-3fae-08dda993bc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWY3K1FCZVplQUE4QTA4STduZ1pNV0VqL3g3Z1NiUFhOVUp6ajEyV01VRHZr?=
 =?utf-8?B?T1VUd3pEUm1NbHgrcWNsc0hOVjMyVS9YRDN6WjNqZkk4QnFFTmtZcXAzMzRE?=
 =?utf-8?B?UUNCL0RDbXcxS3hXZVpHYnQzS1hLSkVpOGV4MS90TStOWGRaUWZLaFdWZTlL?=
 =?utf-8?B?TkdNanZibHBvcUtYMG9NeVJYbkdRNXRXVWoxaURuSXNxeDdjMHkvR1p4RzMx?=
 =?utf-8?B?d1p0dnhMOElBMUlTMVF3NkYvVkRuc2NzeHMvZEI4U1VUOGIzYkdaYWZET0pq?=
 =?utf-8?B?U1F1aGwyamowbVZBUHFZdnZick5qZXNpamZKLzFDTFM3dS94NG9waXFPWndP?=
 =?utf-8?B?YWQ2QkNWR3lxSFE3ek90aFdWT1AyZndRcWVycWowYWp5bmpwMEp2T3dQTWVx?=
 =?utf-8?B?L1NNSHcyVjBkd0tvWUhuRWhuekpickNaNXVnUWZ1cnlyWHZaTEQ0cW9lWmpv?=
 =?utf-8?B?dGNTVTNHMytVVFFpM0JqME9NaXFVeTRYbFlobXQvL0hTejEwMVArSUt6ck9t?=
 =?utf-8?B?NkEyemJPQ1R4L2V1TGwyczAxanJ5MndvZi8ybGFyd0ZBUkhUZEJ1czBzaEVC?=
 =?utf-8?B?Y3ZaaWJvNW5FWGhkejF1dzNNQks3WU15U1I4T1Nla1N3d3JCQkx2VlEyU0tL?=
 =?utf-8?B?UGZ1TGxpNTc4OG5POVg2c2pxQUdXazF1QW5DOWsxVnVxTVdmMnhJU3M4YmZP?=
 =?utf-8?B?OVJQNnRmampZNVlOU1BMdG5NSnRrbTlzWEVpZXh6UmVRc1hoZGFQSGthMWVq?=
 =?utf-8?B?bEdtdzJQNDA4QkFqSHVrRkk5WTNDMEliUjdLbGZ1bHgzV2ZuaXhGL1B4Y3pW?=
 =?utf-8?B?UHFGOGhSUEJ6bldCTE0yK1U3SFhZSmhwdmRMSFZPUVlRT0NtVmROWGc2KzVH?=
 =?utf-8?B?SElwZEEwOTVUZ0lOZWRpS2k5eEdCRU94YW5qRnRZMmh1dDlSeUFNQWlMVFZ4?=
 =?utf-8?B?NTNGYUZaMEpGUy9ERWErMU93MVpqaWhvWk5MTWNxNmMydk9FWjhLMDlDOVE0?=
 =?utf-8?B?d0I4OXQyU0ZuUUxPQWFWOHV4MU42ck1lNTVTYVkwM0F2ZmhsZHc5Nkg1RTNp?=
 =?utf-8?B?ZDliL05hdG5EVXg2YkhZelhoNFZJaDR0MURxb3VYV21nKzhtc1VTTnFlN1N5?=
 =?utf-8?B?bWJ4eU5WNmM2Z0FmcHRVMVIyYzFYaDJsa0E3Nk1QMmlsRi9QbXhRVjdxVnpq?=
 =?utf-8?B?bklRYnYyVVdmVjg5QjhJQ2lQMW8vODFPSGQ1MHc3UTNHVkNBU01EcEFTbnJr?=
 =?utf-8?B?dGVLZ050eG1JRmtua25OUE94Z0hZdy82QWhoUEpndDZaYmhackovS2lhaGNQ?=
 =?utf-8?B?eFB5TmZ4VklnZ1RySWgxSkxUdm5UZ3JJSXhvYVd0SlVzR3lBZTZwc1BBVWtC?=
 =?utf-8?B?S3R4MG9sZTV6SFZHSHphU3NrQnlselFFaGF0RVlJMjFGNXMzMXNFbTdkRlBR?=
 =?utf-8?B?Y3F6S0lVZTFkckIxajZhOERsM0htbis0ZmhBaVhsRnhPbnRXbnM5eXpVYkV6?=
 =?utf-8?B?K0Y1c3NhZFhIc0Z6UFJaL2YwRnp5MnY4Y2MwQmNLWXpPUTZVWlBVSmc0d005?=
 =?utf-8?B?dkdPcU9WaklCVW1TaHdyVVRSZUJDcDJFMXJxL2xEa2JGWk5LRTMrS1dFbGxH?=
 =?utf-8?B?MGlhZjFXTlhzc0p6MUFuT3I4b2dFUEJhTlFCM0srRUZicW9hNEgzdldDWUdi?=
 =?utf-8?B?ZlFWMzBEOUJMQkJnTmFIbVJlZUhwTFJyTS9IekVoSTI1ZWJERWg2R2podjhy?=
 =?utf-8?B?M053YytlaDhWNzNsaVNmVUlQTlZYREdYSGl4WStmdklyazdPZXJhSnp4cmwv?=
 =?utf-8?B?TGtPejFPcGpRV1pCYjFWQm8veGxjWjA4QktBS1lTZVZiWmpTWUM0RDcwbzVH?=
 =?utf-8?B?YWtlMHNUcGNydXdtZ252eTBxMWFuYmFhYUNtRzNLYnMwWUxzNUdsaUlyNkZv?=
 =?utf-8?B?ZzhwRDR3TDRjSlp6RzB6WXdQaVB5amhQcjFMamhtd2s5UjVLYkRCTHA1amc3?=
 =?utf-8?B?bFZrNzFuZ1RudnE4cmFEMGRHODNPUHJIYThFTUNLSzZndmtXbHZTOHNXajZr?=
 =?utf-8?Q?e10S+f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:13.5094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a348788f-8091-4d22-3fae-08dda993bc07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5825

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a range.
So, refactor it to support removing all registers in a given region.

And it is no issue to remove a non exist register, so remove the
__must_check prefix.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
v5->v6 changes:
* Modify commit message.
* Add Roger's Reviewed-by.

v4->v5 changes:
No.

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
index 0c266dd6a265..cb5c03a82cf2 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -152,7 +152,7 @@ static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
 
     prev_r->private = next_r->private;
     /*
-     * Not calling vpci_remove_register() here is to avoid redoing
+     * Not calling vpci_remove_registers() here is to avoid redoing
      * the register search
      */
     list_del(&next_r->node);
@@ -160,7 +160,7 @@ static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
     xfree(next_r);
 
     if ( !is_hardware_domain(pdev->domain) )
-        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
 
     return 0;
 }
@@ -552,34 +552,36 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
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
index 5da2cec9464a..1475019075c6 100644
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


