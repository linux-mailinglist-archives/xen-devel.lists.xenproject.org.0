Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EFB133EB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 07:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060939.1426519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2Z-0005UU-PV; Mon, 28 Jul 2025 05:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060939.1426519; Mon, 28 Jul 2025 05:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugG2Z-0005R0-JP; Mon, 28 Jul 2025 05:04:47 +0000
Received: by outflank-mailman (input) for mailman id 1060939;
 Mon, 28 Jul 2025 05:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gHj=2J=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugG2Y-0004fw-2A
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 05:04:46 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2408::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e8e0733-6b70-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 07:04:42 +0200 (CEST)
Received: from MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::25)
 by BN7PPF34483F4BA.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 28 Jul
 2025 05:04:37 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::f9) by MW4P221CA0020.outlook.office365.com
 (2603:10b6:303:8b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.33 via Frontend Transport; Mon,
 28 Jul 2025 05:04:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 05:04:36 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 00:04:33 -0500
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
X-Inumbo-ID: 5e8e0733-6b70-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aO9Oo9aHjic4jrBn6nnHlUCuV+8tBTtxrRptQSU4joY45uTOXwePgmJf27TDaNaUCH5syHoWLAPisksT2I2KTu1YCWOTejLcOKhkSazedVZyGQZI866gL3JWJQmAtPEU0DRpjX3WHh+07S8RlUsn48FI8EstsWhYKiaCosZexwF20Uj82MQyAkdAiDrkDJsnu5MyrXL3X17nkpSHAODiM0LyTyTh8TDd+a34w3sAiwtix3+k0liHRWox/ZDBr6niwGTKBKnLwPTwvgxBYhRahaxHsAY2X7h+m/eJjipWTKesBYEpDq99QIA3ktVdkuVy+qVYAeLV+Mc7IXxnTIcxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn6rkUuvEwYslTzvS5oJzrktTgtCDW0UGWO/qNwM58c=;
 b=CdN0MwXjjvj8qyZ4X4BDtQhV8ifRetaT08S4FObUehwIez1JLDFihQaMzUyEngOhpd9Z4J9KU6Gy9H7AopEsucvvG5oxLlBKdbC6d8pdDpHBgKUTAU0poyPJNtFLMKt6Ua3BCkATwa5wt2ECLLK9lnCoZ88FjG/oQAIbkBYdSMWxuUuNeMRfZ2LxpmbGZo0L4ue91qeI0PPJnc/tvTgWK2OhgG62JTCU5dHhWIFA82JZaKmbZR+vRED/+RuycEJGz2Capca6DUpnY/5ajY9/kwTVZcDWeBWmIU9/uyhrhTXw0dd9xepe310cR/0XFcrPCjrSKGVBPhcx+IyO/TR+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dn6rkUuvEwYslTzvS5oJzrktTgtCDW0UGWO/qNwM58c=;
 b=m4p7cJ2pBWq+wb/z9KqWCgnUvYueHzMqtEJijpNFJPCPYWCIlD0OebQi8jCI5hCnLMb1P+Z9jo1kA9cgq6OdIgUpOKKjOnk1ugOlf7huu1mxB17JacN87t+RdwaXZQIY8rEWzvfj1112evQtFpd3lJKH4B8dEXFl161Flt+it+w=
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
Subject: [PATCH v9 5/8] vpci: Refactor vpci_remove_register to remove matched registers
Date: Mon, 28 Jul 2025 13:03:58 +0800
Message-ID: <20250728050401.329510-6-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|BN7PPF34483F4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: d36615c2-adb4-45d5-633c-08ddcd944010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVlzeWx6WUF6Y3VmcXdLWDg1d1pOaVpSUUMralZqcHNOV3ErTGJxank1WTR6?=
 =?utf-8?B?R3Z5STJHMS9xcm9aZXNUU1Qxdm0ySjg4Si9nNDVlSlNROWloQTY4cWZaSGhH?=
 =?utf-8?B?TDdjdHIvY2VrZjdpVFhHd0JwVEdPTTd4QmI5WEZCWHlTRDZVdFRKOU9XMUVR?=
 =?utf-8?B?N0VudDFFcGNsN3Z6M0FWWm1YVTUyd2NGdXREakd2bnlOSXU0VEJhK2p6dEpt?=
 =?utf-8?B?YW4yR2FKZ2V0ZFNkYUdqaU01c0RvM1B3UWY3MmkvdGxBMjVTTVZGaE0yVUJp?=
 =?utf-8?B?RCsrRnNKSkd3NE5wWkg5aGhOeGxCV2hpU2kzY09IcEw5ZHl0WUcvZE1sMWIr?=
 =?utf-8?B?elVVSnBLODBEci9QNmExcWYxMHc5NkU1M1piK2hRYmw1ekFFL2tPY3ZBSjZW?=
 =?utf-8?B?WE80WlNoR2JqUlNQQTl6dy84TkMxTC9hMGdZQ29DaTI3WE05NTRXUzdBb1pp?=
 =?utf-8?B?dTFsdXM3NWNmNE51ZjV2SU0wUVVoNWMzMmE3d3M5QVV6Y3FKY0MzemZCSXFm?=
 =?utf-8?B?YUFjZ0lIeSt6MjhtaTM4K3BqN083TDdHOFdYM1FCUStJVmlBSXNtMGpJMXNJ?=
 =?utf-8?B?b0orUFU4WHpxb0lwNXFob3FTK2FWbnd3eFhJSExiQWFrWlMwaVV2ekFINXJW?=
 =?utf-8?B?ZjVDNGdzMW9hUEZIU1Y0RC9mNHhvdHJLbStURWdldzc3elA4QmI4RUJ4ZS9z?=
 =?utf-8?B?WmRQQ0o5QXg3Zlpsbm9kWlJUQ3kxdFgwczcvN0s1ZmI3a1NMQ3U4MmNZRUsw?=
 =?utf-8?B?Si91bGJXWG1DVnRtR2pwQkNWc3NpY1IzTXhNeForZFU4elVYSnVpTzRUU3RR?=
 =?utf-8?B?bzdydjdMR0FzcXFZOFd3ZE5xOFRqVjdaSnZkMkVqU0QzaURlRkhiS1RPT0o4?=
 =?utf-8?B?dk5rUWVBUU9NeWo5Lys2UGx0OHFYdmVVMEhodlA5Ni9WR3g2d09DaDN5dWww?=
 =?utf-8?B?UWxGNzlGaFZaek5WV1hPbU9xUnN6NVgrVHlibU4yVlZZeXZBWTI5R1hEdFVj?=
 =?utf-8?B?ZXplUGVWRXlSSm4rV3JIN1l1SEs2NmhUUmo3cWZIR2hJVGZVSFNmY1lKT3dK?=
 =?utf-8?B?eGVXWkxHc3M1N1AyQW9DOENvakduODFVT2x6dGxFOGFxaG9ON0VjSndOa0cv?=
 =?utf-8?B?eXlKMUlRUW93Nlhndk11bmhtZ201VVVnYnVtVlFEWmxqWEdCZWNVcndScUt5?=
 =?utf-8?B?Sk5XWm53U3dNMjBjb1MvbFlDcDBhS21MVks4OCtiTVRPMmNMZ3JqbG03TzQx?=
 =?utf-8?B?ZDVIUExNekQwc2JuZTFTcENldEFNV1lRWFYyVXc5M1RFRWZlZmpwSjFXblZT?=
 =?utf-8?B?RXArbExVK0FZQ2FTWk5Kem1UUDVLVi82OS8rRnpEMVNrOGs5RkJCOE9HVkNU?=
 =?utf-8?B?Zy80THYzaVhVZHM5QlJuN1lYVDJvcktBS3JKR0J3V0FiT0JPTnN4MHBLbStM?=
 =?utf-8?B?cERSaTJ5TGJxZWVaeEg4N3ExSG5MemtIeGtuOUpJa01QcjY1TFdEamkxU21B?=
 =?utf-8?B?OXlXQkRQdXVtUGFabjFLTTVQZXZZdnR0bVZndGZJS3FIU3B6RDZMNFZ1WlNM?=
 =?utf-8?B?K1NrNG1SQXpva1JQL0k5VWxQYmFxWHRpaWMwaFRTb2dONFRKNUhTcHNFclhG?=
 =?utf-8?B?SWxTK0c0eE1GZ3J6YUYzMnpMdjFHdUdXN1hrNS9qSFYyVjdxLzZhV05VWkxE?=
 =?utf-8?B?TVYvRnNVTzVKcmZNbmRiZlhvbUs0TnFjb1NlWmk2QnVQaVQvcjZxc2c0U2p1?=
 =?utf-8?B?bG5JWFczVlBXME1XM1M5Y2MzMVNnaWVNa09iSWdsMEdpanRUMFY4b3JEU3Nw?=
 =?utf-8?B?RUpGYXRTdXlMY1NkeGRjQkpta1Y0bTZObnEyUUdLM2xlNHZCWVRaMTA3QUlx?=
 =?utf-8?B?WGZqVkRSYkJJNyt1T1FiYWF4NlZZWVp3U3RhcnFsRi82VS9yV1FGVHdVc3RM?=
 =?utf-8?B?K2lUQnNTTngvTVZzWW41UVgyZm96WC9pekllcUNvam1pblB2NVZwaTRDL1ox?=
 =?utf-8?B?M1prZnJPU2FpVk1FRjlVb1lCRlhLRU04N0x4WHZqN1g5U3lHMmRpeVJFekZE?=
 =?utf-8?Q?RmgnS9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:04:36.8802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d36615c2-adb4-45d5-633c-08ddcd944010
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF34483F4BA

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
index 01f5746b64df..4b8e6b28bd07 100644
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


