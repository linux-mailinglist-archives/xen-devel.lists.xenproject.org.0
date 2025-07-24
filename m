Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91949B1002F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 07:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055186.1423686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqu-0006ZG-PU; Thu, 24 Jul 2025 05:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055186.1423686; Thu, 24 Jul 2025 05:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueoqu-0006XE-JA; Thu, 24 Jul 2025 05:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1055186;
 Thu, 24 Jul 2025 05:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42zg=2F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ueoqs-0005TY-DX
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 05:50:46 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f403:240a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22f6866b-6852-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 07:50:44 +0200 (CEST)
Received: from SJ0PR03CA0128.namprd03.prod.outlook.com (2603:10b6:a03:33c::13)
 by BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 05:50:39 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3) by SJ0PR03CA0128.outlook.office365.com
 (2603:10b6:a03:33c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 05:50:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:50:39 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:50:35 -0500
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
X-Inumbo-ID: 22f6866b-6852-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLlFLDm+pt1vHjxcU43aj1CpKMEtqXn/nLmqhNbK4xL7mmkRcHOfOKPhYCUY96cM8Jz7ZyA1zS0vcu8cCLt5axz45OO+DG5+0F9owUdNA8btW6L5SDOywYl0IvsviQOXW0ggsk1h+hZpBj+eDDHFdI98UE6todJcTIGbdwFERmEX9LjSsm0f/J3CjSc+Tk7Jc3DMpgQ4MJnLkAPdDN/Mg4JwLLZH5GGhRoNMcjwCypu4E2N+J00L9q6AZ64z+amvfgkyq9gIKOLeSpXnvMaOzZbWZaOw4JhcSwhu2+gKJPD5D9O9f1UKYFUyq4P/0ufYE7tzrlxSkeJ6Jt5JmYC8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fROjowYC6xswNml4/TejsqMotJLI7/RNAOFtD48HCJY=;
 b=MAha2mQ80lXnOx2nXYjlVxJDwQLsrFLviAF8IyahqfOl8gazpCEtg27kVhSk9FS1FvUEptrK1LZph0h2HpZWQ7AT/My0myl0NHhi6i2D6X1bjEXSJ+CwcC/3nGZAhe7ejCg6IOUp1Au+5Ziyw0o+Bs6Kk/nRWFep5kpjNv4pQ4XHBVqQ2VvgCCTGbznOQxi7eEyokxC/fjkMrw8Z7B5iFdgi86hwOVjEq9xEPqVsehKpL/G1dXrcigt6dWIYaKh5lLqsFQXaBURbf++THqOaCRcz0EvVTNq+VSUisgFcYYl1zKyvehqd4/Ug04ArxAddfDEVgAh73lv1v8/BZaDpJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fROjowYC6xswNml4/TejsqMotJLI7/RNAOFtD48HCJY=;
 b=MXbmHtyTo+33mUWOfbjgguJ4q5iKfulnWsK6/kXS1LJ0HaHSyrg15qKFO7uuY7IRSG8GB2uySnn7ramALfNim/fAwOtNrEqFwxNpVe6MlYcf8iNJQj70VgSZf9CBHwuL+VaOLzbWaVgANdgM5Qec5ae5HuO7UceaEiIIE9tkOco=
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
Subject: [PATCH v8 5/8] vpci: Refactor vpci_remove_register to remove matched registers
Date: Thu, 24 Jul 2025 13:50:03 +0800
Message-ID: <20250724055006.29843-6-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f71152-2aa8-4845-44bf-08ddca7604cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWZqN21nWTBHT3owRUtLTDQ1bVVPRk1kRSs0UnZIS0dEQm1kVGZkUWRrVTJT?=
 =?utf-8?B?VWUwWDg1WVFGQzUzK0pqd252Y3hRSFBNazROcEdqbDY1aWc0dm5qWFdNK2RI?=
 =?utf-8?B?UnFWa2RKcTAxaWRVRlQ2TFc1N1Avc0lSNjh0cmtqbzBCZFpVR1NtZ2VRKzNC?=
 =?utf-8?B?NkpjY1FPRnM2OFZxNi9VbU56L3dUQkxSZnR5YXIvbHhmT1d6VEx2aEREK0V1?=
 =?utf-8?B?U3k3a21PWiswbkhwdUFGd3c1Skg1Q0YvallNUzFwdmFmQWk4ZkhJSTJpaEZW?=
 =?utf-8?B?czd1THdIdWE2NitMK3pkaHR1S3BHUWtHM3JLVjNpVzZEcHI0eTEvOUxCbGM4?=
 =?utf-8?B?MUpNVnY1Q29pbVdtdzVyOFdGdnVxdXRySlJOTnZmeXlsNU00OXVaV25QYlFu?=
 =?utf-8?B?WlBhY0hudVVFOC9UbXNSMW1IeGN1NGtQV0NDYnFTVVAyVDZCTXg5emlrd0hp?=
 =?utf-8?B?ZmRURDhtS2g4V09ucFY4SlV4anFLU3FlQ3JIZGNMQTVoUlJKZG1qZDIrQU9v?=
 =?utf-8?B?dXhDYVBQUU4vWmdxakhKQ2RLeEZpVUlHQVowVUNuKzFId2VzQmIzaWwyYytz?=
 =?utf-8?B?NENsNkNBTFdTN1dCWEh0aFJwZ00xNGR5aDNEcHpnVTFoSC8xOFYvL0VSelhO?=
 =?utf-8?B?VTk2T1MwNW1iZWhCZkNDL1l0c1krSUQ0b1I1c1VkdksvYXlqMStRN0pIYm91?=
 =?utf-8?B?TXdwcmhIcEZmeTVZTm40Q3M2Tm5iUDYzZDdwbzVTTnFwbWlrdFhXeTltYUgy?=
 =?utf-8?B?bk5EQ1RCVjdiOXFJcEVOcGNpQWxzWUx4cjhLVVdtTktiZlhEaHNBTklvWWs1?=
 =?utf-8?B?d1o1SjMreGUrRlEyNWlOTHdjZHZTQ21ldHVqemtIeDVNcUx3dGUxZ09PazVN?=
 =?utf-8?B?dTJwenFnbEJ4anlqUDdCYUgrbTlTNWhWekhtRDBiZFZvTXE3OVl2OXoxaTQx?=
 =?utf-8?B?YnVuUDVOdXBPNi91VnFKcWxxS3prU29ZL0dESWFndG85QldTUDQzMTVxM2pa?=
 =?utf-8?B?QW5wMlZpeVVFMG9WQUk1RUtPdFVXa3Zub3J0MXRSaC96THdOZXRrcDZNYkw1?=
 =?utf-8?B?cU42aTJWamt6aWJiQ0l5VzM5WGFVZG5GWjRIRmJhZWhPZTRYUU1BZU5ncDNy?=
 =?utf-8?B?UmlJcFFacGw5TWtSb2h4dkZDNXpJUnNZcTJwa3dIQUdmQVZTbENyaFZzZ0N1?=
 =?utf-8?B?OVltWnVXZVFibzdhczVGYTNXNE54K0hJWHp4eDJaTVZ2b1lmZXRvRGh4OUh3?=
 =?utf-8?B?WFByem5uV3VhTDZOa2VRdmpFNHFPR0lIRjMyTTZBTlFTYmZrMUw5dlZwQVli?=
 =?utf-8?B?YkdXMWJUV3d4VU02U0VsUGpOYVI0LzJyVE1SWkowdFlVM2QvTFFNWWJxdEdi?=
 =?utf-8?B?Y1ZzU3o5MVRpOUtXbmVLZ3VKWGxrekIxWXFKQkRqRTV0a1c3b2srM2pnd0Zi?=
 =?utf-8?B?R1dUTXRRblZCVitUTmhIQlNVNVlIQ25SOWppRFh4cmlVYi9sejZlZS9saVVZ?=
 =?utf-8?B?UEdPV0pLY1p0R0lRUy9TNHdJdFZKVW15WG5teVZGbURnQVNEMVNoYXBYM0RW?=
 =?utf-8?B?aXVsS2lzODh2d1YwaWdIQkFHaDRZd3dhWGVGYlFIS3NOTkt6UE5idTE4dG4z?=
 =?utf-8?B?am9tVEFvUUdzZVFrN3ZCQ3BIQXExT0ZRb09qSGNTa1M0Vk5GdFpiU3ZKZXA4?=
 =?utf-8?B?d21MdFVEMWVCU0huaGhNOEMwZGtjMzdmdzFwVWszVzAvOFVldlUvcUg2Z24w?=
 =?utf-8?B?SXNnY1VYRTlKSVFyR085QmtmMU1tZDlUSkNQZHdKWkJ4NnRKdzhGL1IyV3RD?=
 =?utf-8?B?RmJaUzhNbVR3M2NMMlN2Y2R0Qlp5UmZmRTEyQ2VJd09aRFFmY3RJckUyT1Mv?=
 =?utf-8?B?bDRxcEg2VFI5R05QSk1vcXZ5cmJRNmx5U1RodUZxeUZxQVZ0NWhJUlVpbXRH?=
 =?utf-8?B?TGNKZXM2NXFiSCtSUFgyTlBNMXMweStiSkJzRU13WnQveDcwdXVnRHQvZnFk?=
 =?utf-8?B?WklhR3F2QWxSdVJFa1NRRzNKL1JVQWlha0Z0NlhIdGpBbTM5eWNoVTlVa05D?=
 =?utf-8?Q?5pUGax?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:50:39.0779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f71152-2aa8-4845-44bf-08ddca7604cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533

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
index 26cda5b3262a..dd9ef166b412 100644
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


