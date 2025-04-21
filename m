Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF1A94C7E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960843.1352566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVN-000796-SP; Mon, 21 Apr 2025 06:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960843.1352566; Mon, 21 Apr 2025 06:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVN-00076T-O0; Mon, 21 Apr 2025 06:19:45 +0000
Received: by outflank-mailman (input) for mailman id 960843;
 Mon, 21 Apr 2025 06:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVM-00057u-5H
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2414::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c47d924-1e78-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 08:19:42 +0200 (CEST)
Received: from MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::23)
 by SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 06:19:38 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::b0) by MW4P221CA0018.outlook.office365.com
 (2603:10b6:303:8b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 21 Apr 2025 06:19:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:37 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:34 -0500
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
X-Inumbo-ID: 9c47d924-1e78-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIjsrsAXzAJ/2H8L8KLTo2DPQPmLKM481ZTK4/yjf+TcKYabt+pa2mlyx8AnRzV3KPXtDZjel9sGvqf99f8Q4f6lIdXMpfUqNBo6baadCGJGTSKmlpmn+MPGvl3pJTa01cl1CC82U+rRdyE/qY3L8FPtun39jFnXdIBidUbf5ZhL1ph+4sH+n/JbIzlaojvtu/eoNCCtCbefY9IIyl5t5ycI27JsV/rT4+7WKuWuVpieCSeSawHrpiR60eyvAPR6LBd2CyzmJRPGUKWkLH6crzpPq2MUjQtYaae+s0iKmrandHSSZQ6Q1VuG280lH/bTvPArm6JOHJ0gM+I/Z31Tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+g97RZjgCjOmy0NNzS3RYBikm+tUCQTcif7ks3wE9M=;
 b=ev7D3gETMvQ18/tOIR+QsS2YxSjSlO0b/2ulkWtzjo7V0Lc/e+sXOjHeLw0EJcQJuKcosxdPgfCWTi55I9o+wBMLoYX4i/2ofH1r922MR+Uiza6pajgDKM+pL3sQvgWqieH7XuwEusTuMZdsOIbbLuW5luIpfWhViAzu0gCc1YcHJwwF+hQlHl8l8LWyTfOzNHdom5ZgIVzcRXZGez7LITt67XMQdfnt73mu5CQJcU4jNsIe6nw34qXGgX4jrpqtDQzSjX4DrSvjBr0zU6WHJVaRMo2hz0ZHi2oivUzaRaWvH1ZECA0MJBqn5H3Hu8dNvjJ1GMQ5nKXXdnSIrZ3vOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+g97RZjgCjOmy0NNzS3RYBikm+tUCQTcif7ks3wE9M=;
 b=SE6lSFv+hJnm/hrEpGS4nRppuL1Pknl+Ue1mSq1w2Ul23cZ1UEaG3GFtWY1oU38/RX+eAcRQeViWOWOABV2tLE2slpVlHinDdArnHyJK/1jVGu6ME5laziGptDJg2M7kiGYFk0BXTVJviS43Q4R/qXwW715uljJ/6owVZ66BBfs=
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
Subject: [PATCH v3 08/11] vpci: Refactor vpci_remove_register to remove matched registers
Date: Mon, 21 Apr 2025 14:19:00 +0800
Message-ID: <20250421061903.1542652-9-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|SJ0PR12MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 066e1ad3-c00d-4987-e05f-08dd809c7e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3A2Qzl5bytRZ0lMelFGWG5UVDhXM2htbVQ0bkg4cWRrMlAwblI2bnAxaFU1?=
 =?utf-8?B?ZjczSkVGc0MrMEY2Zmt0TDV5MlZaSm1ZUUxDZ1psYm1Lck0vRzFqYVNBcnZ5?=
 =?utf-8?B?VHI0ZFBpTEZKM1RLMHZDYnQrdFVhdFJHeTF3YlBZOE43SnBOeTloZUpKcUVD?=
 =?utf-8?B?OGIrYVRqdXgzY3JqU05CMlNwdnY2cTYvbnJ3Wk1aZGxTWmhVandFanJxc1hj?=
 =?utf-8?B?eVlkMkgyellNcUZjRWEwYjFlSG5GTzE4K2pHYkdHeWJLV3h6bUFPaTduN1Jk?=
 =?utf-8?B?eUhRZUdpUHlFMHlFTVZXQ1FiTG5ZRStIK21lcUJBUjNsejZpcWh3VlFaUnZB?=
 =?utf-8?B?WDZINkYwbXlFUmZEeE1pcVlQd2RjdHVsUmV6aEJmVkt3RDJXSk0vN2w2YWZX?=
 =?utf-8?B?TWpvNDg0ZHRHQTB0bXdVeVhMTzNrQzZxRUIyQ05UVkdUQmw0dDM2S0JmTHpr?=
 =?utf-8?B?V1B6VWJ1K1ArZ2tFZ01yMkZMMTl2c3ZWanZxazVrbGtBQXI1QmdMYXdqZjRX?=
 =?utf-8?B?UTl2d3V2MHNESlAyTW5QR1JYNlRPazhDZ0FScW5Ib3lMZUdEZ0hrQTNYZ2Rx?=
 =?utf-8?B?RTFMY0FEZ3NoeTdISmphOHVONUl6ZC84dUl5ak1HeThhbThxUzBGbUxzQUVR?=
 =?utf-8?B?SWRjSk4vWU4vL3lwRTdZUWs0ZksvL0M0OVN3WWltdkdISTBIYkVZeUVPSWVQ?=
 =?utf-8?B?WlJPVVZwUVBmWTdWWGpzK3pDYzNyZWpKdFUxMnZoWmVpTzgrb0tOSUd5MTA1?=
 =?utf-8?B?dEFVN3ZzWDNlWUY2VG1rd0RlbnRxTnJkTU5NZHV5ZHlLTjREUGJyNnZlR1Na?=
 =?utf-8?B?ZnQ4RVM2MWlUZVVIdGEwWVRYSlcyWVZBaG0vaXNwNWJpRnJaOVRFbmJScHNJ?=
 =?utf-8?B?SEdVSkN6WEFWL1F3UVF3Q2ZmL3pqUDhCOW96OXk5QTVUZkdTMytNTmJKODd1?=
 =?utf-8?B?bTc5ZjNac3FLQmE4aWZOVVVHVUY0Wi9Kb0pCRDJPL2w1RmphcUtyc2lXUW9J?=
 =?utf-8?B?L0tHTHZsWjAvU2pFWWZka0Nzd0haRkh6TnM0SFRSdXdxMTk1MisrT1pjYTZM?=
 =?utf-8?B?Qml5aldKZmxocnhvcXBYbzluRHVFZEhrNUdmZWNxVUJSV3RKZEdYNmxzckEy?=
 =?utf-8?B?UDk1cUVVZktXeHNBMTF4T2RTOFJpK3lIRE5vOHpZUmxhdTY1cXo1c3FROEF6?=
 =?utf-8?B?WkplUHVTNjhIaGhmUmZ0dGJSQjU5VmFpc09VUFR2R0luUU8ya2dTQ1hSMUY3?=
 =?utf-8?B?djcwZlhnMWRvLzFlbkNQejV6MHB2R3lPd1RLUngzOTAwSEV2Z2duR0xYTDNY?=
 =?utf-8?B?RzY3ZHNhbmdxbkJ0blgwMFF4dXZHMG43UFgxY3E0cVB2bWRCclc5bTNWZmVu?=
 =?utf-8?B?QllRMGtFT1BnSms1WmhzanhjUzk4dWcxNXRhVmRtbXdlZDhaT3JBV1ZpbmJK?=
 =?utf-8?B?bWE4WEFHeVJzTENaZ0NZcXBCSmx3VlNhUlNJYjdzMHFlRCtCV1J6TDNiYXpE?=
 =?utf-8?B?QzFEN3ROZjdjU2QrSG04SDFBSjJvekRJRGdEbHNyZTFPYm5GL3N6cjZvNUtX?=
 =?utf-8?B?amNOK2J3SnBjRVJLRE5WRWlJZWRDSnc2Y0gzV1pEaHBQYzhWTTd6Tk03Smhp?=
 =?utf-8?B?QWk3dTM3SUE2SjhFTTJGQTE2TTY0b25tNGtyTWRnNXN6QVlJQkZzQUV4VmZa?=
 =?utf-8?B?V1p4MUJnMS9LMHlQMWh4VXVLdmI1UjI1eUpmTEFZaHlnMHFxWGVncUFZb25Q?=
 =?utf-8?B?cEtKNVdydGVITWhQSE9CK1VYYjY1RkxtQ3ZKUGt6L0sxRVc2KzQ5azl2N0ho?=
 =?utf-8?B?TTRud1ozS3g4TVF6NFN5eWQ1VGl6Y1JjektPQlJ2bVA5MlllQXJzWmlndm85?=
 =?utf-8?B?SitIUytpMHVrdERJZWpzU05nYmtRdFdhWmZjWEtvVE51RmZWdlNSczNOWER3?=
 =?utf-8?B?dWhzeWF6ODJ4RGNjeVpsTGlCYWd1cit5bHZVZ0ljbEUrUE9VemtwZ3BKNTkw?=
 =?utf-8?B?c3N4YjBucjJJK1hGOVIrMVJhazlEM2ZwcVp0NGxHOTVjWkluMElJVWJhNVEy?=
 =?utf-8?Q?cShWPW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:37.8825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 066e1ad3-c00d-4987-e05f-08dd809c7e61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007

vpci_remove_register() only supports removing a register in a time,
but the follow-on changes need to remove all registers within a
range. And vpci_remove_register() is only used for test currently.
So, refactor it to support removing all matched registers in a
calling time.

And it is no matter to remove a non exist register, so remove the
__must_check prefix.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
v2->v3 changes:
* Add new check to return error if registers overlap but not inside range.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 tools/tests/vpci/main.c |  4 ++--
 xen/drivers/vpci/vpci.c | 34 ++++++++++++++++++++--------------
 xen/include/xen/vpci.h  |  4 ++--
 3 files changed, 24 insertions(+), 18 deletions(-)

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
index 8ff5169bdd18..904770628a2a 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -497,34 +497,40 @@ int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
-int vpci_remove_register(struct vpci *vpci, unsigned int offset,
-                         unsigned int size)
+int vpci_remove_registers(struct vpci *vpci, unsigned int start,
+                          unsigned int size)
 {
-    const struct vpci_register r = { .offset = offset, .size = size };
     struct vpci_register *rm;
+    unsigned int end = start + size;
 
     spin_lock(&vpci->lock);
     list_for_each_entry ( rm, &vpci->handlers, node )
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
+            struct vpci_register *prev =
+                list_entry(rm->node.prev, struct vpci_register, node);
+
             list_del(&rm->node);
-            spin_unlock(&vpci->lock);
             xfree(rm);
-            return 0;
+            rm = prev;
+            continue;
         }
-        if ( cmp <= 0 )
+
+        /* Return error if registers overlap but not inside. */
+        if ( rm->offset + rm->size > start && rm->offset < end )
+        {
+            spin_unlock(&vpci->lock);
+            return -EINVAL;
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
index 8e815b418b7d..4e226331fdf3 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -69,8 +69,8 @@ static inline int __must_check vpci_add_register(struct vpci *vpci,
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


