Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695AEB10031
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055181.1423645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqk-0005M1-ER; Thu, 24 Jul 2025 05:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055181.1423645; Thu, 24 Jul 2025 05:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqk-0005Jc-BN; Thu, 24 Jul 2025 05:50:38 +0000
Received: by outflank-mailman (input) for mailman id 1055181;
 Thu, 24 Jul 2025 05:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqi-00055h-7R
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:36 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2009::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cf06d33-6852-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 07:50:33 +0200 (CEST)
Received: from SJ0PR03CA0125.namprd03.prod.outlook.com (2603:10b6:a03:33c::10)
 by IA1PR12MB7616.namprd12.prod.outlook.com (2603:10b6:208:427::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 05:50:29 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::7a) by SJ0PR03CA0125.outlook.office365.com
 (2603:10b6:a03:33c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 05:50:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:28 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:26 -0500
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
X-Inumbo-ID: 1cf06d33-6852-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDs61jMyi3D44Fq7yk3Pk2HPlHSHSnKb/FLdIQpa/NYgBNbUh7SEZ0rT5USXdRAp6ZPx1iZqZqnSognsbwtEFhwInH8lCG2r9QBs1t1zvxm6TR77S+KPI+WA40y+dS+y1FPljYP+DghF74W3rWpBn53hyFmK3iLF/cp401D96zRzFakSdf8C57qCFfqXnklcxAtlFWuKA4pPA0t8O3T/2rIQRUrgHy8Vh0bnNl0X69jpy2o5Qbo+TJYWGUWJWFUtGh9ZySV01+FfoThUYiN0diGQf1p7OYm2bMNxuKS18yHC0KevfldP1rn1EydMhTg62Grn1CE5jh5ffRNwZkJ6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpMjTV163lpTRT7Bn9+BYXZkWjY+J7JWQ8DqZf2HCaE=;
 b=tPDke2/UuVfCQx2/sPi8bpaMTCho+hHwwtOdeMqrbyCCwr8cJ5abSqGeKSSxAOX+0kRG5nLwGRD4MBebzFzCWbmotFt49GKLI/oQyYc4UcRksyRxbzb1c4KenXa7PMsW0pimbZiSAHMNqnEvsmZMvsdr6VTM7XT3KJOb92dlVcU/YwY6D7ZDouIEsbKYIaPVe4YfM97fohXsYV6Ipyj7IVrmbyKHQNvMmXaoAkgFusYBNoin7l2q0xu1rh9qH0crQG2Jp3+viCbbKOCTfiYEWV4BXb/71G7FNHe2iLpSDaQjOlChf8Dotk/uhgZVtSd5T6DzmI38chkx1z5AlxwX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpMjTV163lpTRT7Bn9+BYXZkWjY+J7JWQ8DqZf2HCaE=;
 b=K+eVuGK/HOSJ588wddZiw/C9wIuKO9kOZt3hf1yI3imWPtTGbek37vC2TASefPFqgdMUqdfloduyhtPR+QPuKBiFQRunJScV/wWUlWI46ynHk04E/aAJDcsLqmpao3MKuzCM7t8AdZGJzVCrboPnsZATdS1pL+oOt3bOxONTMKQ=
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
Subject: [PATCH v8 1/8] vpci/header: Emulate extended capability list for dom0
Date: Thu, 24 Jul 2025 13:49:59 +0800
Message-ID: <20250724055006.29843-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724055006.29843-1-Jiqian.Chen@amd.com>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|IA1PR12MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1be6bd-5a54-46ac-7b37-08ddca75fe97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWhoOVBTSzNEVkprdU92ajFVQVB6VjcyS2JRbFNpWkxSdllhWE1oeUZmZFRp?=
 =?utf-8?B?OWFzbWlGRk11dmFDM0xiRCtxOVVHUVRUTmNKaXgwamttcTNMQ05iOXV0d0JN?=
 =?utf-8?B?YzlrcXZ1KzZBYzYxWEtBOVFiNXhhYVRYeEJMTmM4UzdFK29vVDhiQzBLL3lM?=
 =?utf-8?B?eG4vWkJjaVowTnJaYk9BMEpOWlJsc1laUG1IeHdwQy9hd1M3VnhqK0tMV0Qy?=
 =?utf-8?B?MmRKeHkvbC93RERPT1JjU2ZOWFdOdHlvalB0V1FJcm41YTFwWkY2aEhvVDZC?=
 =?utf-8?B?UnlrUWdmQkN3Tk9KZXE2K3pTcW4ycEhQL1pPOXB1dUMvQjVYdnpIL3RtdGZF?=
 =?utf-8?B?eVl0WVYrVmFBcjIxWHZYakVQQTFHN2prSlNMNkZJckhmdDFoV250dWJvdmNC?=
 =?utf-8?B?MmhOdkxHM1p0THBjTFg3cnQ5TXNqK2NDeW5xclpydXNBQ0hTdUJhYWdxUG0y?=
 =?utf-8?B?WS9VNzEwdzV4Sk5UVGVBZEVsY29MaGgzZHA4V3VUTFZsbXA2OVYrb29WTzFj?=
 =?utf-8?B?aUV5b2pRemlIdEhDNnQvMExac0RZQlpzWGVkUXVONERnYzRkdUJTeVVqT3RG?=
 =?utf-8?B?RzlRMithMjFDbkdBVnNLTFBGS0NBalJJNS9oUG5tU0l1RTZQMWNxZFBScGk1?=
 =?utf-8?B?ZE1qdkphTXpMd1RlRFdKT0c3N2ZhRnlFcjRPQTNRU1ptWm1FM0Z5NlUvTFBG?=
 =?utf-8?B?S1RrUEN6dlVOSyt2S1pOdUxDRWNQY0k1SnlGcEMwTmNWL0Vacy9YSGVyLzMr?=
 =?utf-8?B?UkNQWktSTkk5L1gzRmQ3bzl1L2ZteEQwNSt0Sk9wQkxBUmxqK3BLMjVXbGVj?=
 =?utf-8?B?dVFGNkU0ckdNK0NlMVo4S1ozMkViWGtlb0tPVEFsdnZKN1RBMDk1WmlhaFUv?=
 =?utf-8?B?aDZEM3Y0SExMSlZJc0dVWndRUzE0eGE0RE8rNCtoYTNxOWZDbFNWcHcrTmZq?=
 =?utf-8?B?dnE3NThaMUN0NVdSN1hSY3h2N3FuSFdZcjR3WW9oS292Z1lSYVE4d0hCcFdY?=
 =?utf-8?B?ZTlvMlI2bHBPYXVha0dvQVZrM1h4SndrYnVrQTJpbHNrOGRPOUdyanVxRHJQ?=
 =?utf-8?B?NEN6eFBVOXA1cEVRZ0lVR3k1WFIrMnpXdE5jdzR2aEppekhVUVZRL28xMllu?=
 =?utf-8?B?bE1NUGFvb2wzcXRGWWVQUjl0UWlwWjRvUm9qalhqWmM3dGlVM29SWHJQckNQ?=
 =?utf-8?B?ZFJ1NGc2bDV3czNMdmhBa05VTVcySTUvem5PZDFaOVF6UjB1Ymp6czRPcm91?=
 =?utf-8?B?RHJpRWJkTm9wSVVIUE43UjhHL2thZElXM3JjY24rcDB3ZERIa3Q1a3ZtV2w4?=
 =?utf-8?B?YzFITmJUS0Q2RWp5Mk9JNkxRYnluSmlyZTZ1UkIzNTVqcnVMdnZWTnUxTnAz?=
 =?utf-8?B?dmRZZVpGWHlNLzd6RmViOGQ2MElTb1FQVURjM2tUT1pIQWxkNWtLemQwYXpk?=
 =?utf-8?B?cXFSQmp6R0hBT3lYQ3hYTVNqNElYQ3VCWXMyWkNuSnVJTEN2MWJ3N21pa2Jy?=
 =?utf-8?B?ak5uYUZabE1jTmhPb1k1SVBVL3dZbnI3MFJSM3hHbXhTU3E5b2Z6a1RJK3Bt?=
 =?utf-8?B?cnpHNlU2UCttSXh2RDVjODNWSkNQY2gzVUZucXpzeDM4WGVqMnRvYU9PaG9l?=
 =?utf-8?B?cWF4S3ZRRzgxUW5sVmFra3NRYjRJQXRkbFBPbHQ3a3VCTHluVGkyL3hiL3F6?=
 =?utf-8?B?Q3o0L2tLKzdzV1J1YXdlZ0JUQkNJVEJ0R3BtdjEzVDdaRkk4WHlvTUxKakho?=
 =?utf-8?B?Zkg2ZE5oOGtmNE9meGR6bm9HbGtKNHZkWkF3NTR5cHgzMjZNdUZGOHhubFFD?=
 =?utf-8?B?bEcySnVqd2huUzZkS1FVdmQ5cklYMXFVQkM2ODFRM3ZzS2RnSzFCbWoyMUtU?=
 =?utf-8?B?ZUVNWVdsNEV6T2tXMGNWZldJMzJ0VHVsSUtZOHpOQWFyNEVTRHV1UzNISlB4?=
 =?utf-8?B?YkhXa2tnSW9jU2RyUEFmcVlFUUwwVStPUDlaY3dOZGxpbXY1bk5nY2dlNDVi?=
 =?utf-8?B?aDJtaGxmRmU3cWZWVDhmY3h0d1ZQVkdsbWJtZ0NpUzdTdW5QRkxJSXlQd1JI?=
 =?utf-8?Q?WcyhBv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:28.6440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1be6bd-5a54-46ac-7b37-08ddca75fe97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7616

Add a new function to emulate extended capability list for dom0,
and call it in init_header(). So that it will be easy to hide an
extended capability whose initialization fails.

As for the extended capability list of domU, just move the logic
into above function and keep hiding it for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
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


