Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F67B133E8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060936.1426510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2Y-0005DU-Hb; Mon, 28 Jul 2025 05:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060936.1426510; Mon, 28 Jul 2025 05:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2Y-00058r-AY; Mon, 28 Jul 2025 05:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1060936;
 Mon, 28 Jul 2025 05:04:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2W-0004fw-1Y
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2418::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5842f8f4-6b70-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 07:04:31 +0200 (CEST)
Received: from MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::10)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 05:04:27 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::83) by MW4P223CA0005.outlook.office365.com
 (2603:10b6:303:80::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 05:04:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:27 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:24 -0500
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
X-Inumbo-ID: 5842f8f4-6b70-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEV5VcVG0ifMyocKLyPix3gUSVtt5GghYUZ+ubqtxJ4e8odMGgGHr80yGk7WgFAJG5HH/s3qO5ww6YGqVme3ODCmSM47QUc5qiToyBFdK62sHfimH4UIMPGYl0Oj2vz9F47UwH9tpkwzuI2enNAOkMCuYpa+9z0JkhOZYThLn6kcVK4WaL0NvoEIFsIGstepMVZ5x02Z0vbw4LdX3JXePqMlAm2A05jmLkhofuS1U1/Hpf4gYu1muJvNQeJ9N1jR9NtQ3KFxdiIG65OVL7rUvyMsMdSuAPv/8OOcuKJHroGC4pHbhwYygx+661PhN/qRmHCnhplQOAQH9tQ/3kJ2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo5QVvtIskkluTtHjqFarDeLQQMVhhmWsi54LUX/GbI=;
 b=hyEWzqjGvx9y8FCwvQA6CFq4v+He7lj6XGkQ0O0XVnJRMrR5F9IbqURhpkdGtSbj2M82v/cS0Y7slD7xSir615xqv1oZL339QHvxl0lun9zNJSyQBTbISqxGOLDaW9EfbtuCtaRLv4lyTdXJF4E2/RURZwCtuGRoE4N39QyX6ECgF2RbW9uZz9lfbkq2zSxAyf1DcBPWiU5MSjcs1iyHrpstSs2MscA4N0hsy2N3CNhR9+ezcpqKLnM9I15TUNBk4k6PoDvRfkh7sJUnT7QUmVrfvzTig9eO0NIbKispPmz4To8jcSMNUxpyVOMGodXWtaIaAKwRkhjDFc34Zd1l/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo5QVvtIskkluTtHjqFarDeLQQMVhhmWsi54LUX/GbI=;
 b=KT3q5K/EhdF5A3QXX/M+NNcrzMdqLxehkRsv2gAhPJDysHo7Yug7Z/SjcsUxMBMuxreYEKeET3HnKJGW/gUD8EWaovLWuQ7KIvMfxRXyAjAAViTwoS7PwNLKw1bQOqyhJLcfDue+B5AW9z82eiAgrx3I0kscU2dBzvuH4PFG9D8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citirx.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 1/8] vpci/header: Emulate extended capability list for dom0
