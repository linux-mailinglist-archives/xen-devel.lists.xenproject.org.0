Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4533AD6C2D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012640.1391157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGL-0000at-Ta; Thu, 12 Jun 2025 09:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012640.1391157; Thu, 12 Jun 2025 09:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeGL-0000Wf-OS; Thu, 12 Jun 2025 09:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1012640;
 Thu, 12 Jun 2025 09:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwpW=Y3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uPeGJ-00081C-SC
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:30:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:200a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d50557f4-476f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 11:30:09 +0200 (CEST)
Received: from SJ0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:33a::27)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 09:30:11 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::5a) by SJ0PR03CA0022.outlook.office365.com
 (2603:10b6:a03:33a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Thu,
 12 Jun 2025 09:30:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 09:30:10 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 04:30:07 -0500
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
X-Inumbo-ID: d50557f4-476f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLZM0ebFaTYV/xX+esO7FhUt71lwxMuU63WRBAEYzUAhpNVWxwHOk0XqfDdlqkGaq1ZtMMw8mHInE9xwElh/zXwsEf81Hxmo4yP41Oiv2UXYTBb7MKLS2XzZAhEirVdvCTFpjYv4xxaeQPx3XslDm+wsgzSlkvBgVn339ddW1XN6cbu+7JY+1XCpqGZweX/I1xGywuIDV4U+RlRIIiMM/HeLalM33DC0KJyCUZYjdgpso5Xzwjf1Em3aLLDyrPu9oM0hc0coD6kD9TdZyMeP2lpBN9uzp91SrUAye/aXGZSceC1mOfvegMP/n5qv57x8fCfydNnHeGRLaXzqwgPP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9KdbEQaARbJLgJn///XgZA+tXdZ97Q/sZfZD9UHRes=;
 b=wb/2fq4G8KiHAwnbTVt3NyN9boBS//p5tskLfStgvQVPyNshre/YWgBELVtSqs5ffBlCw2BQEEIXrFWhbrDEJE7FyYfkXzAs7t1SJpOH2lGK52uo8IH9w0J4eMR44t1rA/MBhJBIYqK0pyqEk/5HCHOQBe3TkjOBr0BVi0X7lRkqDQTooq5Do3K02BUCW1dw87W6iG2OZwiAg+BsRmhfi4VLFcIQSlkcr6+KRiuPGu4A5p5RBR+8mEIj5GPaAqi/osDiD1m2xLyhadqIUE1jsDCVxtLCtiz85cZHJh1q+yiKlPEv843HFQa1QE8L2hwihBjY/BXffq+k2gaPTIAEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9KdbEQaARbJLgJn///XgZA+tXdZ97Q/sZfZD9UHRes=;
 b=2dFrnc6b6n8ZsehgUBXwlAP1AgEgjZ1kNFddFIRQxi2U2CIEfO7Gl7wgBLwOdHSdGGCAgLRfH92wzQOW8UeZ0Zs7xy/cgdWtk1b981BjzqX/VoFwxKKnLbZDicR+0ubTtxvR5dm9d77fGbMRLtJcMJpW2tCATeWb3hrKrLRz0nQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 3/8] vpci: Hide legacy capability when it fails to initialize
