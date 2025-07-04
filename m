Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7025AF88AE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032832.1406248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXJ-0004vW-8M; Fri, 04 Jul 2025 07:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032832.1406248; Fri, 04 Jul 2025 07:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXJ-0004rP-3k; Fri, 04 Jul 2025 07:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1032832;
 Fri, 04 Jul 2025 07:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXH-00045b-QD
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:39 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:240a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b40e1f2b-58a5-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:08:37 +0200 (CEST)
Received: from SJ0PR13CA0186.namprd13.prod.outlook.com (2603:10b6:a03:2c3::11)
 by DS0PR12MB9727.namprd12.prod.outlook.com (2603:10b6:8:226::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 07:08:32 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::15) by SJ0PR13CA0186.outlook.office365.com
 (2603:10b6:a03:2c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.14 via Frontend Transport; Fri,
 4 Jul 2025 07:08:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:08:32 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:30 -0500
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
X-Inumbo-ID: b40e1f2b-58a5-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5Wg16c4APjKo7nw26frAWSKMlSn4vgEokdNkJUx8ShHX1BW7vrdS1FA+A6jnapQD75vQND2VV3HFDh+v7De1pzd/pg8P7/2hCoI78qOYUckzUG6IdivRmSF+oOW2r/CUADBQlo4n+0ERSuATUcOhEHvJyXhmtaxlh4B+A7XIVzSd0dppeyH+HFEc+HV5haNxlI6TBRGwsIYgJUAAS7ventb9bxfgg5FQIuKIBp5Dhxd42ZvwT6AeWkDdOCnIkBRaW6OHni3OSeUERocfP3uHdTioD+PBpZyzu0QH6oDyRGwekliMWWxXhCiHR3umadedS9n1iLgrsll5GJq4D99mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/9SexHoA4qYazYfI+r/csxcO7lxt/MmdntISjGyS1Q=;
 b=ek7LzEEk1DC4SLmK23GZAUWcwVeUEGyWW4bfxtiFCcvf3Ao4BE7teuCQBg5AeHPJE2dpLTZFgraAL65v76srJNaHl7FvAGOdyw3ypx3zwZPNC91Jad5kdKuIQr6/2RWA9Dzu8RUi8hXtuDIZxpBjYpGR9MGwPvmnsuLxRkJyyWc8wyJlb+RMb760JBA4ZX52N7iS7CoyV51O400Cb1fX1TUhg+2Usphk2auGR3wE2hT+sm/aIyErjwwPm0zkGP5a+3TsGM3/MbhN8R4ZIncbLRKBFsY4EmaCzxJdbbFi7l3iBdTEebA7ZzdC6MFObYvjrBmpT9WCYbYtQELbXOkOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/9SexHoA4qYazYfI+r/csxcO7lxt/MmdntISjGyS1Q=;
 b=Xhb1QCh57AbJQAG1MUXneaYyRyAQ+3XYOBxH/4HRsqv3qYBAgs01lm3/tc66NqYwSIj7cYSgvodju9gj2KNILNWwJxnx+yPzUcEwdMTRbeJQL/+i8FBxY+pNE9AKL+09Z682+QgTN7IlA88xK1ZQhSyBa5g2NbFRpsyDfVTTpcU=
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
Subject: [PATCH v7 5/8] vpci: Refactor vpci_remove_register to remove matched registers
Date: Fri, 4 Jul 2025 15:08:00 +0800
Message-ID: <20250704070803.314366-6-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|DS0PR12MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c73192-89f1-4336-7c22-08ddbac9961d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTBMbGZRZm9UbExhY2NLRWtudjJqbjZCeFRYZVJidXZpbDdIcFhnODNOTDI1?=
 =?utf-8?B?aFJaZjAzR0xZQVo5RStZOVZKWTg3OTVlaUtWb1dRWjNveU9WZCtabk52SUkz?=
 =?utf-8?B?dlFwNnBnb1Q0VTdRdU4ydzhYZjhWTHVoTWFyUGdYNStiMWVDRlZOMUxzWkls?=
 =?utf-8?B?eDZPZ2dVM2RCL2VpdVVZYlBKUzRQU1ZRVlpVcHFRR1Rja00zS2lsMXZHQ3Q4?=
 =?utf-8?B?QUNWY0FwZkkzczcvazJqMnNyVjRiS1Eyb3N5NVY4ZEhwR3VUajJxSW56cGJE?=
 =?utf-8?B?S0hoT1JwdU1EbXI2R2x2YStUWGhpdlpwOENqR0pMaGhKZXo2dUY3RWxRYlRZ?=
 =?utf-8?B?N1Nud0IwYnRrTXM5SFlWRm5SWGhXeE44WEk0L2dUWlNYVmQ2TnlFR1Y5czN1?=
 =?utf-8?B?ak82L0hQcWVLN0hIUjRPa2ZxeTdnSmdHKzZFY3VqdklZWnN0RkUwaHczWFRK?=
 =?utf-8?B?VEF0cjQ3YWdhYUdsUng4WUp3czlDVnAwZ1N2SUtBaTlsMHMvNW1PN3RnN1hO?=
 =?utf-8?B?UWVMNi9DOS9FU1ZReGROMU5PbWZYYTA2T3o0NUhZVWR6UXZ3dGs3SmJyUnNU?=
 =?utf-8?B?NnovZXN5RFRqSWQ0bHRKUzc5OW9jczdQTE5kWUVZTzZXMnd6Qml3b2NkeGZH?=
 =?utf-8?B?ckhIc0RzV3hPdnJDbFZrdEJnZG83bVZ3ZmxuaTVEOU5vbEg5c1UxSzdhd2s0?=
 =?utf-8?B?UmtPeGVZdmZqemtsbTN6bUMwUVRIYy9QMHBFS3BkckZtWkJEb3NPZHJwUHQ0?=
 =?utf-8?B?ZGZ4ZHlvaXZyUjlUbC9xaloyNG9wWjBWZGkvam4vYlVLUXNGdDZPTWRNMnJv?=
 =?utf-8?B?MXpBWm9SQTZLbXZqdXpkbmtvY3Z1Z0Z4TnJUUnFiczdqWEExcDlEcVBFTVk3?=
 =?utf-8?B?emFQaTJTM0NGaFNtTXNidi9iNFNXeFRsYkgyUW91YW54cHZHalI1T2RBbGRO?=
 =?utf-8?B?OGVpT3Y3VnBYS1hKdW5TUW5NZnVsck55R3I5ZXBjWUlCZDBlNFMybFBQK1hN?=
 =?utf-8?B?S2pQbmdJZzhtMGlPMVFGTm1PZUZSNTU0V1FlWERQZkwvb0diWFNFWHJpQ2li?=
 =?utf-8?B?OUI3STd4TS9OR0tmVUI1RVlaeE90RkljblBObEFPYVgybURMczgxdEFTQTZP?=
 =?utf-8?B?N3Btcm5JTEh3OUl2TmpBN3diZjkyWkpyWWF4UUxYUWtud2hPSmJNU3lLVTZC?=
 =?utf-8?B?RytWVkJVRzRscjViVTJGY21iOXN6WEZmbWF2a21QdXRMNHNPWmIySTdSVkJu?=
 =?utf-8?B?U1p0K2M1c0h0VkJ2QW4rRDI4dEwrZTU5dEJqbXNheHhiUEgyR1MxMXZ3WVVh?=
 =?utf-8?B?dVlFSDhOTEtsU2E5aWY2amZmenk4M0Rza2ZQOFJ6VFlhYy9KQmtiTTJiNllQ?=
 =?utf-8?B?Wk9GRnc5SHUxWCs2ZGFtT29OWUhlWU5mM25CZkNFNjZCTTA4SEJ1UjBTODdp?=
 =?utf-8?B?aFNZcXVzNXhuSmtZdy82MU9qUkM4QjYxU21sYVJZT2NpWVB5YW9XSjRRU2RH?=
 =?utf-8?B?NzVoUk1Yd0c1bUZpa1dTbmZia3kxVlBvVEtyRmV3SSt2dWwvdDRwbk9ma3JS?=
 =?utf-8?B?S3V6dTRDUHhBS3BmK09uSUZlTHMzSFlHY2RVdWhHaFNUUkpqdVREcUxTS3RZ?=
 =?utf-8?B?S1U1MGUvUXJmcktTT29LVGZmVjlEeGdZVWFNczZCRU1DVmN5WlB1Z0ZNTHNk?=
 =?utf-8?B?ZGVZV3VLSE9vM2dBVmlDalRrUTZkTldFeFVKMWQ3WkJzWlYxaVQvODg2Mkd0?=
 =?utf-8?B?eW1BSy8vWVdvc1ZuNzRhUlErL3d5VzJLV1RZVTZ5VmhSbk93bTNYcTNvQTdm?=
 =?utf-8?B?V3NGT0hLdk5tWmtIbFFMemFaUCt6a3Q3Um9QblJseHVsKzZ1bTYxMDd5dnFO?=
 =?utf-8?B?cGNETzc5Sm1GT0ZZZ3FyckQ0dU5JUlBmdnpQdDRNVFFoR0h0TGdqU3RhQnJI?=
 =?utf-8?B?emJ6bVVSeDl1QkJmbEtwMTY1b05QSHI4YVVJUng0OG51SHg0ZVhlOUw4K21z?=
 =?utf-8?B?VHNBdEtLblNKOCtBN3ZWOXEvVnBGTzNISlhIU0hjTWFYL0JxTXl0Z2RhTkdS?=
 =?utf-8?Q?S2fFf3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:32.4856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c73192-89f1-4336-7c22-08ddbac9961d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9727

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a range.
So, refactor it to support removing all registers in a given region.

And it is no issue to remove a non exist register, so remove the
__must_check prefix.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
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
 tools/tests/vpci/main.c |  4 ++--
 xen/drivers/vpci/vpci.c | 38 ++++++++++++++++++++------------------
 xen/include/xen/vpci.h  |  4 ++--
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 33223db3eb77..ca72877d60cd 100644
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
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 8be4b53533a3..71ba30bbbd6b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -152,7 +152,7 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
 
     prev_r->private = next_r->private;
     /*
-     * Not calling vpci_remove_register() here is to avoid redoing
+     * Not calling vpci_remove_registers() here is to avoid redoing
      * the register search
      */
     list_del(&next_r->node);
@@ -160,7 +160,7 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
     xfree(next_r);
 
     if ( !is_hardware_domain(pdev->domain) )
-        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
 
     return 0;
 }
@@ -553,34 +553,36 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
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
index 61287e5d2e12..91bb407c728c 100644
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


