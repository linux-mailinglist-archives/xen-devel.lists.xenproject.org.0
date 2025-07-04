Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B87AF88AC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032828.1406217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXC-00047t-9Z; Fri, 04 Jul 2025 07:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032828.1406217; Fri, 04 Jul 2025 07:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXC-00045n-6R; Fri, 04 Jul 2025 07:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1032828;
 Fri, 04 Jul 2025 07:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXB-00045b-2z
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:200a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afa19502-58a5-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:08:31 +0200 (CEST)
Received: from SJ0PR13CA0189.namprd13.prod.outlook.com (2603:10b6:a03:2c3::14)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:08:24 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::24) by SJ0PR13CA0189.outlook.office365.com
 (2603:10b6:a03:2c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.15 via Frontend Transport; Fri,
 4 Jul 2025 07:08:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:08:23 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:21 -0500
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
X-Inumbo-ID: afa19502-58a5-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB8WEzEoaT489doOi+xLoUAwh0DNyuMCCyWoRtUQ2RA+9PS2SMJ0aqJVBzsUqbOTdJxj4NfmyQGQX5086eZrgh8H7sR/LqJdIzMaM/QHYKpLIs1qKF0BeIxg0oGTlAiGUsqMsSlfBXlUXhPSbPGi+bCNCoaW9pTK4zJ0/aoB7XYdCX6tNYs2dTCIhWVqgBBulE+XEP1eRDgMiI9qkr4siGUy2s97iOWuXjfroAPS6NmxzlIlHL7pnL0MQIalBwspopFYoDSnepkbaMkiegI/PlF8+C38cr5e6WmXplLPmKbnMOOOKRBtVoVle5n0pSsZdKsXqUJpKLzBwGIx1nAOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hgne9jPvyF/xyLS84/NA3kN/tkqP9BLwA1FK/Emm/p4=;
 b=K2SqGaiKvTL4Ooceek2nvfgiddXq89B71NchHutSnU65KneKp/jukwyoq9KwEWfSBj6ty/JWZsyl95433j12xagPBCd9V71/FKg7mXUyJjf0QrWl8pZJo35UWQoDidXXeG2fO1eOSrNhEdnodfUxmjkueFXOdr3nVSh/ihvHD/lpgC9C4khbFGamK5krKzBI9b1hD/kmLC7a2OnE0R0jZLBhe8UK+8T7JSxrjHwqH0ayJgIWN/16R/dTERyUMI6e3coyi3G4cvU039kZihij5Bblv5qycpfIV4RBKRsuOiFtoO7yeqtZsHp92fN8evJ2VAeYBJlFN1esIbgZcZ/+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgne9jPvyF/xyLS84/NA3kN/tkqP9BLwA1FK/Emm/p4=;
 b=KlJs6VnK9pjzLjKdDcDBj7Z+SP/l9qjz+AS/L5VXSojj36Tz9vaoq8MFuSEJDRPXBNVVMSfNjxSOLPiOyfCzfr0923Qt7cwsyEimn927rs1fzd51wzTZIlajoZjTXU+EtzlhDQXe2b1/J/mc6BJKuoBOrfeqw23WSQfKTraYO0M=
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
Subject: [PATCH v7 1/8] vpci/header: Emulate extended capability list for dom0
Date: Fri, 4 Jul 2025 15:07:56 +0800
Message-ID: <20250704070803.314366-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e65502-ac73-41dd-0590-08ddbac9909e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHVnUnhPdGhMSnp2V0hRa1J2T3RvZ25ubjY5ZW80YXFzVkpBQzhqaGd5RmZ3?=
 =?utf-8?B?SlhDVUR4T1NlTEI5UCtsTXNwa1RqM0Y5NmpJc3FOeEZwZzhaWWEweTJmcmdv?=
 =?utf-8?B?YTJOc3hwWnVsTnM2VmVkd3g0WGd4UTUvTUsrczBuMU8vUE43V1NSNWlWZlJB?=
 =?utf-8?B?RjVEZmt4Z0lKVXJUYlFXdXFySWh1aWdPVjYrY3B0TVkvY29uVWJDQ3d5L2ZK?=
 =?utf-8?B?Rk5CZGJMYy9GV2pFUndMTXlBclhTanRNeThLcTUySWhSM1FUQ2JMWFRBR3pJ?=
 =?utf-8?B?WnhLMHlxWUwrOC9BaUJiYjBtNFF1bnk0QzB3blpVZlV4ck5Oem1lT2w3RXdP?=
 =?utf-8?B?dUJxSng5d3A3bFU4VnhqSHM3eUF4UzVSZy9hNS9VaVUwb0pkRkVMODdvNUVn?=
 =?utf-8?B?OVppWE1NZTZoZ25QOXhxek9MeFI0Y0YvR1FOUXlsS2FrZzNnNE54NE5pR1Y1?=
 =?utf-8?B?Y2d5SndnbHhLanBNNmNEQ3FLbHFRMDdkazlkejVUeENFRXlPcmZXRkZIbWRv?=
 =?utf-8?B?VHFEZ1JaanpQZkJ6QnNDdGVzNzZBd29EZlhVSnFlS2JVQ3M3amVieVJwb1M4?=
 =?utf-8?B?N1VVWmJaMG8vV2tuVHNQdEE3QXl2OVZjRmdNSytieWJnRFgxVzZWMUZSUVNG?=
 =?utf-8?B?YXVYQ1lFSjl6cnJGVERMZ2FDaHNNR1czYkx5UXZDMFovL0xEZGphZkxMSzRW?=
 =?utf-8?B?K2JrWWF0aVRWRGVvRXBOZW5FYloya3NzSHdqemhoRDJjTlVLeGlQQXRkTGVs?=
 =?utf-8?B?dU9EdnJzL2VYTTJRSm54cU5hUnp1Mk5VNEhZNUI1Mk9HOUgzcVdwVXVHMEJL?=
 =?utf-8?B?dkFraWZ6aThZellRSU4rSnpzVk1KSFlLVndSODU1emZ0ZlA4MHBRRnRqR3JU?=
 =?utf-8?B?VzdpcGdRd3hTOFNvNTRnaGhJV1J2VWZwMkg5K3BIUXpjbHp0NzkwWWxPbGpz?=
 =?utf-8?B?aDdvQVhGWE15QnFWNERpWnNKaU1PZjhGd1hXTFZnaGVYRGFDeDNRTFFDUGNV?=
 =?utf-8?B?dnd4clgvd2xrVlZKajdsN3NYYmVxS0lpRGd2WWJjZ2NLQjh3M0lvNzk3THg5?=
 =?utf-8?B?QXg1b1l5WGFuWlViZzVKM2EyVFlxN0NPTGdkdFE3VVp3Y2xKbE9zUkY4TmRn?=
 =?utf-8?B?UnhCcnIyUTAyV2hiNWFaeXo4OXFyV0laVEg5djR5VldGNGFRN3pwTFUzVmdS?=
 =?utf-8?B?Y2pxeUdXNXZnU0V0dnMzQmZoMlRmWjVLTXcrTjJuaG9MaytIQWtseFZsVUhO?=
 =?utf-8?B?K0NGTDJTd0RtVUc0K0tZZ0ZBTjhqdXhCaGV4ZDgwaDRtNDg4azZ6Zk52TDFQ?=
 =?utf-8?B?UDc5cWI4c1hlNUN2OUpKaXI2bjhHaFFpTUEzWHVWbXlnYTI2c0VMRnlOQlZl?=
 =?utf-8?B?c1NGS1Mxc0RpVkd4eXRhZGQvU1RYNWt0OUl5cm9oU3d2VEttNzdoU2MvRzNT?=
 =?utf-8?B?SXpCMkZtYUlWNFVSSk95eTIvVTBMTUsxVFlFb3JKYktKL0lqSEVzR3AyNEFK?=
 =?utf-8?B?Q3VWVmFSaW5JV3BCOXZtR25aV2dWWmZCVFVZcnViL0FOSXpQWldMU01JN2lt?=
 =?utf-8?B?Vy9ZNHZZd2k5cm5aMU5MQmROMTF6NFEzQVpsY294QjNuMjJ2REQ1TjlmbnNv?=
 =?utf-8?B?L2ZqR1JIQjRXRkNrYVh2NUplVmtmMVg5RGdha0prTVFsV1l5RlhsUktzWmZU?=
 =?utf-8?B?N1ZGb0dRZkJ5bUY5dk9YUW5mdk0zNmxNZTBiQkwwemswZzlkMDNhemNtaHow?=
 =?utf-8?B?Wk44cXNFKzNYNEpGalB6SExUVVdlVTIyV0dPbkdua05FM3BibDJWQzVhVVZz?=
 =?utf-8?B?Y01hQTRhOGFTZGd5STdnS0RtV2tNRXpVNUpYVHNyK1dPT0dLd0NoTWY3RGZX?=
 =?utf-8?B?M2ZEUThnQi94OWVERFEweTlqem1FVWZueWhGNmJ6Mmx1YXR1TkxhNGxMYzlM?=
 =?utf-8?B?aW1RK1UyMzc0R05ScDJ4VlFIbzZxM2pYLzdJRXAvYWxNQkpPRURIc3lyUlZw?=
 =?utf-8?B?YVBKbGx4cWdzNnlOcWJKcXQrQ1hCOGEvMDNjSS8yaDR6NWd3QUhUUVhEcFIw?=
 =?utf-8?Q?trkAwg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:23.2598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e65502-ac73-41dd-0590-08ddbac9909e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472

Add a new function to emulate extended capability list for dom0,
and call it in init_header(). So that it will be easy to hide a
extended capability whose initialization fails.

As for the extended capability list of domU, just move the logic
into above function and keep hiding it for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v6->v7 changes:
* Change word "guest" to "DomU" in vpci_init_ext_capability_list().
* Change parameter of vpci_init_ext_capability_list() to be const.
* Delete check "if ( !header )" in the while loop of vpci_init_ext_capability_list().
* Change the loop from while to do while in vpci_init_ext_capability_list().

v5->v6 changes:
* Delete unnecessary parameter "ttl" in vpci_init_ext_capability_list()
  since vpci_add_register() can already detect the overlaps.

v4->v5 changes:
* Add check: if capability list of hardware has a overlap, print warning and return 0.

v3->v4 changes:
* Add check "if ( !header )   return 0;" to avoid adding handler for
  device that has no extended capabilities.

v2->v3 changes:
* In vpci_init_ext_capability_list(), when domain is domU, directly return after
  adding a handler(hiding all extended capability for domU).
* In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )"
  instead of "while ( pos && ttl-- )".
* Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 44 ++++++++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c   |  6 ++++++
 xen/include/xen/vpci.h    |  2 ++
 3 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index d26cbba08ee1..8ee8052cd4a3 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -836,6 +836,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
                                   PCI_STATUS_RSVDZ_MASK);
 }
 
+static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+
+    if ( !is_hardware_domain(pdev->domain) )
+        /* Extended capabilities read as zero, write ignore for DomU */
+        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                 pos, 4, (void *)0);
+
+    do
+    {
+        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
+        int rc;
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
+                               pos, 4, (void *)(uintptr_t)header);
+        if ( rc == -EEXIST )
+        {
+            printk(XENLOG_WARNING
+                   "%pd %pp: overlap in extended cap list, offset %#x\n",
+                   pdev->domain, &pdev->sbdf, pos);
+            return 0;
+        }
+
+        if ( rc )
+            return rc;
+
+        pos = PCI_EXT_CAP_NEXT(header);
+    } while ( pos >= PCI_CFG_SPACE_SIZE );
+
+    return 0;
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -888,14 +921,9 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
-    if ( !is_hwdom )
-    {
-        /* Extended capabilities read as zero, write ignore */
-        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
-                               (void *)0);
-        if ( rc )
-            return rc;
-    }
+    rc = vpci_init_ext_capability_list(pdev);
+    if ( rc )
+        return rc;
 
     if ( pdev->ignore_bars )
         return 0;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c27c..8474c0e3b995 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -267,6 +267,12 @@ void cf_check vpci_hw_write16(
     pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
 int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
                            unsigned int size, void *data, uint32_t ro_mask,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index fc8d5b470b0b..61d16cc8b897 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,6 +80,8 @@ void cf_check vpci_hw_write8(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.34.1


