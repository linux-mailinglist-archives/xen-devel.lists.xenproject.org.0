Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9CAC3D31
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997345.1378268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPh-0004gn-9Z; Mon, 26 May 2025 09:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997345.1378268; Mon, 26 May 2025 09:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPh-0004eo-6F; Mon, 26 May 2025 09:46:33 +0000
Received: by outflank-mailman (input) for mailman id 997345;
 Mon, 26 May 2025 09:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPe-0003hH-UB
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2415::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ce2042d-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:30 +0200 (CEST)
Received: from MN2PR15CA0063.namprd15.prod.outlook.com (2603:10b6:208:237::32)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 26 May
 2025 09:46:25 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:237:cafe::22) by MN2PR15CA0063.outlook.office365.com
 (2603:10b6:208:237::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 26 May 2025 09:46:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:25 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:24 -0500
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
X-Inumbo-ID: 4ce2042d-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWsjEDzNCh53YBZMPzNv8owVUajKZ3rIfxdID1DjkXPtEMmSJRzbQoVbWwL9cvMutN9C+L4bnLmy7R3P+8lsXyV1cf7TlGfreTk4lUdDhzuOr/GVfFGEjWkCvoAPV3Xv4ALHXQf/7h/BHbAqvYi9IqgIckT38tshgW7+POQCLP851qETYN0REXgEEaTNenQilX0Bq4wkF2HKqw/0JyDrvUGgcxww+LC/0Vj98F+yViEjuNG0zunH8RQ1DHeq0+LmTG99lSR+z8KKF1G+NjH9HutZ2kyVBqz4jW7a2VJ0XOlPZ125aqk609VjWHiV0oOiWN0PemB66aKoIJu1JQhSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKPMNclJOluHYnlqetY+d81+gl5XyN6bNJSpIWX/+lI=;
 b=fQtleOzZUCP01ZwD7z14LVZ6qpZMlCUFRLMpUObmPIFCNpW5p9VQV1nagioVFEe611L9Hhfyo9ZH2/LICz0w9NuNmJatGF9kA9MSt2NXSwH33slH7kxT/ONhHRF1q7rSNwjcgMwYhbDLF2/BFhzsA4SPVQQQC1ijg8AvZI5cN+oU1oMenbMKM8aoTG4rEnfS4rYfQz7lIBoxFu0GNDax0fkYrZrQ9UtrRa/WvO3Sz688CYM+L5w7Jmr2WDYECgBYeJdYbJORCAljchcarvUfZIz/UEgtGgm/BdJRue0Lsyv5Vs596+XaUs0Ej9brF/Ja/qZ+zzLwssPBh0o99fqPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKPMNclJOluHYnlqetY+d81+gl5XyN6bNJSpIWX/+lI=;
 b=TCvLHTzZ/cAWHRMfWjEe7kGZj8h0J1daxIKzUJ+PTORTGG9vRzJeCVHWcBNHhUn7IoTZGbLT2j4masSaLcCaVaPdRNMiAcPKidliavm/6Vl3Hirlo8nQaDWU4jTsUZLj+hnz9f1LjzGEgfvOSXR866BxNU5zWCSRu96oavRDOwo=
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
Subject: [PATCH v5 05/10] vpci: Hide legacy capability when it fails to initialize
Date: Mon, 26 May 2025 17:45:54 +0800
Message-ID: <20250526094559.140423-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526094559.140423-1-Jiqian.Chen@amd.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: b98aa00b-3e19-45e4-3721-08dd9c3a2e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTlaY3FVc1dTYWRkbDBsNjVPaytlMmVhdDFuNVZDY0wvbmJiWWVhaG5Rem9H?=
 =?utf-8?B?SFM0OER0Mk9YQVFwRUh1a1NOYUtURlBNb0FVZVBVYURGaXFua3lsY1VWV3Nl?=
 =?utf-8?B?d2tKdjh2clRoVkJnM003eEQ2b1oxdmQ0ekg0RUZ1L1JjRlVnQ1lGbW1IRFBs?=
 =?utf-8?B?ZUdKd1dXWWxOb1hHUExYV1FiOGI4ckpWYzNxSDA3Z1VyczlLeTBZcVFQMk5h?=
 =?utf-8?B?Q3NqN0Z2alRqSzEvMEQ5UlZTRTFuczVGZmFCM1pVRmtSSEZMZXpLL2R5bHJ2?=
 =?utf-8?B?a3AwdE1qVkxuell1RC9kSTJ3RWhnRk1nQ0VZQmt6c053RitQemRkSGNvOGs1?=
 =?utf-8?B?bmpRZjIrdWxsMm40NDNPb1Q4c1JkTHZmbGJSTXZxSHFDRGF0bmFkT2VJQ2Y0?=
 =?utf-8?B?RmNGY2RvalJvWWRUaTdHL0FWemJSWE8wSGdYY0lscFpXQ3BsK3ZqZlZjbU9F?=
 =?utf-8?B?aGFhdTMvd2tOaUxBeHpCZ1BVSXhmY3ZUamFiNzJST01BcytQdmdCMGhzYWlG?=
 =?utf-8?B?eTFOY2RDbGRiWWIxa2Y2STFqK3NWanRhMTFIM0dFR0tubldmcE5WVnNyTnVT?=
 =?utf-8?B?bmx4VVNpNlVXdUJJcURtVkg2YXNJSUJ6NkJYQ3I5dVM1S2NGYWZCM0YwUndO?=
 =?utf-8?B?MHVPbWdMZzJZMGhCck92ck5iL0VtOFg3S3Y4R2I1QkdRTGF2d0Z0Z0lodHJK?=
 =?utf-8?B?d2hFQWJOWnlEWU81eHRQbW5CNHpFaDVrdHRMUXF3c2t0NjVJaG56T2dmbVla?=
 =?utf-8?B?ZnFjN21DU0h4ZkFqeEVXOGcrSGtld2FDSDFJSG1vajhYb0xDZEtRejlaYVZ4?=
 =?utf-8?B?ZmxIV0NibW9mbDVUT3F3KzBtT3VGUXNYTlJsRGdlOElNL2tWZVZoeW1DUDNv?=
 =?utf-8?B?VkhtbGhPQ2tScWhXeHRrRzFoV1dKTTI1eHl4cExTUS9mTXVPLzBKNUdKTHNL?=
 =?utf-8?B?V25KQ1lKay80ZjIzYU9Hcy84NlUzUVhyN3ZDMER0S043V3lOV0haQWtnZG44?=
 =?utf-8?B?akJvL3NNaW52MjZOditSekRNUXFwNmNYY1RiOVVjNFg2YjV3SkhOQXI4TUdZ?=
 =?utf-8?B?NThqbmZWcURDS1RGREVQU2orc3JVUUdtdGZaYnhLWVVBNmpsSXFybEZwK216?=
 =?utf-8?B?Yml0TFc3SHYrTk5GWWNSbGt3U01TU0xQOHVqSnJpNHRPNmxGNUpTQWZyaDF4?=
 =?utf-8?B?TEJJSVdxUHhoZU9hRmo1MkxOTDJiVXV1MFV4dTB5WFVZd0JzUTJNNGlPcFVH?=
 =?utf-8?B?bERzWENnWWQzODZyc1hnZWdycFdKV0ZUOXhSZm5HVWYzbGcxbkFWTk9ERUR3?=
 =?utf-8?B?MjJoUFRHS0NrYnMvNTBDMlZBU3JZeFJUQUFvdVdoSEVvOHVmTzRXSWZoWlpx?=
 =?utf-8?B?SVRuWU1pUGMwSlBTakJxR281N3hkMTRtQVMrNnQ2VUJkTFo4TFk5Zmxkb3Fl?=
 =?utf-8?B?cDBlcDFHcmxKTCtZelhPMUtIZXNKUjN6L0hSdWZwRXZuRk9zUjJ1alhubWJ5?=
 =?utf-8?B?UzR6U0E5cGxYcEs4MnBYcjBGSjNBaXNIbDRvaFBUb3puUGx1MGQvUmgzMVBH?=
 =?utf-8?B?L2NzeUZxYU5HTjZEY2pTMnJERnN0OU5Wdjd5VEpxWmhDVlp5TllGbzBqSVdL?=
 =?utf-8?B?bHdFTmlralZWbkg5a1V5ZSt4eDl5OFBmeVJGSkMyZ0dhYlRvdkZrTUlhK2Vr?=
 =?utf-8?B?TDBZejF5U1ZGbWgyRG5QN2R5Y0Z6RlBHNzNjUHJ2QmExS1hhWTdHNiszUjJM?=
 =?utf-8?B?bk5mNWV2NUg2NWtDa3Zzcm0xa0x5TkVRTExNYk1ZekNBZi8vUk9iejVRUlZp?=
 =?utf-8?B?KzZBT2N2bnZrUlBDZmMwMDQrVVFUWkFidVRVbDQ5L3RESVR4TEtQMm9NQjE0?=
 =?utf-8?B?V0h3V3hkenFwQUl1NDhuWCtmMUthQ3BkeElIcnVKYjBwVS9oVHE0MVJpQnpi?=
 =?utf-8?B?RlpHU3NQaDUveGcxbU11TTVibjBNRlBiNk9QY2xoR1F0aHJzSkxlTk5yVnk5?=
 =?utf-8?B?OG9kMUdXWnBoU0YvTFJ0SGszSERkOWM1WURNWEgxUjI1Y2ZMdFUrb2xYSGFz?=
 =?utf-8?Q?48wY9y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:25.7128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98aa00b-3e19-45e4-3721-08dd9c3a2e6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124

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
 xen/drivers/vpci/vpci.c | 117 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 2861557e06d2..60e7654ec377 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -83,6 +83,99 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static struct vpci_register *vpci_get_register(struct vpci *vpci,
+                                               unsigned int offset,
+                                               unsigned int size)
+{
+    struct vpci_register *rm;
+
+    ASSERT(spin_is_locked(&vpci->lock));
+
+    list_for_each_entry ( rm, &vpci->handlers, node )
+    {
+        if ( rm->offset == offset && rm->size == size )
+            return rm;
+
+        if ( offset <= rm->offset )
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
+static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
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
@@ -91,7 +184,6 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
         const unsigned int cap = capability->id;
         const bool is_ext = capability->is_ext;
         unsigned int pos;
-        int rc;
 
         if ( !is_ext )
             pos = pci_find_cap_offset(pdev->sbdf, cap);
@@ -103,9 +195,26 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
         if ( !pos )
             continue;
 
-        rc = capability->init(pdev);
-        if ( rc )
-            return rc;
+        if ( capability->init(pdev) )
+        {
+            int rc;
+
+            if ( capability->cleanup ) {
+                rc = capability->cleanup(pdev);
+                if ( rc )
+                    return rc;
+            }
+
+            printk(XENLOG_WARNING "%pd %pp: %s cap %u init fail, mask it\n",
+                   pdev->domain, &pdev->sbdf,
+                   is_ext ? "extended" : "legacy", cap);
+            if ( !is_ext )
+            {
+                rc = vpci_capability_hide(pdev, cap);
+                if ( rc )
+                    return rc;
+            }
+        }
     }
 
     return 0;
-- 
2.34.1


