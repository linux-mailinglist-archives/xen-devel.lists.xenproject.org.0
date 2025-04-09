Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613DA81D68
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943389.1342198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCe-0005YG-8y; Wed, 09 Apr 2025 06:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943389.1342198; Wed, 09 Apr 2025 06:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCd-0005Rb-Uz; Wed, 09 Apr 2025 06:46:27 +0000
Received: by outflank-mailman (input) for mailman id 943389;
 Wed, 09 Apr 2025 06:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCb-000466-Uz
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:25 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a800b89-150e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:46:24 +0200 (CEST)
Received: from BN9P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::13)
 by PH0PR12MB8032.namprd12.prod.outlook.com (2603:10b6:510:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 06:46:19 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::cb) by BN9P220CA0008.outlook.office365.com
 (2603:10b6:408:13e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Wed,
 9 Apr 2025 06:46:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:17 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:13 -0500
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
X-Inumbo-ID: 5a800b89-150e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7leqI3pKq5LIZALO3BuY9bD/tVypJifbnZ19eNKJodzqlOI7uY3HGl7kSJeeKhmUdnIYKDfIMO4wPgtq3gxL0ie2duVTABpdKCr4wKEIpQ7jov6kgQT74QBWGsRjcbom0o4LTVBa7nNxx46BCUPDe0E2FhA01l4xd0ZMBeD17Iopx5j+KWU76jVQDTKgUGx2MhrfQpKVIxSn3/Rj/YAyCK5+giNUlRSDKhGJGyIOz1HHmnPIBSUElAFTT8s15Hl19Tn1QSmcUtGhKg+XZn8mGVZtwjrZdYxU/nk/OinfCv2FAJU/OYoAt9Jy8QN9Jzwn8CkX2GWlyWA5LPXMOXneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmrW/1XJ49mm58ywHXQvOsKicr7wVr3EqcSs3ePGwBM=;
 b=uWrkoidUyhZ2LFDsdIysCoSv1rhUJW5HT7TGM/q2wv6/NkYuMAb6/o24SjOzIcQfB4Dtlxbw9IwbuZCEkBdU6af/Xj4Uc5Uf0MpaCZ9l7CePWQsHUjiZg3ayUZqCNwNnCGsSArWtMpPnkR3Lolr7lpNHdWG9mC3/SLvQQ65+qK3MwfYggIUK+qi/93LwrYIgwzMiSBDIhIJYzJd2QwX7xeroPbJtRCxik936Jt1r3h/KNzu8alKA7a4gQ/1ETzjR8Zk4ac/TRp1kuTznewjtTr6KgdzRgfE+4QLUxaDyw8ajujbuIN8dq9eVC6Ow1yJNFTZV+rlIP2B9QKUEIl3OZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmrW/1XJ49mm58ywHXQvOsKicr7wVr3EqcSs3ePGwBM=;
 b=FwAL1LGVAQeRUbjBcBIso2ySdQ20R39eB950ELvuyeEb7CGWt39c3uOS8Ajq+SN1pAZLNI2/BbaVQ65mTeJFwuvAYBCzLtp9bLRRduw6h6Dz5FmRvYjMB2PMu60YMHJpL5mTbkH+Yibqp6rC1ddp6VUVbb7wQdZHebUCylyOY6k=
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
Subject: [PATCH v2 5/8] vpci: Refactor vpci_remove_register to remove matched registers
Date: Wed, 9 Apr 2025 14:45:25 +0800
Message-ID: <20250409064528.405573-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409064528.405573-1-Jiqian.Chen@amd.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH0PR12MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 479017fd-2d5a-44a3-1a13-08dd77323b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkVTanlzYXpTVU9ZcW1HY3BrdG9XQjdEYnNWeFA4aHhlbTltQ3Z0YUtwempX?=
 =?utf-8?B?bW5td3NyamtMZll3MG80K0Qxc2hOTEE1U2VhVkZqRGlXQkRpRWtMUFBFUTI0?=
 =?utf-8?B?YlhuaEFiVXh0a2U5K0paTHo4dmtGTGVqV1hESEdqZkpybm9Hb0hkYVVxbXJp?=
 =?utf-8?B?cXpLb0ZKWDBvM3lpN3c2eDcvdEdSMDVaaUl0Ym56VldHQmVvOTZrNDlQUExy?=
 =?utf-8?B?SjR2ek1TU2RjMG83SnVKcDJNSFk0Q3QxS2hoaVpqa0IyZnp5M0FQeS9hV2Vk?=
 =?utf-8?B?TzV1c3hVQUkrYmpncG56QlZnS293RHFybnJBejhYWlpYL2Y4NGFVWWEvKzdt?=
 =?utf-8?B?Zm05YXYxOVB5ZmxWSnZCYUREWWhnRzhsL3V0ZzJaZjh1ZjRPQXg4NGppRTgv?=
 =?utf-8?B?bE9MbXFEZksyOGZLNVBYVXluTEtqeDU4NjJkSlJvMnFFbU96Y3N4UmZvZkYw?=
 =?utf-8?B?TUVJcG5IQ2NPZWd4UWlNelAydDZHODIwQXdDME45ZHhEYVFlS3ZqK1l4ZGtR?=
 =?utf-8?B?ZWtiMk13MWlrbEtmVnpsdy85d3VvNXkwKzhOUFVoaVd3dzYzdVVqZnZ3b2lI?=
 =?utf-8?B?MjRMdjRsZHI1RERDUkRxZG52N1hIUHhjSGVWektWL2RWVXQ5YXRUbUNtZEMy?=
 =?utf-8?B?Y05VYmJvczRFSm4xOVdBa1hHQzJnWGxlVE85cFJPUDFqNlo4QVp1OFFIdXBy?=
 =?utf-8?B?cWFNN0VZMFNMSWFFc0pBUlZqWXlsMXFJZVU3WFFDWGFYTnliME9MNVhHVmpq?=
 =?utf-8?B?MTlmdUpFcUVQczFDcXNOcnRWdERIWWYwMDBkeEN5ckEvamo5U1Vwem9CbzhI?=
 =?utf-8?B?eHFDV05uRlFPUnZyNi9KZmtJS1RXKzdqWFd5VStleGlkSlZHeitvYnlUYUtN?=
 =?utf-8?B?aWI5ZXplUzlMc2xFU1hmTXdQT3pSeW80amJNUlEwcGlhMHJ2bGR3S3FMUWY3?=
 =?utf-8?B?Ri9xQWRVL0QxWnFNbEZZY3JFTzBNSU1QVlJRZFRVMmh2Tis5elZaZnN2bkky?=
 =?utf-8?B?eFNtcHF5OG1ocXVwSXZPVEtFTTJ2OHZEYmloUi8rVDNDcGpkVTF4NnYxcUlw?=
 =?utf-8?B?djVyYUtyL0tUNEgveUNkcGljOHRwTUQrcHFzZlkwUWpFc1VmTm8yakYrMzlv?=
 =?utf-8?B?Zzl1eWduaWpsUlJ2bVBick95MDFCNGM2MStYd05sTlFHRWRxUk00Z0EydzQ3?=
 =?utf-8?B?M3FVSXFWTnN2RllTL01tbmMzaDVKODAwOFpEM3F1a3dMVEZFMXd3VWRvc3lB?=
 =?utf-8?B?QUhPeUZhMzdYQVZZSnhSK25UL24xQjRpbjl4Y04yY29LYjRmT3ZpU2JFOWln?=
 =?utf-8?B?QzZnMnRhQUlhQmRidk1Wb1huM3AzbHh0QUJmNUJHaDMzdjVydGsxakxvczBP?=
 =?utf-8?B?QmoyNlR4czA5VWdvL3BWUkVLZ2YrUENWRmVQSVpaK1o4WUlzako5SUI2YUl5?=
 =?utf-8?B?T04wMGdVTTZOT2x0SXJERGhvSkp4OXZtRGx6Tk1BMGhldHhwZ0xxR00vRytx?=
 =?utf-8?B?c1IydTQwejdXbzcwWWFQbGVydHZXeE5oZXVvMjRqdDhjZzZqbmR1d09hVndn?=
 =?utf-8?B?UktjdUU5UUhuWU9zQ21pTmM1M3JKQ1FFckxxS0gxRkFIdld0b0EzdStDSlFC?=
 =?utf-8?B?Z1g5UDJIc29wdWhySVFtcDk2RzlLaWdOb2hQemZOMFNrQ0l1cXM4Z09FVnpR?=
 =?utf-8?B?Qm1rTzR4RXRZbmltZzVGdlNwTEJJelp2ZlRHUjBDSVhoVW1VU2hTek1ldXMr?=
 =?utf-8?B?dk9JTlkwLzNvSllEWUlHV3BFek12M2R2cTZIWmNML3FjKzZTUFNKejBlWWNC?=
 =?utf-8?B?bHVPMHZ6d2t0bEhHOHlPRWNyamxaSVpUTkZFb1FiaTZzUm12b3gyUll3Ymgr?=
 =?utf-8?B?MldkVk9BL09acURJWE9YejFiWDlqcmdUVGhueGJoMmUxem80dHVmMzR0eTdJ?=
 =?utf-8?B?STNhYlFNbldUUXQwaDJsSHYyV2dzTGwvYmRjZGRtV0RLVCtkUjRac1FmQlpD?=
 =?utf-8?B?cXduZEN1ZGVqUUxiM2RhM3Z6RFhuZzhDTTByNHBiVWlaVURHS3pXdkFUS3Nh?=
 =?utf-8?Q?AyhQ/i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:17.9121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 479017fd-2d5a-44a3-1a13-08dd77323b12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8032

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a
range. And it is only used for test. So, refactor it to support
removing all matched registers in a calling time.

And it is no matter to remove a non exist register, so remove the
__must_check prefix.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 tools/tests/vpci/main.c |  4 ++--
 xen/drivers/vpci/vpci.c | 23 ++++++++++++-----------
 xen/include/xen/vpci.h  |  4 ++--
 3 files changed, 16 insertions(+), 15 deletions(-)

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
index f1f125bfdab1..115d3c5f0c84 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -418,34 +418,35 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
-int vpci_remove_register(struct vpci *vpci, unsigned int offset,
-                         unsigned int size)
+int vpci_remove_registers(struct vpci *vpci, unsigned int offset,
+                          unsigned int size)
 {
     const struct vpci_register r = { .offset = offset, .size = size };
     struct vpci_register *rm;
+    int rc = -ENOENT;
 
     spin_lock(&vpci->lock);
     list_for_each_entry ( rm, &vpci->handlers, node )
     {
         int cmp = vpci_register_cmp(&r, rm);
 
-        /*
-         * NB: do not use a switch so that we can use break to
-         * get out of the list loop earlier if required.
-         */
-        if ( !cmp && rm->offset == offset && rm->size == size )
+        if ( !cmp )
         {
+            struct vpci_register *prev =
+                list_entry(rm->node.prev, struct vpci_register, node);
+
             list_del(&rm->node);
-            spin_unlock(&vpci->lock);
             xfree(rm);
-            return 0;
+            rm = prev;
+            rc = 0;
         }
-        if ( cmp <= 0 )
+
+        if ( cmp < 0 )
             break;
     }
     spin_unlock(&vpci->lock);
 
-    return -ENOENT;
+    return rc;
 }
 
 /* Wrappers for performing reads/writes to the underlying hardware. */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 5016ded64d89..ee9163ca6a56 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -67,8 +67,8 @@ static inline int __must_check vpci_add_register(struct vpci *vpci,
                                   size, data, 0, 0, 0, 0);
 }
 
-int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
-                                      unsigned int size);
+int vpci_remove_registers(struct vpci *vpci, unsigned int offset,
+                          unsigned int size);
 
 /* Generic read/write handlers for the PCI config space. */
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
-- 
2.34.1


