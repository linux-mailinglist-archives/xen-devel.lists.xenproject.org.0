Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172FBAF88B1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032830.1406239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXF-0004dW-Tc; Fri, 04 Jul 2025 07:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032830.1406239; Fri, 04 Jul 2025 07:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXF-0004aB-PW; Fri, 04 Jul 2025 07:08:37 +0000
Received: by outflank-mailman (input) for mailman id 1032830;
 Fri, 04 Jul 2025 07:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXE-0003s2-0L
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f0c547-58a5-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:08:35 +0200 (CEST)
Received: from SJ0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:33a::11)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Fri, 4 Jul
 2025 07:08:29 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::43) by SJ0PR03CA0006.outlook.office365.com
 (2603:10b6:a03:33a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Fri,
 4 Jul 2025 07:08:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:08:27 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:25 -0500
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
X-Inumbo-ID: b2f0c547-58a5-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aee8c5rOk8xpeSWS3MDy57h2nT6gFYtSf4SF3+Jm6Vvh3FWEgZPxFk4TSipaxXFifLVinILDD/Y7OQPgvuwrc6hw/mCGPW5DSWy7LkeQCmg40LOE9GUWo38A1V4e6C4TmscF227j5ALKL4rSrLwsZZD6G4nznKktC7ElXRrJIjYw5ALSlY26QWzmRg106gsdZ9Dug5bm3A9ZkmRzDLo8LG296X5PjtRZoQ19hSyCE5xhgUCzajhVeZNoF4Tt/oZy1HDe/NTQ+9EIEFxaPbxy4UFF0jmyyKAMYvyoSnk3Ue/Ozwl8lT3sjdL3cJamReIfCBVjRoTg/XpsBqHEKYX/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OW70x1N6UU3S5DI7eQtjO63eo8Krrveg3ECkUO+944=;
 b=EzglPdNV7w4GlF+8WS71XqXvni8xX5kS/GCvBBlc/cXBNqFnFY2EBbJpsELKGUKjYkvE4G3tTZoxGsqvshixmcLmVoCRB8rQD/lt8m4UDTcht/Xc2VQGKBx0cI92KpuFvCmHlp7yv+YjSIrf+/c8YzwffQAlMkyW4eZwdWeEWgN7KsayYrktU41gRpBLYzIhNK39YCwKePeHBs1d91RY6SK12VZ4pUu9xSnG+Ue6eDGFWT7bhzkINzUPCroGPX3UKWBVKDYbvOx68HbWZRBTBpjNiURW+sHO0FYPb61pRgyB5Q13adKm6UQMU6fY7RSag+Idw7hZi+qiOMv5/suy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OW70x1N6UU3S5DI7eQtjO63eo8Krrveg3ECkUO+944=;
 b=e1C3XXbzJAeZFaGypR+aR3wslWrNI/8VOgy6H9BYW1Z0fIw0EFaRYWjaeUNrms3Ip5ZWHJV/CnBXUGj3+9oHuP257a/Srb4BJ7yYVVqSyjC+HgMDlxAHGgg+vRk4AJhY/X7lFDdvye2jfwIr9szrPwPtYk4Hwl7/DfFmwNPVSGk=
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
Subject: [PATCH v7 3/8] vpci: Hide legacy capability when it fails to initialize
Date: Fri, 4 Jul 2025 15:07:58 +0800
Message-ID: <20250704070803.314366-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704070803.314366-1-Jiqian.Chen@amd.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3294c8-b57d-4e24-fa57-08ddbac99366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUN1enE2aXlOU2NkN3I2M0NRK0VnM2UveEhXUmVGWEtSZmx5VGZBWkxBKzN6?=
 =?utf-8?B?UEplK2pLR0dUMitreC84RFd1TDM1WExiMmh5K2d5VlZpUWY4R0pFTnNuMFQ2?=
 =?utf-8?B?Q25PVUVlb2Vadk1TWGpldWhYc3NwMlA1UzExSWFHUGg3aitwSVg4Skx0ak1v?=
 =?utf-8?B?VG9aS1pCK29rU3RKQ0xiWDRFb2lWbHVvS2ZnWFhQUjVRZ1hGdzd1OHJvZjg0?=
 =?utf-8?B?dy90ZDliNHhvdFhrODEvblo1bTR5K2ZXK0JySXJ0R29OVHJoOE05dnVZYVFL?=
 =?utf-8?B?ZkFrY2U5T0dONENzMHdjNWEvMXV1Uk8rNEh2WWpEWEVXY2N3QmVaK3ZHcGJh?=
 =?utf-8?B?TE01cEcxR3BCL2hQMWE3R1orR3MzUDJ4OVpRaEIyRUFiRGd4KzU2OTQ2Zm5G?=
 =?utf-8?B?clZFYmk5WmhLZFNPZWJqTzdkcmNDamEwYUV4OUFQRjhNUzdGbVlhWGpOYm1C?=
 =?utf-8?B?NDE4Z0xQNmNneDNXRmFpcVVlVWMxZDRtcFdTb0krQkE0WHVnRmU3dXoyV0th?=
 =?utf-8?B?emZLK21yQTBWV0dyQVNPbTZrNlB4TVZPTnkzSWdLVitQbS9CQS85WEE4U3ZR?=
 =?utf-8?B?K1lhNWxNQ0ZHWXI2bWpOQWV4TFAvbmJubzFOUThoeTNsa1g0Zk5FSTM5YzJL?=
 =?utf-8?B?UHJwZDdEcWNEaGpCcU5VanNqR3V2YnhNWDFkZmNicmcxc0p1bkdZeWpKQ21p?=
 =?utf-8?B?TkZCaXRBbGMyNjdCb2xEWUVacVBUSEl4UThMU3Bwd21HSno4bjB6Ri9MY1BR?=
 =?utf-8?B?dDQ1UkpzVTNaZTNhWVdzUllvaW1aNk1FSVVxeEJPeDJpZ1lBSTd3VFJUVHQ2?=
 =?utf-8?B?SUp6Zk0vZHl4TFhCa2RkWkNmTXlNbEpKLzNjRk9uM1RIMHJlcXo2NE1GSlVy?=
 =?utf-8?B?aGRPN2gxYklBY2haNXZEOWxZaS9IU1k0cmVuS1UwdWZpbHplMXhVeVdvanEv?=
 =?utf-8?B?S3lIOWtRYzI3UEpUaEFBdTN1WHRQTnA1M29Jb2xROFd0MXkzZG1zb0NxeGl3?=
 =?utf-8?B?Wm9MOG1Hc2JZV2JwTHgzMHlmaWJlZXNwS1pydldMZXpwL2dvOCswcHpjOHI4?=
 =?utf-8?B?L2M3K1RVQzZTamRmYmdSWkR6NUZPcDcvVmdCNGM4d1luNFNIQmkzdzlPNkdM?=
 =?utf-8?B?Sm1Kcktzd2swRHBRTGd4dUxDWnprdm9TZjFMdkRiOEVFN2VUUytQdjFhUE50?=
 =?utf-8?B?SHN5bWdaaXY1bkZCbkdaOGFFRHVQZHQyMDQyb2UrMnNzVzlMWVF2ekM2aWhU?=
 =?utf-8?B?Zk82NGsyTVlrRVZOOGdseWpnMlM1WGlKVEw0TW55c0M2YlJGcEVwdGxwUDlj?=
 =?utf-8?B?eDhBdWJkWGE2Qzd2dkdHRmpvSnVMbU4yeldmZmZWQ3V1b29xT3hrUUJhR2l5?=
 =?utf-8?B?WUx4WTBHU1Y1b2VDaDNwc2s5Mit0aTE2UDk4c0VFVnVJMFFMTExxcEoyUG0z?=
 =?utf-8?B?WUQ4RE53OVVQY3A5SFNHdi9qV3MwME5Ic1lUS05iNWNtbzZpTGxBYkU0enhS?=
 =?utf-8?B?T29JK1N2NnN3NTFXRHQ1NU54WVNvZGhzNTRPQlllYVdLazVJaFBYdlB0RHQr?=
 =?utf-8?B?bHF4UVlCQnVNcnNSZ3FLUFZUL1g4Q2Nxa2QrU1pTRFVWTGVNVWpmQUgwVE9V?=
 =?utf-8?B?Yk1MMW5BS2t1ZFAzS093bmt1MXVqR2xLeHBjempCek9CVVlDdHZOWlR6c0RU?=
 =?utf-8?B?NTZmNnI3bkRQYWk1ZEZsQ1lWQWZmTWRjWTVITFRZazFkNldRUkJGWTNTTWNo?=
 =?utf-8?B?VTlwbUdJSXVwQmNWNkNoNENMVmpjL3V2R3dTSGpiTTJNQjlYQ0g4R1dKdFcw?=
 =?utf-8?B?OHpKQzRvLzFYZ0w5VTNmSWE0NGZsQkJ3elhmSjNUUW11TUl3VTE5RThwU2Js?=
 =?utf-8?B?aWM1VGtnV2NmcGlJc2NrTVV1dEluK1hIOHp3WVp0Tkx4T3ZydUJhVnFsSE9t?=
 =?utf-8?B?QS91ZWZzUUQ0akxHNDZjc0lkMm9hVUdGUldBS1lyb0NNTHRsS0ErZXdwRlNs?=
 =?utf-8?B?elkxK0FPRkRhN0JZMERNeGlrUy9peWQ3RUI3SW5YbGtsZERqWmZpVTFnRHY4?=
 =?utf-8?Q?351BhD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:27.9328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3294c8-b57d-4e24-fa57-08ddbac99366
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041

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
 xen/drivers/vpci/vpci.c | 109 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index e7e5b64f1be4..a91c3d4a1415 100644
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