Date: Thu, 12 Jun 2025 17:29:37 +0800
Message-ID: <20250612092942.1450344-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: e56b6d90-2baf-4cf9-5181-08dda993ba4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFFCUVhKNHI5YjZCMDBrUnFoeG53WTBKbzBvNkU5d0dUdkVFK1BVT1VrOUlV?=
 =?utf-8?B?NlV1cEpKNlFkZ21QS0ZiTWtSUldOcjd3UW1TNmY3ZnU5Q0ZlK1JWcmNsZkZn?=
 =?utf-8?B?Yk1LTWhLdE54NjByUkU0RCtyUkpKa3pMUk54Yys4ZDgrVFBNT29GekliMTk3?=
 =?utf-8?B?U21ZRzNudGlJYy9GRWxmQXV5eGhOUmxyU2xNOWZ3cmorOWd6RTkzZlI3c1F6?=
 =?utf-8?B?WERELzYrbFROYzhFSjBKMi93MGNFMnRKbGVkMFZaLzlERXNwL05WcXFTOCt1?=
 =?utf-8?B?aHlZZ1BKeDFlVFkyK3M0VXl3QnR6MGVRV0xCdjhwZXBHVlRFbWlyMFBaYWs5?=
 =?utf-8?B?V2V5UnJtMmVtV0E2VTJ3MTZjeHhHZE5la2REOTEzVVFOb1RwOFh3MGsyeW1o?=
 =?utf-8?B?cjJpZjhoZG1NQm1PdVJlZ1laUWtrU0YvM1lnY0xCQ2ticG05YjdtUHBoVmk2?=
 =?utf-8?B?UkJiOFZsTzFiSi9MQytBQmh0R1d2TU9WSjBJelgrZEhPYlNtalY4OENscnk5?=
 =?utf-8?B?b0Y3c3gvK0p1amZEdlZiN1ZJVVo3S2JpbG9uWUZicEgwTC9tVjFlMnp1SE4x?=
 =?utf-8?B?U3JjNEIwUndCNzhHN3VQdnFXWFl1ZHByU2RyL0RiR3FDMkRxcnpSOGtHVElo?=
 =?utf-8?B?K0hoS2hjRVQ1TEhybU56NVNFTkpsT2UzaGcreGVweXVOYUNCUC90NThqY3V5?=
 =?utf-8?B?SVdMOEl6d0IydDRIYllSdjUrVVBuajlkQkNIeFVlWVFHZlJYR2xrKzUzM0V6?=
 =?utf-8?B?ekhVNlZVdTBCUXFtT0JxbWYrN1hYMGhCWm5icFUwL2lGTmo2cGQ3bzhLdUd6?=
 =?utf-8?B?cjBRbEdDSU5CVVJsd3FBelc0bkprWWNWbllHSEx0elhqTFNiWWFrZjNaZ2lo?=
 =?utf-8?B?S1JkblMvaS9obmdMdHJ6Y244MGg2a1AxbUE3TDI3UjcwL2gvWVliSUhHUUFu?=
 =?utf-8?B?S3Q4ZFM0UWZCd0Z1SU5Vd0NTNVMvVmpFNkJhQ3JvTTJQSlQvUTVJZ0dIV2Z0?=
 =?utf-8?B?SHFYSERheWJpM1IxNEZ6QXVtb0ZNTjJwSnJyelZBeG85cGNUNmdGNEZPSDRG?=
 =?utf-8?B?VE5naFQxdklxZ21CR3ZhMzZNUGhtc0ZwenN0aHJyYVRCRlZySENxS1RRaUIv?=
 =?utf-8?B?ckNKNkk1MlVxZXhTZUVvZGVEZ1VUb1F5VUg0SkFqSFNzdk1zNTUzaXhrNVFU?=
 =?utf-8?B?RThyQTZqYnJsWGtDc285MThOUk1ZTnZsZUluTUwrZ0NPTHFYamJSOVVKSnkz?=
 =?utf-8?B?em1wUWRNRWR2UjZSdC9Qa0xVUzhEYWNpS1VCSjk1QTNpV1ZkT1NvTWt5Zitx?=
 =?utf-8?B?ZVB5VFR1WFM2VDgwU0lWbGpUc0MyRHRMYjJuVmV6akpXWGFmbGpISVluWXZN?=
 =?utf-8?B?TzJTZ2lqRnI1SlZZbHd5bTE4MGg0SGl1bnhBaWg2aHNpWmJxSWFtZnIxNVI0?=
 =?utf-8?B?MHhROGJWNTVvTHVkcDQvamcwRFFjZE1zOHVJMG43S2p4OFR5TFdvNFlJaExZ?=
 =?utf-8?B?R1dsYy9kTnY4Vmg5dGFoeWtOZThPZkl5MmJHaVBTUVdTTUY3SzNnaEFVUjlo?=
 =?utf-8?B?dUhYek9hdUNpakVscWhBMk1seUxuaE9CeFV5enpFbkxKcWdDdGpjRThQYUF5?=
 =?utf-8?B?MVhjMFlPL2ViaThldm1Sei9NSEFYOG1NdnQ4TlBUMkI5M0tlWGowYmc3WEk3?=
 =?utf-8?B?M0pBdE5zTXJUU3V1Mjk0am5KeE1LV3ZwWTExRnBCRzc2bnJRMWZKdmRXOEVa?=
 =?utf-8?B?aGJVcWNmZE54azFVTjRQajZXMTY3OWViTU5iL0lPT3FVZE1vZDVBZGV6MFZD?=
 =?utf-8?B?aCtxYlRJQk0wOVk2QkF1dE1CRVNNdWNXbHNkWFZudlBlWTZzekFNRGMwVm1j?=
 =?utf-8?B?SG5KT0RGMDIrUk5yRi95cU9uL1ZxVTlPN08wTVhCZElQUnZzQzlIVURiLy80?=
 =?utf-8?B?MzBBWnZkQlNjZUR6TUpXT2dCVTJWT3RTVzVnUWw0bTZLREdFM0dmY1dNRXFl?=
 =?utf-8?B?dU1qMHJtSHhIa2ttNFg2TGFOVXVsQ01QelVERmZmeFZTa2RCTEpCbVFNYW1q?=
 =?utf-8?Q?2Kr/EI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:10.6049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e56b6d90-2baf-4cf9-5181-08dda993ba4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288

