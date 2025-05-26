Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E000AC3D2C
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997349.1378298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPn-0005ah-DK; Mon, 26 May 2025 09:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997349.1378298; Mon, 26 May 2025 09:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPn-0005Wc-98; Mon, 26 May 2025 09:46:39 +0000
Received: by outflank-mailman (input) for mailman id 997349;
 Mon, 26 May 2025 09:46:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPl-0003hH-3q
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fbf4d14-3a16-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 11:46:36 +0200 (CEST)
Received: from BL0PR0102CA0017.prod.exchangelabs.com (2603:10b6:207:18::30) by
 PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 09:46:31 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::d5) by BL0PR0102CA0017.outlook.office365.com
 (2603:10b6:207:18::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 09:46:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:30 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:28 -0500
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
X-Inumbo-ID: 4fbf4d14-3a16-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJ8Esg4i7wvHMrzqORg86Mh9U0IN2HBwdlNGfqbS3XtoIULUBFw8t9fjUm9hWqMs1SplsSk0W2/hx88ZthdLd+ygwxpK15LxNEx6HjwNZfI1RKLblE6XR5DB9vXJ/tAhRV/dcAXZIUSYOBKjXdf5zEwzkfKiCW7tGGduz+rZdfNUFxUj209FMNJWFtP4+NNa1P9i5BCO+pFPdKpzE1SM925vL1rIU5lWAsF1zqASdlk1soKsMzrgVGHJEJsRuQHYwLqTcfZxqi8tp6/fQ+7bx7sUC9iHDciVowEUrrSXH/6WsiqMRsJLDpg6Er9RTl/7iUP3Gb63/V6MIOkATLCzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+CghjyF0DfUwZBc7m8sGLxK/5lEr3a3ULjAAbU6V14=;
 b=AhD61NMgmWkvzoegxQX7NPI4cDqz09GTXuDPg49+UGImRMufmSeoNGzSlR5VxHlgBy47+ld+JjPVJXYjgwicg+UY3EqPT3P69Pa0kLRz/CLNhWXnZnE9YH+2X/87Ad6UQd1PKcyWuCbUgr+f5bWcwjre9ibvHkAabOwJ5ALZ0A5rvtsWNqY2Silcyq+owyDIb9RDYJFTSFHR9fs0PdL32fq0GWUxHaAfPuglvHmm3LUuHJRQFJjthIY3X39ENzxbsf77X0Ms+Kmy2r27s2Ou35evYnKKYx72zKHVOCqIm0wQzlI6U90eWpZkSEGIy+usFdWNuuvzD8Ff6LUre4kGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+CghjyF0DfUwZBc7m8sGLxK/5lEr3a3ULjAAbU6V14=;
 b=aJL7pNmGIoVNvSrwmK6b4lTMpgzDKDw0jGr338ihcwr/K0BSkaFzsCYK/ZyhfuxUZ/VIrLqBLnVzddlP88rblO0VCQdT60h25UaQAN/X2U3YC7alAUwSdKnmIM4TPQvXFMVDyh9zf+P6gIcqu2VB5U6Wpyuy6N5snKbYXjIu7zU=
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
Subject: [PATCH v5 07/10] vpci: Refactor vpci_remove_register to remove matched registers
Date: Mon, 26 May 2025 17:45:56 +0800
Message-ID: <20250526094559.140423-8-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526094559.140423-1-Jiqian.Chen@amd.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 589ce9b0-eea3-4ff4-0fd1-08dd9c3a3166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDdYNHk5ek1KWnFEZGJTdmVjSU5KSjdVdGtFVkpBN3E5VEpPYTRDNTJkWUpt?=
 =?utf-8?B?bWxFWWdCRUplNUxLcTdxVC85MUxmaDhUSW9td0syaWYzeW5TVE5EVnM1ODc2?=
 =?utf-8?B?aGQyaUt1SVM0OHFNZ2p1NzNqdnB2TUVLbHFiNTJiTlpFN2gxdWpkWnZiQ2pI?=
 =?utf-8?B?RldBdDZrdUo4S0VzemcvZUtiV1NKWTlFdFJkam5hMjZ5Nm1QSFlTTGpTZXVN?=
 =?utf-8?B?VTN4T2hHMlRNQ2pOTC9tSTFrU24xRUYzRDNOSVNRUFZtTlhPbkpWVzJQWXRE?=
 =?utf-8?B?aXNjbGZobnFKWWRkOHREYjdoZmllWDJlWnJZT0FDQWorcGV4dlR2RUVqekl1?=
 =?utf-8?B?OStHaWU2VklERW1lRXVUQWZBazJFTGtUNUlmd1NnS0plejVCTWF2cklqTFd6?=
 =?utf-8?B?dVdPVDVlVG13dmNCNTNUS2d5YWZVeXBFNTUwc0puWTRMVkd0VWJEeUw0VzJP?=
 =?utf-8?B?Z0x5dHluMmRkaEZiZG1FSlFWWkFqa0d5V2dTMWNUTGM4K1p0NmZrcyt6SHBY?=
 =?utf-8?B?UlJ0UmlRQ0cwWVVJUWlwNkMvQThodEc3R3ZhL1NWWm9wODJrazNIVUViTCt3?=
 =?utf-8?B?aDhBamdRUGhISVFwTGs4anVyWDlwMWt6Y045RjNFbWU5ZjliSVd4d0dNcDg4?=
 =?utf-8?B?OCtrSzZyL2dSYTkyNkIveTJ5bnZ4dUZkNHpjUk83RlhMNkJrQjA0eXRQMldK?=
 =?utf-8?B?bzhXNWdIWTVNaUNFUmRVMXBSS3JJQkpmRmJWdXZpcUl4U3JhMDhPM1dxOFBi?=
 =?utf-8?B?TjVaSlZqZGlCRlA3VEloMmc0ekZCR0NwbE5JRjhZcXk0NmJhWUpRekNUK2JG?=
 =?utf-8?B?ZE4wZzZDRUlFTU5LT1NKNzYxQ2lndXA0dmJDSENPK1htS1FsY2RKTHUzV0My?=
 =?utf-8?B?bVd3S0VLU0VURFFpTEtBU2J0Z0ROSDdmRm5PWlI5Mkw1N1A1dzNRcVF3YjU5?=
 =?utf-8?B?TWYxbkJnZWdyckRHeVJINE5Sd1RBYWpFYklaeUVySkVYMmlCYjloYUlESmdE?=
 =?utf-8?B?cHRZL3J4ZkRBOXJKaEwzYk9UNXArMFJkbThMS2dYd09iUXhKOEg4bW1pUUZ4?=
 =?utf-8?B?K094ejFiRnlYeXNMb0tpUWRTNHhzZXlYUDJnbVJQMldoYUZZU1hrcmpYYnJv?=
 =?utf-8?B?RnFOQWp2NXR1MnVMUEZjOTJOd3VXaldhSUJYaDFSbTluU2ExazJaQXIzWFZT?=
 =?utf-8?B?SmVYdURzcGpTWWxPM2hKZkdLTG56UkM3ckswRzVLb3Jycm1TK0JFMmc4cjEr?=
 =?utf-8?B?VTc0diszTmk1U2pjbnBQL0pqeWFoNnUwTm9jUFRhSTR6cFVCSGZGM3c3am1y?=
 =?utf-8?B?Zyt2a0w4RWZ2dklRc08xOWFCSGl0aWJld3lPL25qZGx0dzJJckp0aFVVTmJp?=
 =?utf-8?B?bUZteHFrWkF2MlNCL2RScGdWMDZJejdvMXAvZEZQdm03UGQxc01JSXdCRDh0?=
 =?utf-8?B?WmxBVitsZUw3RDZxTmVYQWRPWUIvRmdvbGhIRTVHZzFPQzIzbjNWcWNlY1dR?=
 =?utf-8?B?MTN0ZkxxUGR2aDlZQVk2U2cybGRLa1lnZzBtNXFSQTZqVnVQOHljU2l2ZFRj?=
 =?utf-8?B?dlcralRPQXR1L3h6RjdQTFVTUXNDUWFwRzVtNEJudnVSQkdZclFvRVZ0VmMz?=
 =?utf-8?B?d1Uzb1E3RXE5OElKQlF6L1VnWnFjeGRCK3pWTmQxVVdhamlpN2tHbkJJWDFl?=
 =?utf-8?B?Y2E5a2UzZlBpbTdJOERFaDl5YkNNQ3JkbkJxMFdHMmI3VW1BM0lmbmV2Vkh5?=
 =?utf-8?B?aHY1OWtxNW5YYzc0eWtlWHRBZ3lvanhJWlBFNnRwSEJSTjU0WlBwS1pIWnBX?=
 =?utf-8?B?VjdmMVdvWEtHWGxRblZFbTlrTG1LQ20zQ0xjaHdKWHp2OEVpc1h2c3hmUEtv?=
 =?utf-8?B?dHlkQWo2RElYZnZYdVdPQkxjUEVEMzMwNDVLa0pCSGpQbTBXdHpCTjJBbkRS?=
 =?utf-8?B?V3dHNGVXMkVQR1hIN0EwNDFXZUM2SmN1em1mRXNpM0F2N3hpOVZWcEZKc3g4?=
 =?utf-8?B?VmVnRzBoQ3NGRVUyN3pkT3lPR2crWHhTYjZrQlRGd1pMYW5qVmhtSzBtanVv?=
 =?utf-8?Q?Me0ufd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:30.6831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 589ce9b0-eea3-4ff4-0fd1-08dd9c3a3166
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a range.
So, refactor it to support removing all matched registers in a calling
time.

And it is no matter to remove a non exist register, so remove the
__must_check prefix.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
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
index 2d4794ff3dea..d3e9a76d0cf6 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -163,7 +163,7 @@ static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
 
     prev_next_r->private = next_r->private;
     /*
-     * Not calling vpci_remove_register() here is to avoid redoing
+     * Not calling vpci_remove_registers() here is to avoid redoing
      * the register search
      */
     list_del(&next_r->node);
@@ -171,7 +171,7 @@ static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
     xfree(next_r);
 
     if ( !is_hardware_domain(pdev->domain) )
-        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
+        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
 
     return 0;
 }
@@ -561,34 +561,36 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
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
index e5e3f23ca39c..67a831d8e9a0 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -71,8 +71,8 @@ static inline int __must_check vpci_add_register(struct vpci *vpci,
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


