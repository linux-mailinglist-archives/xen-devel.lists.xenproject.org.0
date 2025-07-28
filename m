Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3BB133EC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060933.1426476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2S-0004Kx-Eh; Mon, 28 Jul 2025 05:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060933.1426476; Mon, 28 Jul 2025 05:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2S-0004Ey-B1; Mon, 28 Jul 2025 05:04:40 +0000
Received: by outflank-mailman (input) for mailman id 1060933;
 Mon, 28 Jul 2025 05:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2Q-0003wp-N7
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:38 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2414::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5be6da68-6b70-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 07:04:38 +0200 (CEST)
Received: from MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::19)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 05:04:33 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::6c) by MW4P223CA0014.outlook.office365.com
 (2603:10b6:303:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:33 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:29 -0500
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
X-Inumbo-ID: 5be6da68-6b70-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xurq0fRJizwurXnjHq5UTTEppK+0HB0GvMu71k7hLfWoX8XGu8sUsddTeJY8xC86+vUzra538zgVubkncQpnQ4y0JHUrx5W18UtWuXoUvqbU14bNaujVQvGEbA9EsJxalx3wr3Wl/HelqyEDVo+iCe1BThaL5ulVS98TM9u4euOZcIIZxMxp+BlR6tv2lrsuExWu6RDkH6wR91hG11nG6LO9exkvJhjRWez0rknJVcHN0zdvdBLVCrZYWluPuv2q9h/ABssnJ3jn1LB7AAxyOVfrk3KOn1TrPDeIfD45veH1O1c+XUIEjkNx/W3lNga7r2ftKyYIk4+P2Ru751xt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVnRuIF9Xlf3s2Bj7dmIR5W9LY2pXUw3uqJDtszH0Tc=;
 b=t4SGC55O/FJWtisY8J2WijKyKluHwv9DUlzKo6Bixy0nzuu6QbD7drDJm9NjicQEikcOdF8Xaf7INwHFunR1nHyk6s2jrazerfi0kBS/YrymQv6xLlqTGdOoWXboDd5bg4L8+2JisHdQIjoE4MfG7aPW/dnC1brXXiPvvTfd5ONPdlHmdhIohQjFBQ74vYf73P8VriviEl/NbIvWnRdgVr0lEG2YecUWEBzzPCws+MCwZvlkFujjglvR+YR0/d+/FUGLg9++hdLGYQRDL3NVhLHyMBA5Gy3roGvl3gztGFD9EO5VvrCNK1yXSFmt0z5+hJWz/tIICwKz4dccebt/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVnRuIF9Xlf3s2Bj7dmIR5W9LY2pXUw3uqJDtszH0Tc=;
 b=haS1g9Lhwb0aM2oawBH6Mk2lQSyicR8kuPuTXMT5yFXBSwo6Pbr9SPDwYqnjaLROs+IbBWrm6RjFIfFxGwfmSXnPmenrdYXUqm2T0+3AnR6mCzBIVzQLTAdk723t+ffGYcQbHHVH42gc0qD4Ds631nODRzntM5EnICCDRnkTUUU=
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
Subject: [PATCH v9 3/8] vpci: Hide legacy capability when it fails to initialize
Date: Mon, 28 Jul 2025 13:03:56 +0800
Message-ID: <20250728050401.329510-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250728050401.329510-1-Jiqian.Chen@amd.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2d7c0a-5e4c-4031-b532-08ddcd943df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXowQXhSL01Gb08zUXBEdW5JbmZQaVhDdVJVTkF6SEhRTWJqRGxOTTZpSUc0?=
 =?utf-8?B?VFpXN251RkI3b2hTdGU1dzBuNmdJSFJvM253YzV0cmpXWmhiTmlyZXB6N2Ew?=
 =?utf-8?B?d1AzcUFiV2JCNmdVbjhaOXpua3N4Umw4WHU2T1dVcGJMU0hFTVY1Tlc0RTBM?=
 =?utf-8?B?TmVRTklWUWhiYWpuU1lPSkw1bXBWdHFHdFp1STlNOWxnT0NsTjZrb0JSTXA2?=
 =?utf-8?B?azN1ZTU3OFV5RHFnaE9IVVFkQWRWTzY1K0tYVUFGekVyckNSMVpoTnNyM1E0?=
 =?utf-8?B?UlJKbFJ3WkRUOWJFWkFPaDhXSHV0c0R6aHY1K05Pd1h2UEw4WUltOEYyMGxM?=
 =?utf-8?B?bnRTRWlBR2w5eXB0WGw3ZFhxUkkxQ1R2QkJ6bDAwZERmQW53VXdMWDhOQTRu?=
 =?utf-8?B?cmtmeStxWlZFQW9ONWVKKzM2MWtzdm1rTjJOMEwwaExUWkEwL1RlRnNoekhP?=
 =?utf-8?B?OGd4SWJ0QkZHTGt0cVQ2MzJXbERBM2FWaFF3V2l1c2RhN25RZmdqejBaU3c2?=
 =?utf-8?B?eWF3WHhKdE5TM3ExQ3hZKy9Oc3FoLytmNDAzYVhtaFNGcGVKZEJDUVFEZjJW?=
 =?utf-8?B?bXlFbDlrMFpwTDhWbVA0b1pUZWZQNUxIdmlSTFVxclRPWUU4NmRSUCtZbkVt?=
 =?utf-8?B?NS9JaWo2Z01EMUUzTU4xaDFFbEdMM1RZcU5KOXV5ZW9GRjlua3g0ZlN5MjlJ?=
 =?utf-8?B?QkhKMGhLNG90RzdQODlhcGZ3QTNvNExMS25sSGN0UjZoTVpDY1VCRE95QkRi?=
 =?utf-8?B?SUhvQjZhQi9xVko5azlVNTBRd2pBc2EzY1pqRFhHRElwU0VDWEM4cjJmSmxr?=
 =?utf-8?B?VUEzRGxwd2J4d3I2WjhZd2FNRjMveUVtS2x0RE1BN3U4U2NkQXJqQUtFZEZE?=
 =?utf-8?B?MnFYZzl6WWVaNXNpU2M2WDNJT0dMdGNjSHdjYWtkRUZkRFp3WDVGYVJHQTh2?=
 =?utf-8?B?bnladE4vdDNIU3FHODEvOFgwZ1BiS3B2OVBDOVFwTzdsdG54UTVvQ2w2blht?=
 =?utf-8?B?ZXVnajZXK0l6dFlGS0lHUUxUVkV2QzMvQ3Z0NmFNMVExeEFES2svTWxBS3lx?=
 =?utf-8?B?NFRvREJlM3RHWEVqT2Y5YjBndnJkTisyQ3ozUCtMYmdOZWxVQmYyN01WckJh?=
 =?utf-8?B?ZUNqd2Q3ZzhuTnZObnQvTVFOekJxeXNhTi9IWmZ4WFdXTjRILzVLeVhhOGZP?=
 =?utf-8?B?aDhIUHFSUThvMWIyUkNoRnk4QTY1Y2hUcFlGKzIwSTBTc2RIdEJBdGh1K0Rp?=
 =?utf-8?B?K0UzQWl4eVR4MmNyTk5aSUNXdmJpYUI4MFgzdW1JTHk3OGFuT0RGR1B6OTk3?=
 =?utf-8?B?OUorR2RRMkFramhuM2FJT3VGd2hyVWlkeWpBeEYzRGIyaFdkK0krVWloMEh2?=
 =?utf-8?B?dFJ1RE1RaE9mcXpwampzSHlseGIvVjU2YkxUcmc3MlA4UURXRWp0d3Vza3Fu?=
 =?utf-8?B?NTNJVnJYZ0JJeEpTcHR5Y3h6amg5OXplN1hkcTlMdEQvY3VYbHRYUkRPdFdp?=
 =?utf-8?B?UzF6SEt5M1RkMy85dEFpNGZEQmZsQUNhcmJEcUdTcUhlWFJjZXY0QWxVT3pq?=
 =?utf-8?B?cmZLZkJOckQramtubXBUUEJDZHdDT0cxbVNPQ1BKamUxUGJlOEk3ejV0eVBN?=
 =?utf-8?B?Rnd3VlJJT3g2UXJMbXhnUDlDUVJuNytTc20rZlp6MG5iU3FWZ0VHSWk5Z2NG?=
 =?utf-8?B?WEZ2MkQ3TVpHU0xLdlp4TjdNVXJ1K05CU2FERVBWL0ZpRG1UeENGT281ZDVW?=
 =?utf-8?B?Q2ZaYWhiK3hObHVrbi93OFhwS1dSc09ncGFRa0pjWVhvWVFmZTJPbUdDSmV2?=
 =?utf-8?B?WTNBUWlhTmRoSExmT2VWVi9xOVJyS2dNSVJMcFRmWmJsSEt2MEpoZmFjN0JD?=
 =?utf-8?B?NFJ1L0MxNTZpVThjMjdvMzAxdUN6N0h4eXBQYWx3bEo3bnpRNDVrZ0xuanJj?=
 =?utf-8?B?eGxwU3ZPU2pwRzdqQVdCbXVyOGppZmI0bXZUdXMxemFBK210dWp0Yy95U3A1?=
 =?utf-8?B?cTcrT1l4ZDFFUEJ5VlM2Z3ZRR1YyUUtQenFOaFVBWHIvYlVERFpBSXFGRkVq?=
 =?utf-8?Q?B+yYjn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:33.3231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2d7c0a-5e4c-4031-b532-08ddcd943df1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163

When vpci fails to initialize a legacy capability of device, it just
returns an error and vPCI gets disabled for the whole device.  That
most likely renders the device unusable, plus possibly causing issues
to Xen itself if guest attempts to program the native MSI or MSI-X
capabilities if present.

So, add new function to hide legacy capability when initialization
fails. And remove the failed legacy capability from the vpci emulated
legacy capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v8->v9 changes:
* Add Roger's Reviewed-by.

v7->v8 changes:
* Change the type of next from uint31_t to unsigned int in vpci_get_previous_cap_register().
* Change to not return error when cleanup fail for dom0.

v6->v7 changes:
* Change the pointer parameter of vpci_get_register(),
  vpci_get_previous_cap_register() and vpci_capability_hide() to be const.

v5->v6 changes:
* Rename parameter rm to r in vpci_get_register().
* Use for loop to compact the code of vpci_get_previous_cap_register().
* Rename prev_next_r to prev_r in vpci_capability_hide(().
* Add printing when cap init, cleanup and hide fail.

v4->v5 changes:
* Modify vpci_get_register() to delete some unnecessary check, so that
  I don't need to move function vpci_register_cmp().
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
 xen/drivers/vpci/vpci.c | 111 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 7778acee0df6..da67226e4f4d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -83,6 +83,88 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
+static struct vpci_register *vpci_get_register(const struct vpci *vpci,
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
+    const struct vpci *vpci, unsigned int offset)
+{
+    unsigned int next;
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
+        next = (unsigned int)(uintptr_t)r->private;
+        ASSERT(next == (uintptr_t)r->private);
+        if ( next == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
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
+     * the register search.
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
@@ -103,7 +185,34 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
         rc = capability->init(pdev);
         if ( rc )
-            return rc;
+        {
+            const char *type = is_ext ? "extended" : "legacy";
+
+            printk(XENLOG_WARNING
+                   "%pd %pp: init %s cap %u fail rc=%d, mask it\n",
+                   pdev->domain, &pdev->sbdf, type, cap, rc);
+
+            if ( capability->cleanup )
+            {
+                rc = capability->cleanup(pdev);
+                if ( rc )
+                {
+                    printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
+                           pdev->domain, &pdev->sbdf, type, cap, rc);
+                    if ( !is_hardware_domain(pdev->domain) )
+                        return rc;
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


