Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A5A94C87
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960840.1352556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVM-0006sP-H1; Mon, 21 Apr 2025 06:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960840.1352556; Mon, 21 Apr 2025 06:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVM-0006pM-Df; Mon, 21 Apr 2025 06:19:44 +0000
Received: by outflank-mailman (input) for mailman id 960840;
 Mon, 21 Apr 2025 06:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVJ-00057u-Vl
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2417::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9adb1e11-1e78-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 08:19:40 +0200 (CEST)
Received: from MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::12)
 by SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Mon, 21 Apr
 2025 06:19:35 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::65) by MW4P221CA0007.outlook.office365.com
 (2603:10b6:303:8b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 06:19:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:34 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:33 -0500
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
X-Inumbo-ID: 9adb1e11-1e78-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tn8MEpAeUpxi1WOPqTQ7Ln1cZVb0qdutZuJlN3oicoYVVm1rH8V61KHmpZKUggrnwq6i+un6/WbjpeppDzIe57w6w7wTsUI/WPxZJ/eh53aDFr0hqrySYoxtXgf/ICCGku9BoZVeFceS/+ZvDvU+Nd4rcQ29xYTZbisTPsIcvUDXzPFA65A567nHkGY+GHmmaxrhAsJLKYWeuFAHJtpEVmPELvZle/ilT+KONoRHRyxPg05+LpmNB+yGjhxXDXirOtfDBlDq7mfL6lE1g4fWA2hQ8VyQs57B37Wo9oUuIdmlBhEyFPOmoIf5/HnZjhGPV3wzcLGnWxFJegdbNNwN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odOrILESrhnnD+KMb8PsZKWET0NUPER1gv9psvhTkOQ=;
 b=F4Vwc7u5ywrsSkeO8euRdniTwD0o1ZQS/2eBQ8MAk8piiWGVJ9zFc34zU8jjeV+uabuRfWAL6vjQyQI+9Ut09quEviRUtDVIrhpWtNnjIBYFRHnpAczAQ5KCXXSnKH5J0X/lp4NtdubL0UC3OAkalii+8ynfr9KfMiLnOCypEeQOK0P5m25kVPk7whB0gSrJElng3q2karwBz16w1IwnAsPRWEAP26tfAThgmBvTha9glWiVMNPdGkJoglFeeE9IWh8RKDP6NPdFEdG7hSyiVUSmha8/bMpWm2t7xb+53Xj18a/EC8kHcCnA75XpunOBzbYczJW3XD3Rn6BK3nba5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odOrILESrhnnD+KMb8PsZKWET0NUPER1gv9psvhTkOQ=;
 b=GaKGjpiX5esZx7ZrAYpe6ryRzA/j/efXMc12OJ8eAq1AstpIe+9wzCx14dc4DR1uJMuhC2Ffl0edE3145dbqm/x40nwb1zdrl0XbO6ppSWT3ErWO/uBUQKcCQRJYkKN4VYiSzmih0kD81BDaVKWd+AF092PNNMmUQ3LKWXx/wn8=
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
Subject: [PATCH v3 07/11] vpci: Hide extended capability when it fails to initialize
Date: Mon, 21 Apr 2025 14:18:59 +0800
Message-ID: <20250421061903.1542652-8-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: da781faf-2e47-4a79-a585-08dd809c7ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnRNZGxmMTZkZWVxOUdPdVFGb3FjVWJpYmwxOFFMaWo0MFdkYjhjM0xFU082?=
 =?utf-8?B?VE1FK2p2UVg1bTdWVURSa3NnUUI1UmpkaFkyVnNvazVBRkdGWVMxWXBmd1B0?=
 =?utf-8?B?UStLZ2kvMDlEaHlNSlVESHdhaVZHNXhIMHpkUitNK0NBYzdld0ZMQ25HQlZ5?=
 =?utf-8?B?ZXl2UHZqZktRcFF2MWlvRHd2LzAvc2UzV0t5WklMVmQvSlRvdHB6d21EUEcx?=
 =?utf-8?B?WmovemQ0OW4yZTEySk8vUXEyelNtYm9xUEFPcFAwTlNrOGk2OHRWamdibUR3?=
 =?utf-8?B?L1ZTNWhSSDJLcGtOYmVaVm5TbjRYeTBBNnc5dTdWaGRBb0VXUy9pd0FrMzNx?=
 =?utf-8?B?K0tRdCtmZXA4c0xYb1pyUExKNjdBY09lMXUrbDBPZTRxNkNjRyt2MkMwejZv?=
 =?utf-8?B?Y2tRTlBVMERrNlp4eURGQkplSmlIbGkyNTd1WFBDakpMZnM2VmVEdVVkVVdw?=
 =?utf-8?B?ZDhBdm1RS3lXV08zbGRZeW1ndzNjR2pVSVdUOGUwaWJCbEJqd1hSQmE3OUk0?=
 =?utf-8?B?TFEvdDQ4THk2RitpYTlUc1Ywa2d5ZVJaS0R5MC9jOFk2ZjJ4dVJQU0p0TTBl?=
 =?utf-8?B?ZFNDUkRKOUl6cEtVUzlKc2ZEQVd4RmptQ0M3Z2w0K0xiMjE2VkJHZWNrdUda?=
 =?utf-8?B?MktnSTUxcWRjOHBwTko1c0tXUHRLUnYrMStWbEFoRS9RVHlFei9wRkR5SlJK?=
 =?utf-8?B?WkJ4Q3BoVDNyN0dDVlUvMm03bnJES2dwVDBqVVl0OTlTZTBoSGthRmk0Z1RS?=
 =?utf-8?B?TkhqYzQ0bmNyZi9zM251aDFrK2pnZm43bms3eG5HUnRCRyswcFR3WHFuRHZ4?=
 =?utf-8?B?V0g0WjJNTEt0TTZkaE5GWERDUGpWSmpQZ1pGcDYvRzBua29BOVBrS0hDaGU1?=
 =?utf-8?B?bnB0cDNuaFpuWFJQbGhaclhGRVFGK2hOUnV0ZFdRTFpvR2xjdmJjQk56a3Jv?=
 =?utf-8?B?VlFjUVJEZ1EyeTlSd1VuTW53M1BnWDF0S2lET3NYYkxMcWhrNGZlTWJuT1VW?=
 =?utf-8?B?clZzVFY0VzlHWmVCQjVVZlU1dDJhNHk0Ym5tRW5GSVZsMlBIaHdNbERZUFkx?=
 =?utf-8?B?K3Uyc3pwRjBHS1B3VVpZbzJ0bnpmUm9PdnlabVZ1TU5WMU53SC91RE9hdmFw?=
 =?utf-8?B?ZDFubktCdURvaGc3RGFYYTh1cHd1cVNla2hoQkRuYnJBbnlvU0ZWY0djNmds?=
 =?utf-8?B?Vy9aMmJWOFU4anREQUZDeEQ0cWJua2NHVWZMNmNFNGFKbHk1ZXprR3pUVzhk?=
 =?utf-8?B?b0RGRHZReGVJVmh4dU1KQlg0VHF3QTlEa1JlUmNiWi9xcVpiVms4OG5GN2hR?=
 =?utf-8?B?RXRGZHBhRUptOTU1V1JWeGI3QVJYTkg0QlJldlVKL09nTWZtbU9TanlQVGVq?=
 =?utf-8?B?ZlEwK3p2R28zYlJRcUxteDdkZjFkU2w3cXhpdnNPRnh5bEFRZHNzZWQrM1pv?=
 =?utf-8?B?dGgwNVhMclFVYTdZS1VXWjlmeS9TV1RoODY5QzdVbE9abHBWTzJ2Ykh6ZFVt?=
 =?utf-8?B?Yi9qNFFjUDN0RlVQNmorRzdxUmVZOGNidWxXZi9jUHNnZUJsZUthWjJXTDQy?=
 =?utf-8?B?NllsV3ZpZndianJreWdzSW5DcjdHdG81UDN2cDVuN2YrbS9mUVRFVmN4YStp?=
 =?utf-8?B?VSt6RXF1MzkzcDM1OXZpTDRSWHNaaWJsQ1pBdUVIZjBSQU5aTE82TnN5aGNm?=
 =?utf-8?B?MmFMZ1hKK25VdzgxZzY1c0RuRldiSU5YQWNSSEpJblRPNG42KzVIU0xJTVFt?=
 =?utf-8?B?cHNheDVQaENueW5sR3pPOHYxbERLeUs0eE02ZlpmcmdpWGRIZndTYXpuTjRG?=
 =?utf-8?B?SGxmeFVZazg2ZEcwN2MveHpLYlFzaWZGZXJ3U044bHoyVGd1RFN0a3dFRHBC?=
 =?utf-8?B?VnNobTNmb01OeUR6cUxBV3ZTcWowNGhrajdaenJNTkdkdlpOSDFQcHRHbkox?=
 =?utf-8?B?bGg2cnhBUk5sVFZVUHYrWGNxY0NYMTRiM2tJamlqeXNmdEdIbnEzRHo0YkdH?=
 =?utf-8?B?dUNtSWNjSTBGR3FOR1hYcVVzSUt1MkFyNzFGWEtEcEx4NjdBYU5FWVNhMlpP?=
 =?utf-8?Q?Msera9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:34.9908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da781faf-2e47-4a79-a585-08dd809c7ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246

When vpci fails to initialize a extended capability of device for dom0,
it just return error instead of catching and processing exception. That
makes the entire device unusable.

So, add new a function to hide extended capability when initialization
fails. And remove the failed extended capability handler from vpci
extended capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize".
* Whole implementation changed because last version is wrong.
  This version gets target handler and previous handler from vpci->handlers, then remove the target.
* Note: a case in function vpci_ext_capability_mask() needs to be discussed,
  because it may change the offset of next capability when the offset of target
  capability is 0x100U(the first extended capability), my implementation is just to
  ignore and let hardware to handle the target capability.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c    | 79 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  1 +
 2 files changed, 80 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f97c7cc460a0..8ff5169bdd18 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -183,6 +183,83 @@ static void vpci_capability_mask(struct pci_dev *pdev,
     xfree(next_r);
 }
 
+static struct vpci_register *vpci_get_previous_ext_cap_register
+                (struct vpci *vpci, const unsigned int offset)
+{
+    uint32_t header;
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+    struct vpci_register *r;
+
+    if ( offset <= PCI_CFG_SPACE_SIZE )
+        return NULL;
+
+    r = vpci_get_register(vpci, pos, 4);
+    ASSERT(r);
+
+    header = (uint32_t)(uintptr_t)r->private;
+    pos = PCI_EXT_CAP_NEXT(header);
+    while ( pos > PCI_CFG_SPACE_SIZE && pos != offset )
+    {
+        r = vpci_get_register(vpci, pos, 4);
+        ASSERT(r);
+        header = (uint32_t)(uintptr_t)r->private;
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
+
+    if ( pos <= PCI_CFG_SPACE_SIZE )
+        return NULL;
+
+    return r;
+}
+
+static void vpci_ext_capability_mask(struct pci_dev *pdev,
+                                     const unsigned int cap)
+{
+    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
+    struct vpci_register *rm, *prev_r;
+    struct vpci *vpci = pdev->vpci;
+    uint32_t header, pre_header;
+
+    spin_lock(&vpci->lock);
+    rm = vpci_get_register(vpci, offset, 4);
+    if ( !rm )
+    {
+        spin_unlock(&vpci->lock);
+        return;
+    }
+
+    header = (uint32_t)(uintptr_t)rm->private;
+    if ( offset == PCI_CFG_SPACE_SIZE )
+    {
+        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
+            rm->private = (void *)(uintptr_t)0;
+        else
+            /*
+             * Else case needs to remove the capability in position 0x100U and
+             * moves the next capability to be in position 0x100U, that would
+             * cause the offset of next capability in vpci different from the
+             * hardware, then cause error accesses, so just ignore it here and
+             * hope hardware would handle the capability well.
+            */
+            printk(XENLOG_ERR "%pd %pp: ext cap %u is first cap, can't mask it\n",
+                   pdev->domain, &pdev->sbdf, cap);
+        spin_unlock(&vpci->lock);
+        return;
+    }
+
+    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
+    ASSERT(prev_r);
+
+    pre_header = (uint32_t)(uintptr_t)prev_r->private;
+    prev_r->private = (void *)(uintptr_t)((pre_header &
+                                           ~PCI_EXT_CAP_NEXT_MASK) |
+                                          (header & PCI_EXT_CAP_NEXT_MASK));
+
+    list_del(&rm->node);
+    spin_unlock(&vpci->lock);
+    xfree(rm);
+}
+
 static void vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -216,6 +293,8 @@ static void vpci_init_capabilities(struct pci_dev *pdev)
                    is_ext ? "extended" : "legacy", cap, rc);
             if ( !is_ext )
                 vpci_capability_mask(pdev, cap);
+            else
+                vpci_ext_capability_mask(pdev, cap);
         }
     }
 }
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 27b4f44eedf3..5fe6653fded4 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -449,6 +449,7 @@
 #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
 #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
 #define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
+#define PCI_EXT_CAP_NEXT_MASK		0xFFC00000U
 
 #define PCI_EXT_CAP_ID_ERR	1
 #define PCI_EXT_CAP_ID_VC	2
-- 
2.34.1


