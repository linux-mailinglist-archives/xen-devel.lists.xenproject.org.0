Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA3AB0E35
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979880.1366392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgO-0005I8-Im; Fri, 09 May 2025 09:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979880.1366392; Fri, 09 May 2025 09:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgO-0005Ep-DX; Fri, 09 May 2025 09:06:16 +0000
Received: by outflank-mailman (input) for mailman id 979880;
 Fri, 09 May 2025 09:06:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgM-0004kr-0y
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:14 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db2b6bb5-2cb4-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:06:13 +0200 (CEST)
Received: from BYAPR02CA0009.namprd02.prod.outlook.com (2603:10b6:a02:ee::22)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 9 May
 2025 09:06:08 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::23) by BYAPR02CA0009.outlook.office365.com
 (2603:10b6:a02:ee::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Fri,
 9 May 2025 09:06:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:07 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:06 -0500
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
X-Inumbo-ID: db2b6bb5-2cb4-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTkJuZ3X5HAPNNSiGF5IWqKVj0vquD2ntxFZK3L6ePfs+gblLMrBc/PpgHw1LiYJV9GeLMYHHJ2o4XVx8YupqB007SG5VcNDuVlrQVxHM2xFwEUMc4XN5Xl8obXEwtSiCgJrjHCOhlrlBwy3kjPFp5d2Jq+3f1RXV3QbjStqg6TkXzGVC0i2aUHcuROVCzsuFIpJRoXTaqmKnIz3ZsSiUL4xIf4sHK/vP6lCbGYtTYNkX8ZU89xwpVIsGbD6ic6sSIAbDKKe6KP8EzYucNk35j2YFdAG04iVDkODDtH8QY73q5j0cpnMokfAyzxlKk38x+eFKwBL/I3AK2pAxb4Teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lURpKzTdDIzNS2eA3PDwf7XbZTHriapbBVD/3Q0erc=;
 b=YzCk3OvATCbj1g34enXQWJmruXOc+0I9yKWK3QxrNCsW1+sDtilGdxY4WzcgCIDgWLqtdwNk2J+7IBnw/loYYf40ENHIY1dEcRHN21oLfE1am9Gi/zFqJ9edsyFAiE+gVYNCnWvGCR6sZZsOV4z/P0j0z4LP2fkPZfYrGs6gAtFQX49GyFptP2BoDdW1cl2R0e1iEm9K0IewnNl0nndMquXbPT0PEGJey5S7HBawRPQ4ciDdTk6LYtQjf8+qPSOWQPtSZeT3dsPJLNdsbdPZ169mB3fUQqdxSfpQHhhv999IS2Vbx+eUjifvUOlQMivbCRuPOgiEqYI/F5nCjXd0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lURpKzTdDIzNS2eA3PDwf7XbZTHriapbBVD/3Q0erc=;
 b=5hQAYJVJlSEF1YTwwBG+B6O/zvpgQ5BxBZrgJizSeXjWSjNTTs/6R+EI9hEuciFhiV7eCTSrx5VeWQhus8jxibmlYreMNGLM1C7Qi7H8UhCj55YegLr05k5DukMZcXSIlIeFkoQ8VZdAnF8ftzk+/HcVBJGg08Dk3eqQ69OFpqA=
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
Subject: [PATCH v4 05/10] vpci: Hide legacy capability when it fails to initialize
Date: Fri, 9 May 2025 17:05:37 +0800
Message-ID: <20250509090542.2199676-6-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 161f6f34-fa8b-4e1e-24a7-08dd8ed8bc41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkNrbEhWY3IveW0rUEg3eGJ6SGoraVFBZUYvOWFvLzVkc0t0QTBlOGRQakM5?=
 =?utf-8?B?SElxS2tGWTBaK0J5RHBpbkU1cFVueVg3MVFMM25sQ3l5d2xqODdvS1diZksx?=
 =?utf-8?B?Qk9DQmhKTjU4ZmlaSFRLcmhabHlmSStidlpFNCtscWZQUDhhNTNTb3ROcFg1?=
 =?utf-8?B?am0zN2NOSTBNNkZGaUM4eUhmSXByOS9hbjN1RXExdGM0MVBjMS9ub29vV0N4?=
 =?utf-8?B?UzlBUU9DUWdFblZ3dnlqYXl4NTNhRTlOL0NLb21VQWhzTURUSkxsMG1EUk5j?=
 =?utf-8?B?UWZqM1hPZzUvUFVhOWZaZTJ2QklhTUM4cmRHN2RJUGpDV0IzK0NQZXVJVTZG?=
 =?utf-8?B?SlZpSndDUzNzSWhiZitsTG0wOHZ5S01HTlRNZzVHS2h0UGNuUm93b0sxUVZO?=
 =?utf-8?B?WldYR0xQMzlZVVh1TGlWRzd5c3U5NUxkeVp4bCtCNWxIMFlTcGR1YU1KRFB5?=
 =?utf-8?B?NWozL0lieFQ5L3FHbXlKN0kzNjlyaUhYaXhVN24vdE1PMTFES0ZsL3BGOEVI?=
 =?utf-8?B?TlhUbVMvK2I5bzY0OXExbFVnaHlPWjhSYmo1VG9DL00zQ0wrY0F6cTV2dGk0?=
 =?utf-8?B?S0J5bUdjbU1oTTFLV1hyd2NFNWdHTUo0aWFlVzk1YWx2MUZXUXRCUlA4QTBi?=
 =?utf-8?B?RXh2TEY5YlZ3VDJVcjc1RU1ZK0VzMSsxbUNlMU9lenZheHRkV3hCNmlNQ2hn?=
 =?utf-8?B?MmJCUUtLaXdiaWpFOUVSUGdhbUhIM05RWEk4Wm9WQzlNK0lYQkE3SjRHd1Na?=
 =?utf-8?B?bzlzWEIyNHZaczhIOWJjdFpwQVRKWEJBUVluNVRVMVRORHRrYmxpdUdOcmlF?=
 =?utf-8?B?K20wR1BEdGFIc1I0Yzh1cTA3Mld6NXpDQzF1N2xRZmR6VnRHcHpJY0dKY2Iw?=
 =?utf-8?B?a1ZtSGt2TmYvcGNpcmNRamc4eCt2MDlncm5zN0kyZ3ZKcnUyZFkvUmlLTzlO?=
 =?utf-8?B?dGhkd0tMV1I4SXhYMEY4Z3B4elhFMjFPMGgxWHA0TjNKTmQySmdzNHdvUVZL?=
 =?utf-8?B?bHJHUi92Rno4cDBwU1VtMWF1ZWEvTjJab1RSUE05eVlVVU9jcjRpdXN0NkN2?=
 =?utf-8?B?NGU1UVpiTWtEVTdzemhVNWRGZWZwMVQ4ZzN1SStyUDJFOWFLcUlFbkRHcVRm?=
 =?utf-8?B?ZDVvZ2ZHTTdCanFEVyt6bTh2cElkSENxQ1pWblg2U2JuRGNCTHVrUW9xbHpp?=
 =?utf-8?B?aUYraXFRcFZmRURVaE8zM1JnQS9JQjNZalk0dmRFVDNSYzZyZFpwVGZqWXRz?=
 =?utf-8?B?QURIZCttTW1BUXJKNUVyUDFGYldUQitETzhhdFZIWDZZZmlISWQyeWE4MFE4?=
 =?utf-8?B?KzRXdXZBUlJsMnplWmlkSmtTWUkrcG9COGV2WFE0cjgvNStvM2V4SmVoVE5l?=
 =?utf-8?B?cXdRWDRVcy9YYkhieEFHT2REYzNzVk5CQVE2QitTa0M4TVJUcDdIbU4wclB3?=
 =?utf-8?B?bjVUV25wbFoveVpQNlhVbU1Yc2xzYmZxWUdiRHNaQlo0N214eTBOdTFBN3oy?=
 =?utf-8?B?L29HQkIvRjdxN1FRdTI1V05RazdZQnpWMVhnaHkvQjNDeWhXRVcwLzBJVFRr?=
 =?utf-8?B?NkNycGdLU3lFN2ZVODIyM0FjSHRxR055UHJHTzdNWlcrU054MzQ5MlFpcFJz?=
 =?utf-8?B?WFdSbnA4d0VxOG9Jb3l3R3dqVWo1QUVwaVNjb2RZRXlQZVcySmZkUmsvV1Fm?=
 =?utf-8?B?Ti9sbnFTZUFDYUxiRklSWFIvaTlMdEVHSHhPRHhyR1JjRmI4TU04M1Fqa3Rz?=
 =?utf-8?B?cmg5cmp3dSt2dFJ6ZE13NWkzdFV2ZTdNWk91VlNNYkdYVFNqdUJTVUFxYk4x?=
 =?utf-8?B?bDNCQWRoWFJ0a3d6MHB3T0RaNEZVL0xTYjNFMXkzTytUT3RtVXBrWGtTa1Mr?=
 =?utf-8?B?cmxUMkdsYjMyVTlmdVErdWd1QmtHTU1mdWtVQkpWRU5uOUs5eDI4YXlGSngz?=
 =?utf-8?B?VVd2eDNKUEFMR3pxdDZZNnQzV29UUW8yK3FBaDZocU45NXFlb2MwbTlheFBv?=
 =?utf-8?B?OFlOTzlHUzh1bTdZYldwNkhNK3RabnJRNGgwbzhrb2JPVTJpMFhVc0pUQjFk?=
 =?utf-8?Q?RQukgV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:07.7555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 161f6f34-fa8b-4e1e-24a7-08dd8ed8bc41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216

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
 xen/drivers/vpci/vpci.c | 142 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 125 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f03e1a8eebc0..e1d4e9aa9b88 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,6 +35,22 @@ struct vpci_register {
     uint32_t rsvdz_mask;
 };
 
+static int vpci_register_cmp(const struct vpci_register *r1,
+                             const struct vpci_register *r2)
+{
+    /* Return 0 if registers overlap. */
+    if ( r1->offset < r2->offset + r2->size &&
+         r2->offset < r1->offset + r1->size )
+        return 0;
+    if ( r1->offset < r2->offset )
+        return -1;
+    if ( r1->offset > r2->offset )
+        return 1;
+
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
 #ifdef __XEN__
 extern vpci_capability_t *const __start_vpci_array[];
 extern vpci_capability_t *const __end_vpci_array[];
@@ -83,6 +99,100 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static struct vpci_register *vpci_get_register(struct vpci *vpci,
+                                               unsigned int offset,
+                                               unsigned int size)
+{
+    const struct vpci_register r = { .offset = offset, .size = size };
+    struct vpci_register *rm;
+
+    ASSERT(spin_is_locked(&vpci->lock));
+    list_for_each_entry ( rm, &vpci->handlers, node )
+    {
+        int cmp = vpci_register_cmp(&r, rm);
+
+        if ( !cmp && rm->offset == offset && rm->size == size )
+            return rm;
+        if ( cmp <= 0 )
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
+    r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1);
+    if ( !r )
+        return NULL;
+
+    next = (uint32_t)(uintptr_t)r->private;
+    while ( next >= 0x40 && next != offset )
+    {
+        r = vpci_get_register(vpci, next + PCI_CAP_LIST_NEXT, 1);
+        if ( !r )
+            return NULL;
+        next = (uint32_t)(uintptr_t)r->private;
+    }
+
+    if ( next < 0x40 )
+        return NULL;
+
+    return r;
+}
+
+static int vpci_capability_mask(struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
+    struct vpci_register *prev_next_r, *next_r;
+    struct vpci *vpci = pdev->vpci;
+
+    if ( !offset )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
+    if ( !next_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    prev_next_r = vpci_get_previous_cap_register(vpci, offset);
+    if ( !prev_next_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    prev_next_r->private = next_r->private;
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
@@ -106,7 +216,21 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
         rc = capability->init(pdev);
         if ( rc )
-            return rc;
+        {
+            if ( capability->cleanup )
+                capability->cleanup(pdev);
+
+            printk(XENLOG_WARNING
+                   "%pd %pp: %s cap %u init fail rc=%d, mask it\n",
+                   pdev->domain, &pdev->sbdf,
+                   is_ext ? "extended" : "legacy", cap, rc);
+            if ( !is_ext )
+            {
+                rc = vpci_capability_mask(pdev, cap);
+                if ( rc )
+                    return rc;
+            }
+        }
     }
 
     return 0;
@@ -201,22 +325,6 @@ int vpci_assign_device(struct pci_dev *pdev)
 }
 #endif /* __XEN__ */
 
-static int vpci_register_cmp(const struct vpci_register *r1,
-                             const struct vpci_register *r2)
-{
-    /* Return 0 if registers overlap. */
-    if ( r1->offset < r2->offset + r2->size &&
-         r2->offset < r1->offset + r1->size )
-        return 0;
-    if ( r1->offset < r2->offset )
-        return -1;
-    if ( r1->offset > r2->offset )
-        return 1;
-
-    ASSERT_UNREACHABLE();
-    return 0;
-}
-
 /* Dummy hooks, writes are ignored, reads return 1's */
 static uint32_t cf_check vpci_ignored_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
-- 
2.34.1


