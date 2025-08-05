Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99400B1ACF0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 05:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069924.1433609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8g6-0000xZ-W5; Tue, 05 Aug 2025 03:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069924.1433609; Tue, 05 Aug 2025 03:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8g6-0000vL-Sg; Tue, 05 Aug 2025 03:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1069924;
 Tue, 05 Aug 2025 03:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSY8=2R=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uj8g6-0000he-05
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 03:49:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3034ca4e-71af-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 05:49:29 +0200 (CEST)
Received: from CH5P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::16)
 by DM4PR12MB7648.namprd12.prod.outlook.com (2603:10b6:8:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 03:49:24 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::78) by CH5P223CA0014.outlook.office365.com
 (2603:10b6:610:1f3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 03:49:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 03:49:23 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 22:49:21 -0500
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
X-Inumbo-ID: 3034ca4e-71af-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vL7BS3/UQHhRWtNVwHwNbi9cF4Cqfax3g0Zo+Z2O7+ocBfmKdcWGv85GUvQ50xow5tPOTK3/HWSb7msJvlLnQdyvmpA+0rUWIsk/QKPcqGjMFQBrM0bxfVR+TkANIb09KE6Jev5nPHxMmsoehSqppTJAUjXarCqspqWLG3yEfpZ7K+BFs5MAJkybAG9yR5nThOyYUlPEUdYgoLQ9SzhQgjtxyxexIwPdxM+rdmGOwerCvlJiemRq+dHk6KaPhL0kO5hbt7KuTWYMA6R+ZmjrEu3CCRStp8b6G9JLaSmxoKww+/v49oQfZBvaWz2lwjKCEoIkAd6brXurGyxzl21Y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iK1TrtKUBCqb43ttFvfm60c1NdIPQH0xJz5TrNUWEM=;
 b=y86vqyN6EGnQ44vT7OovzrLJa5YL2Hc20AjcCYoITArNpxugFkNTl9zdNWp4yenqHPJNFAR077fUwHX4g4Lld5M41IGj6byg7ZTZPK/ar1ghe4YTedt7X3C36Ovtlu0OkGRpXuEHfe5WT0QzaYAAYV4Tbq4pMWcGjAy0hY5jtw3/Revg6pB80GxA1RK+yjy0ZH0saZKr2wqlYlFJYXwI5NpDy7tThTIRB1QY6Y/7L31rXBmF516aHpC34adIvf9yzsI8RD2XWTkOgDYGvwHEE2d/nlUiPjFLNfuAtD2SsACgNWXHuocgpAzH0dGMVRLhh7ztoFtYhO/m6yUiLhW2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iK1TrtKUBCqb43ttFvfm60c1NdIPQH0xJz5TrNUWEM=;
 b=qDYgXwOuLJarnhQLjSw+qXaGFPHmsTT7Q3WlqcbvhxDbIV5+zwAr2klFzdVyAr23LLDyKw9CkceTvIej2XztXp5mPt+/BGN24bL2xGgRN9+z7b+DcBJtOTA7M8lEDeqVkgDy8wZ54tqYWNyESq4tag9/Sgjtyq1ij/RegHw7yjU=
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
Subject: [PATCH v10 1/4] vpci: Refactor vpci_remove_register to remove matched registers
Date: Tue, 5 Aug 2025 11:49:03 +0800
Message-ID: <20250805034906.1014212-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|DM4PR12MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 0368f18e-81ba-4a50-a6dd-08ddd3d31159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3p3TDNDSXpFUFZRNmlRSUM4OFpsTGdpRTlyY0FHT01xNzgrOXV1ZDBXLzdQ?=
 =?utf-8?B?TVRObThRZFRnWTc5SHVaVmI5UW1rYUpQc1IrNis5dHdxdzF5S0VRVS9VTGdy?=
 =?utf-8?B?SWhodnoxWXMzT0pXM2YwQ1JxeVhSblh2eVBxK212TVFoRDJFRFFOeWxaZGNY?=
 =?utf-8?B?cXJyajkveXU5dE1jUkJGVjFuT01BVlpTTnNiSk4yRUlFOTl2UHNjRk9Nd2tQ?=
 =?utf-8?B?RzJrWFhGMGNCL2lwUzFwcGN4Q05QaUlSQ2ZZMThMZVBPcm5mQmxPc3VwcENP?=
 =?utf-8?B?MFZBNDVpMFN3S0s3U2JPVHM2TWJUY1JoZU5HMnZuTkljZ0NEQ3ZUSHR2MjI1?=
 =?utf-8?B?aktRWXN5dDZ1ZTNuWjFzakkxM05wei9weVJpakJTWTVTOW9wK1hGUzY3a3Vp?=
 =?utf-8?B?ZWRQVWNpTGpYYVRrMjZmdS9MdDFnRVNPbGZ6YVFwZGFod3N1Q2hHeVNwdGls?=
 =?utf-8?B?cVA0WmRyMHJJMCtyeWZPZXRJWHNGZm42SCtyOHlxQTBkTkhOT0JCcFp4dnBE?=
 =?utf-8?B?bENzUUM2YmEyendNUEg0cnEzdnhjdU13OURaZHBObCsxd1BORDM0bEpWNXBM?=
 =?utf-8?B?NEVIS3Vna2JLeUJGNVZqR0E3UFFZK3czbUt4Y2t1dTJOU3RwTmpDUTNGN3Bw?=
 =?utf-8?B?Z1hhNkNpWkpaYVp2ZjZyWWtrWFhwTGV0b282MHFIb3Fqa2VlZnJiaUxNYlBa?=
 =?utf-8?B?dnNIVnNkU2FEdU1zS0FsdVRxU29aTHRyOWFmZmNnZ2lHSUZRb0VTRXR2TVlK?=
 =?utf-8?B?UlVXOEpzU1BqTkxaTEtiZ0ZuRzhab21zYnN3Vk4yb3JWU25MM0xybEN0dzJm?=
 =?utf-8?B?M1FjckR0VWJldm9YcDVYK0lZU3Y5WEE1LzZKT25DU2p3SXhrYm1ESUdJbVBy?=
 =?utf-8?B?WlE4bmRLOEdyRlpsNHFzTWxVMS9NN3JFOVE2TUtPdDVJQ2hOOWdtQm5Cc3Az?=
 =?utf-8?B?VWNESUp4Q0tyQUtiV0dlTE9iL1paa1BjV3MvUWFWUzNaa2xKWmN5R2ljdXJF?=
 =?utf-8?B?OGZ2UVYxQnNqeXk2L1NyRTRTNEp1ZStWZHcrZkRhMGdVYUJBcXNxRW5XSGVH?=
 =?utf-8?B?NDNKdFNmUi9yeE1QdDZFclp0eVBkK2NObURmOThqd1JiSjkvdkxwZ3BUQzJC?=
 =?utf-8?B?aCsra1lodlBOMG5OQlRLS1NZT1pBWUxJWFNWakl6cERONjgzRDh0OXBEZ2cx?=
 =?utf-8?B?L3ZkTWppN0RTUTFFSlZ3dU9jNm5USDgrcDJQNXFFMCtFdnorWTIzTzJ6YWxX?=
 =?utf-8?B?Tmw3dDcrS0VzeUdIZGE0STYyTjlTclQ1WXlXbFc4YUY0M1B2cFpmOHJVVS9t?=
 =?utf-8?B?d1daM3pSMmcxL0J0eFZjRXhuc250MTREZldYc0tvSUhHUDFJbmVCdjBHRTlR?=
 =?utf-8?B?eGM1TjdGY3ZyaHdWREw0ZEhLZWVyY0tBbkhCVzJtWEVvd3dRbThUT0w1UGZY?=
 =?utf-8?B?aEpONTB4YlJDaXBka05lNjJnbE5PMm00eWM3UDh3TGdUVE1TV1JmZmptSGpk?=
 =?utf-8?B?cmUwZmg5V1pOa1MwNVJ6RS9LVW1NNUJ4dnFnbGlWdm1waDhsaUNXOStUNjY5?=
 =?utf-8?B?YkpyUDdFaDNBT0RqT2pyQW8rVmsxaDFMdmdQZWZLeFFod1hEMDI1Ykgzdi9N?=
 =?utf-8?B?WE43THF4dFY3TUUzSE56VnI2R2NvZzFIaDFpUmlLbURCYTVoWjZibjU0K2J6?=
 =?utf-8?B?MzhkVFFCenFFZDF0aVZBTlFuSTlndytEVVdERnMxcURwM01ZUTRCdG9BY1NX?=
 =?utf-8?B?cC9ZeFBuU1lCdXpFSEt1c29OalJkeVBzVjZyNjQ2K256NG5EekdoZGYzVVcr?=
 =?utf-8?B?TXUwYmpUUXNUNkxydUpaUUx4T3NSREEvNTZTVlRvQnJQeXlGS3VhN2p4VG5N?=
 =?utf-8?B?b2J1bzVUTHVreUExMEQwQWx2N1pCWWpiMVBtWVNtMm5yR29iTnp3Wjd4RnZY?=
 =?utf-8?B?cGxBZDhScUc3Y2pkQnBxM1dhNzVxSnpEUFRYU3pVWnZxdzUvMHAveVdXdTJ3?=
 =?utf-8?B?c0Q0dkxMUm9ZUU5aOUFQTnpKREtGc0luNCttL1BMdHJmVmlnLzM3NC9IRFB2?=
 =?utf-8?Q?IzYCje?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:49:23.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0368f18e-81ba-4a50-a6dd-08ddd3d31159
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7648

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a range.
So, refactor it to support removing all registers in a given region.

And it is no issue to remove a non exist register, so remove the
__must_check prefix.

Note: two test cases don't math the new logic of
vpci_remove_registers(), then modify them.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
v9->v10 changes:
* Since logic change of vpci_remove_registers() affect the test cases of
  tools/tests/vpci/main.c, change them to match the new function logic.
* Remove Roger's Reviewed-by since patch changed.

v8->v9 changes:
v7->v8 changes:
v6->v7 changes:
No.

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
 tools/tests/vpci/main.c |  8 ++++----
 xen/drivers/vpci/vpci.c | 38 ++++++++++++++++++++------------------
 xen/include/xen/vpci.h  |  4 ++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 33223db3eb77..2ef8d4e03f1d 100644
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
@@ -402,10 +402,10 @@ main(int argc, char **argv)
     VPCI_REMOVE_REG(28, 1);
     VPCI_REMOVE_REG(24, 4);
     VPCI_REMOVE_REG(12, 2);
+    VPCI_REMOVE_REG(16, 2);
+    VPCI_REMOVE_REG(30, 2);
 
     VPCI_REMOVE_INVALID_REG(20, 1);
-    VPCI_REMOVE_INVALID_REG(16, 2);
-    VPCI_REMOVE_INVALID_REG(30, 2);
 
     return 0;
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fd02718b47ea..91d40be5bc4c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -152,7 +152,7 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
 
     prev_r->private = next_r->private;
     /*
-     * Not calling vpci_remove_register() here is to avoid redoing
+     * Not calling vpci_remove_registers() here is to avoid redoing
      * the register search.
      */
     list_del(&next_r->node);
@@ -160,7 +160,7 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
     xfree(next_r);
 
     if ( !is_hardware_domain(pdev->domain) )
-        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
 
     return 0;
 }
@@ -549,34 +549,36 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
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
index 17cfecb0aabf..514a0ce39133 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -70,8 +70,8 @@ static inline int __must_check vpci_add_register(struct vpci *vpci,
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