Date: Mon, 28 Jul 2025 13:03:54 +0800
Message-ID: <20250728050401.329510-2-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 915302f0-4708-4e90-9171-08ddcd943a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1pyakY2elNmSjdoajQ3QzIzdW80bWtIRUlsTFZFR3gvQXl2cXFGZytaOXZB?=
 =?utf-8?B?dk1XWC9mVE9KakhpRU1sazJMN05uYWYyaUphVEJIUjhYRUxXUWdqbStaWE5P?=
 =?utf-8?B?Si9wQjQ1SC9MNlFHYXpqdWM0OEt6ZWp2d3U1TnZwYStrWUFLMnQySW5FcUp1?=
 =?utf-8?B?S0xCLzJReUkyWW5EOWZ0RU01RzhFMjhML0ZNbC9sK0oxbUtmRnZ4WlFhZ0lZ?=
 =?utf-8?B?NFVJZW1kOEpVaExGazR1WE9tS0JvVTN4K3ViTVlnenVwR2VuMlBDN3BzWC9G?=
 =?utf-8?B?dUR6N3lkUzdFeXdEc1FWN2VRQ2I3a3BrcG4wKzdGaW5DNUJFRlR1eDYrMUZs?=
 =?utf-8?B?bWRGK0tsVXdaWWU0OCtqYnNCcFlhOEtGWThtN1ZHdnErendqelZRdUJ3Wllr?=
 =?utf-8?B?TThuc0grOHc1Z2VRQ0Q2SW8vYlN6UTNPamlzaktEQ3JhVjVGZlZobWh2S0Fr?=
 =?utf-8?B?MEdmYVdsODNnUmxVRDVDY3RNR0dqazFVOEI5c2lCdVBRMzNOaGZNWEplemtH?=
 =?utf-8?B?MHJKVUY2d0I1RVk1dTFReExla3VyVzc2L3Yyd1IwYkhqNjkyMnVFWnJjOVl6?=
 =?utf-8?B?TnBheGh3WHhhUWNVc3VmTmpTUGRiNS9WL294VHV3dVlCMWdlZmN6TU1rU1NT?=
 =?utf-8?B?R01LVjY2SEtEOUJWMktZelNFWFAxRkFUUG5yUDF1SHhBMmlYTHlpSG1RM0k2?=
 =?utf-8?B?aDV6UU03NzlicHVNZ0NJdUJDRzJZMjJIbnkxUWxhUVA4TmE1MUU4b2pvVTd1?=
 =?utf-8?B?MmFFMDVYNm5wS1hLOE9GY2FIU2pzeU52N2NvaDB4aC9PSGM0dzMybmU0VXdT?=
 =?utf-8?B?N2s2SG9xRDNZTHpBaXh4M0xJeCtCYUVOSGVYbVVUeHUyK0JxMWozbmdObDdQ?=
 =?utf-8?B?eVRLUGRBV2hRbGZ6RzQ3U2pOSUxJUmJDbG9IdGIzdEFWNGFydnVRdmU4Sk54?=
 =?utf-8?B?Mlo2TnE1UTJ3SDRwa0JmdkQ0QUVJd2k2cEc4WWluRzRjbGlmeWhqTDNwUjE2?=
 =?utf-8?B?MjF5Rm5aUG14SDNwaDNJelpSdjhDRDIxQmFaVC9zTHh6VWxXblI2UWFhdDNK?=
 =?utf-8?B?VzZRTnVzOUdwcTM0bnZRbE5MQ2REU0t0d3RtTTlXNEswalhmK05MOVBWOGdK?=
 =?utf-8?B?R0Y2QzVXeTlHM3NaZlhPZGxvV2NxWXA4YXYxQU56T3ljNUpBNDc3SXpaMHZV?=
 =?utf-8?B?WURsWVJRZytYcWZHK1p6dzVvWG1na2pZRmJta0hZeFErWUEyZnBlcExva1Z3?=
 =?utf-8?B?WEhLT0g3UGRFM29kdGFpT01VQ2JmMXFGVGsyWDhnbmtJNEx4L0xxVjFYWUFU?=
 =?utf-8?B?eGpLdFdTb21FWXlsaXlEb1E2S0pmVU80WWtxUW9seE9PRURVU1gyeWJjUCtN?=
 =?utf-8?B?cHBqV1NQOG05QlBibUxMSy9qaWZhK0hucFcrQ0taYTVtZ0w1NkZBemdNQkNz?=
 =?utf-8?B?TktIWVh2VTVHTWJFVk5jK3R4K2RGMjZPRnRHSExsNHFLdjI4Z1phNE5Wc0lw?=
 =?utf-8?B?M3V2aTNUSVRhSTFQUE9LM3pqMzZkTlhxWmhzMXFkbDlQTDQ4T2dXQ3pwQkEr?=
 =?utf-8?B?OHhSdlRPdWJtbERCV2praHNzWHVpS1hIUUZUOERRNU94ZVN1enowdzNkMTVp?=
 =?utf-8?B?M0FIVWhrR1hjOWZ1WmhTelpVWmpnYzJQeXZMUDcrVDZNNFZFU2tCTnkvOTRP?=
 =?utf-8?B?cWJhNjVRclZxTi9mMndZaTRCZTM3WlEzOHdrNlBmb0IycUNvSi84Skl2M3RC?=
 =?utf-8?B?UUJ6SkpvVlNlZ2JYN0MwNjBIL3F6MytQT28ycTB3dFpZRWNKTzRTYlBrOTI0?=
 =?utf-8?B?YTNUWGNtZE96am15ZXdRV3c0TW9PTEZROHJTaFZYTXNpSGxlWldJMzhsK2dm?=
 =?utf-8?B?WmkxeTRKOXhDbW1HNzg4OExhR2lHb3p2VTdUNWNOZXk2YVJyRDJGejl3U1ZE?=
 =?utf-8?B?emV3cnhOTGNYWjdEdFRUV284aTZHWm1JcVpTMTZTcVVOakVyZUIrK2RBQVZx?=
 =?utf-8?B?bEgzc3pOd3VRT3hjOG1sYmx6TUlsbU80SGlLWFNaMitLTmVZVGNlckRiN0dD?=
 =?utf-8?Q?BI/nZs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:27.2017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915302f0-4708-4e90-9171-08ddcd943a4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

Add a new function to emulate extended capability list for dom0,
and call it in init_header(). So that it will be easy to hide an
extended capability whose initialization fails.

As for the extended capability list of domU, just move the logic
into above function and keep hiding it for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citirx.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v8->v9 changes:
* Add Jan and Roger's Reviewed-by.

v7->v8 changes:
* Remove the unnecessary function vpci_hw_write32, since it can cause the value of the
  extended capability header cached in vPCI of dom0 is inconsistent with the hardware.

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
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index bb76e707992c..f537f3f25d2a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -825,6 +825,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
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
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
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
@@ -877,14 +910,9 @@ static int cf_check init_header(struct pci_dev *pdev)
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
-- 
2.34.1


