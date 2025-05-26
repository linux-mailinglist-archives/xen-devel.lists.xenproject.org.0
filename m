Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2FAC3D2B
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 11:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997344.1378260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPf-0004Re-3W; Mon, 26 May 2025 09:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997344.1378260; Mon, 26 May 2025 09:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJUPe-0004OM-V9; Mon, 26 May 2025 09:46:30 +0000
Received: by outflank-mailman (input) for mailman id 997344;
 Mon, 26 May 2025 09:46:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qdiq=YK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uJUPd-0003hN-Nf
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 09:46:29 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2405::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ae3034e-3a16-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 11:46:28 +0200 (CEST)
Received: from MN0P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::28)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Mon, 26 May
 2025 09:46:21 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:531:cafe::aa) by MN0P222CA0021.outlook.office365.com
 (2603:10b6:208:531::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 26 May 2025 09:46:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 09:46:21 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 04:46:19 -0500
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
X-Inumbo-ID: 4ae3034e-3a16-11f0-b893-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx6W9cl9NxFVafl8qTeA616ClSSeFeb92H8/IILu1F8ZAohB4AuOrQbUTZXNaj21+Jb3RUuy0mjIFb1rTr+W0JRcgu3ZQoEJqdPC40J2l3OYz3WtgaM9PE+gMY4bzyezCVCiuc4hRiabr0J5CtnthzcQtBuNPAeVlqhDphgpPePuwL6dTHtRlk5K9mgUTSTF8vUHJlaZ7rEoCOSgQpdaWTTgFIPvKrGWiP7Is7sQoILtZg0hQ6ylRVlV3K9n1XIZHqOWFUntnW+VBA2qIoB78XxvXJHpNwJceeqs6t98z345yAqdfEYkkVyKC0WeDsNpUHJgeGgCbEVfXFmarvPnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgWjqDD6QFXmhNcGRKv57wsy+lqnZUw9leCF2c/u6zQ=;
 b=dZIPHM89afK0nXY8JmNRrBMCIsAPXFVmj/SOYVERzB7sIigkP/WnFICmszTLEXO/qK3HHgl1fTx2cn0te9OIa5xMqMfFQviIAq2fqJefIbaZLF4ldgAh7KVCSrXseBwgrvvPJnjxIATIqdIcZDaygsbzbqCDgrUSLiECijO3YTkAZN/P05+0/IqxmqYF4mKFitG5Ss+wSQNF/+Ha6rxSa3/5zP+UpHAuN9Z9EjX1AuL9LQQ6bgWPElwqlSE3ExprsXhaGdqH7ikdTtCBJ4+oFLGYXks+LHqNGczO4SBVlsO5MmhVee+iSFyzUyTQ4sPVhEoZMoAQwAKglsznalKLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgWjqDD6QFXmhNcGRKv57wsy+lqnZUw9leCF2c/u6zQ=;
 b=Xu/YN7pKpzc6waIL9u+D3+WxzubgRKyA3PTeVA2h12uS6zq2Wra713eLIkXtydoiM999Wmf+mfACzmNIjaDVx46SpJrpDtUtf1OKjdWZEEjChfdHZWkFv2RV4CPZa8g3+CIWfbOFGe9ssNPGyBgJcag+WHGjW7hbT9TeAYa2fEw=
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
Subject: [PATCH v5 03/10] vpci/header: Emulate extended capability list for dom0
Date: Mon, 26 May 2025 17:45:52 +0800
Message-ID: <20250526094559.140423-4-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbac272-2ad3-45d2-ba38-08dd9c3a2bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVdGTHVFaG5JbEliK1NxZndBZ1pZeGIxQVpISWlDdDJxNTNHU3lOUU0xMVFr?=
 =?utf-8?B?WS95M2FLRVZVM2ZvNmlyYy93dHg3TDJnYzhZRXNkMmxCOHJITUI3OEd0ODFR?=
 =?utf-8?B?ZnJpbWxVWDcwd3NVYmdCcGdpd0l0RGM0TnFDZmNkMG1yYTFyMURQaFJITVRV?=
 =?utf-8?B?MEx3ckNJcGliMWZKQ0xpZitIYVMza2ozS2FIUlZTYVdqcVpCSk82Z1ZmUXFH?=
 =?utf-8?B?TllEa2x0NWc1VllyRGlQcUk2Z0RKNGtZbVQ1U1FOUW9vS0hjTDhHUW41bXNM?=
 =?utf-8?B?SUJSaGlvQUlkWnNLQXVIQW1xSVdMZnNONW9TVlVxTUU3YkJmcGdwMlBDUnFG?=
 =?utf-8?B?aVQvWDd0UVExeEpXcnA4S1N5OWRpanhJaWpwNUgxQnNhY2s0MEhOUWZwS0p0?=
 =?utf-8?B?V01XM083NlhUMWtQT2phN3lyR0Y3RjBmbFJMaVFqcWlKK2xtazNNOTJWYVQy?=
 =?utf-8?B?T1poeDlkd2cyQU41QzdjdVdXQ2dGeTJmZENqOGFQcUdPZmI0ZzNBZVN1eVh2?=
 =?utf-8?B?MVo0dGdlRms5UGE4N0VCK3RnRzM5NUlNRi9xWUVyVGxDbVBrNEJHYmJ1RDBw?=
 =?utf-8?B?R0wxZGNJSXdsczg1eksvOXBxdklERXJUU1dzZ012Z0svWGtVbHNXNDhNeDVa?=
 =?utf-8?B?SzNicVlncjcwOFNRZVdONFFmSDV0d0RIOU5CaVdreXlCYTJ1M3BPOVFQdXRK?=
 =?utf-8?B?MWJmZkxlUFpiZ2RuN3lZRXVrRmY1UFR0Ty9kaTVtVlN6c29PRGYxakpxWXYz?=
 =?utf-8?B?YndvcityNmt0eGd5ck9zaVlGb0tBZGpESVNtWmJaN3k4b2lVVGJWOWhrRHE4?=
 =?utf-8?B?bjQ1azZpTkNZN0RzZWduMDlxRGJSSVpsSy85Mk5KdWUwb1dlY1VTUXdyQWtl?=
 =?utf-8?B?anBVWm5zTnJVd0E4OGp5ak5aRDFOZnF3R1VuT3VwaU1yVTBBSWtlaHZrckVt?=
 =?utf-8?B?Y05ubThGY0ZCOVFkTGs0VjBPeDRhS0o5anRSbENnRnhDRDVvMXlRVnZUQnoz?=
 =?utf-8?B?ZkVIK29yS1VKeno2QUdOVzg3Rm5QM1hqZ2d5MEtzQ1BhS0xlb2NkYm9xQlZG?=
 =?utf-8?B?MHlJT04walBGTGFwcXZCYjI5SUVRM2tuVzFMbjZXZVBSUVcyOUE0dXlhYWVE?=
 =?utf-8?B?cjVYUUY4UjRqM1pnMHJJcmxsdXVKRDRlTlFvckdyRWRuMU5Wd3pNR1d1VEt1?=
 =?utf-8?B?MlNrb20vTyszaFN0aXFiWC9tK2U4UGEwdXcyOFZkemN2N28zU0hvQkwzQ0RQ?=
 =?utf-8?B?Y3NsSjloTEpXNUNqSWRGNXVjUCtWR1RZcFpuSzFrcG5aeFM0ZDVlTGJKc2ND?=
 =?utf-8?B?cHp3T2JndUR0TW9aNXNpVi9XYXN1NzBGTHIrK0lpSmg5Rk85a2ZQQkdDVzM5?=
 =?utf-8?B?dE81a0pYc2ZadVdGVjZneXRYUGtxYmE4OFFnQ3Q3VVQ1MHRlNGtmM202Rmk0?=
 =?utf-8?B?dWQwdGY3Q2tOMVZtR2hHOExFZmlteVpQd290a3E1eEM2c05Veitkb0FQNmdD?=
 =?utf-8?B?ZCtmeXV1SFByKzFKdk52VDg5b0grVUFxKzh5QVpvTkVIcytFZmxmb0xRd1RU?=
 =?utf-8?B?R0EzaDVrWkp0VWVjQytWSTd5bm95bjRBL3cyaHBiOVNMc05YelRMTHVkR0Ji?=
 =?utf-8?B?VEloL0tXRUsyZVdiSis3SEg2RmJhbXF6L0VYNGgrb2VyeCtRVVBoaW5MN3Zu?=
 =?utf-8?B?SHVKWHZOSHAvTDZyOHJOY3Q1VzlLbGxmMWhoTW1xRUJWS0R1L043WTZ5QmZV?=
 =?utf-8?B?ZTVIbGs1bFFTM2p4VlYzK3BTK3lFVG1sVFpJazkzbWxLTXp2dUczZzR2Ymh2?=
 =?utf-8?B?ankzVkVPeXliMDVYOG5hYW1vT2RrYXA1ck03dG9NU1M1NStrRngzM3k5TTQ5?=
 =?utf-8?B?ZW9rS2hna2FMOVkvbkNmeUtyWTVkaFZrL1VQY3hrYTVtdlZwSWxLNWYvbHFT?=
 =?utf-8?B?THJ1VytsYW5XVnlOVFJEN0xLM0FjaUFIZkc3OGN0eDdlcGlIR2dTamdESE4z?=
 =?utf-8?B?R1BMQzBQTTRrYWM5bVFtODVmVzNWT3R3MGEwWHU4YktPdS9RaUE2aDd2SUJv?=
 =?utf-8?Q?0C5i3O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:46:21.3753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbac272-2ad3-45d2-ba38-08dd9c3a2bd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790

Add a new function to emulate extended capability list for dom0,
and call it in init_header(). So that it will be easy to hide a
extended capability whose initialization fails.

As for the extended capability list of domU, just move the logic
into above function and keep hiding it for domU.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v4->v5 changes:
* Add check: if capability list of hardware has a overlap, print warning and return 0.

v3->v4 changes:
* Add check "if ( !header )   return 0;" to avoid adding handler for
  device that has no extended capabilities.

v2->v3 changes:
* In vpci_init_ext_capability_list(), when domain is domU, directly return after adding a handler(hiding all extended capability for domU).
* In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )" instead of "while ( pos && ttl-- )".
* Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.

v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/header.c | 47 ++++++++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c   |  6 +++++
 xen/include/xen/vpci.h    |  2 ++
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index d26cbba08ee1..4b2f761c9c24 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -836,6 +836,42 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
                                   PCI_STATUS_RSVDZ_MASK);
 }
 
+static int vpci_init_ext_capability_list(struct pci_dev *pdev)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
+
+    if ( !is_hardware_domain(pdev->domain) )
+        /* Extended capabilities read as zero, write ignore for guest */
+        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                 pos, 4, (void *)0);
+
+    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
+    {
+        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
+        int rc;
+
+        if ( !header )
+            return 0;
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
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
+    }
+
+    return 0;
+}
+
 static int cf_check init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -888,14 +924,9 @@ static int cf_check init_header(struct pci_dev *pdev)
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
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c27c..8474c0e3b995 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -267,6 +267,12 @@ void cf_check vpci_hw_write16(
     pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
 int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
                            unsigned int size, void *data, uint32_t ro_mask,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index fc8d5b470b0b..61d16cc8b897 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,6 +80,8 @@ void cf_check vpci_hw_write8(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.34.1