When vpci fails to initialize a legacy capability of device, it just
returns an error and vPCI gets disabled for the whole device.  That
most likely renders the device unusable, plus possibly causing issues
to Xen itself if guest attempts to program the native MSI or MSI-X
capabilities if present.

So, add new function to hide legacy capability when initialization
fails. And remove the failed legacy capability from the vpci emulated
legacy capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v5->v6 changes:
* Rename parameter rm to r in vpci_get_register().
* Use for loop to compact the code of vpci_get_previous_cap_register().
* Rename prev_next_r to prev_r in vpci_capability_hide(().
* Add printing when cap init, cleanup and hide fail.

v4->v5 changes:
* Modify vpci_get_register() to delete some unnecessary check, so that I don't need to move function vpci_register_cmp().
* Rename vpci_capability_mask() to vpci_capability_hide().

v3->v4 changes:
* Modify the commit message.
* In function vpci_get_previous_cap_register(), add an ASSERT_UNREACHABLE() if offset below 0x40.
* Modify vpci_capability_mask() to return error instead of using ASSERT.
* Use vpci_remove_register to remove PCI_CAP_LIST_ID register instead of open code.
* Add check "if ( !offset )" in vpci_capability_mask().

v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize"
* Whole implementation changed because last version is wrong.
  This version adds a new helper function vpci_get_register() and uses it to get
  target handler and previous handler from vpci->handlers, then remove the target.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c | 109 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6e768bb32447..f61dcf9e8131 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -83,6 +83,88 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static struct vpci_register *vpci_get_register(struct vpci *vpci,
+                                               unsigned int offset,
+                                               unsigned int size)
+{
+    struct vpci_register *r;
+
+    ASSERT(spin_is_locked(&vpci->lock));
+
+    list_for_each_entry ( r, &vpci->handlers, node )
+    {
+        if ( r->offset == offset && r->size == size )
+            return r;
+
+        if ( offset <= r->offset )
+            break;
+    }
+
+    return NULL;
+}
+
+static struct vpci_register *vpci_get_previous_cap_register(
+    struct vpci *vpci, unsigned int offset)
+{
+    uint32_t next;
+    struct vpci_register *r;
+
+    if ( offset < 0x40 )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
+          r = next >= 0x40 ? vpci_get_register(vpci,
+                                               next + PCI_CAP_LIST_NEXT, 1)
+                           : NULL )
+    {
+        next = (uint32_t)(uintptr_t)r->private;
+        ASSERT(next == (uintptr_t)r->private);
+        if ( next == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
+    struct vpci_register *prev_r, *next_r;
+    struct vpci *vpci = pdev->vpci;
+
+    if ( !offset )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    prev_r = vpci_get_previous_cap_register(vpci, offset);
+    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
+    if ( !prev_r || !next_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    prev_r->private = next_r->private;
+    /*
+     * Not calling vpci_remove_register() here is to avoid redoing
+     * the register search
+     */
+    list_del(&next_r->node);
+    spin_unlock(&vpci->lock);
+    xfree(next_r);
+
+    if ( !is_hardware_domain(pdev->domain) )
+        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+
+    return 0;
+}
+
 static int vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -103,7 +185,32 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
         rc = capability->init(pdev);
         if ( rc )
-            return rc;
+        {
+            const char *type = is_ext ? "extended" : "legacy";
+
+            printk(XENLOG_WARNING "%pd %pp: init %s cap %u fail rc=%d, mask it\n",
+                   pdev->domain, &pdev->sbdf, type, cap, rc);
+
+            if ( capability->cleanup )
+            {
+                rc = capability->cleanup(pdev);
+                if ( rc )
+                {
+                    printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
+                           pdev->domain, &pdev->sbdf, type, cap, rc);
+                    return rc;
+                }
+            }
+
+            if ( !is_ext )
+                rc = vpci_capability_hide(pdev, cap);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
+                       pdev->domain, &pdev->sbdf, type, cap, rc);
+                return rc;
+            }
+        }
     }
 
     return 0;
-- 
2.34.1


