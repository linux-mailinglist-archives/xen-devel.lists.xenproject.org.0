Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C5BFEF0A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 04:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148637.1480558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBl7R-0002WB-LK; Thu, 23 Oct 2025 02:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148637.1480558; Thu, 23 Oct 2025 02:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBl7R-0002UO-IY; Thu, 23 Oct 2025 02:32:01 +0000
Received: by outflank-mailman (input) for mailman id 1148637;
 Thu, 23 Oct 2025 02:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEuJ=5A=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1vBl7Q-0002UI-Dv
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 02:32:00 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c3eef3-afb8-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 04:31:57 +0200 (CEST)
Received: from BY3PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:217::6)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 02:31:51 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::b9) by BY3PR04CA0001.outlook.office365.com
 (2603:10b6:a03:217::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 02:31:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:31:50 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Oct
 2025 19:31:48 -0700
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
X-Inumbo-ID: 71c3eef3-afb8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciLZh4e4K/7BrdkYhML1CnuRNtAD3opaOUJJrtIs4lYiQQBbU24l2LzE4QVkLwxbTLcrMoYY3NtTxMBmL11Wg087A/v6R6oUL1R3e3EAur50bgO06sHbPfMrlHPCIdy+EoVKnRmdTd4pflGWkbY488EDYs0WZSoq0RxOZ9cj8/HP7XBHbw1qffmJRfSLiSAns0JPA81vngsNUZ5V3lxvZ5k2fRLzKU60We470LJMzGUhn+9trd9gA6eFVvUrGxtyYi7xdHXbwLbmGUtzQP8VI9zFGhr5QVvxsrlBwbIYNvvBelZDpzon4KzY884TBhMMbm2h1KyfZL7n40X2jT/jFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jzzlbktxq2hou8uT/J3+lh+jDqmABPI0cz1BM5u8Ppc=;
 b=FYFSgsjYXGFNJD+kPpgPp0ej7jWTWhnH8nNJ6uJIj9iXJGuc1Tp21B+9nFgBaTDyZ41Lzk7LTbeiTb94w1qc34Qtebfv1zCF0LMzQyVjkorIICTgSHKIReq/+GkrgcNoumiorBxV95B5uqDeMouehzO53ARLI6p9WiNxw0nSz1i6KWWrwn2DB6CbhEipRNtzEwRXaPu4nuMQSx3rjj5TigTctpe9SfSpF/42//1fX8MKq4nc9uzx0nnlRWDQcog0GLRBOErr7krQ3iOxlMpXYy/e7efmP//QkCZgGStuSMhcUkuOBvADU3uJa8yFM0BBqc//Mq5bKnjkZEdabk4rjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jzzlbktxq2hou8uT/J3+lh+jDqmABPI0cz1BM5u8Ppc=;
 b=oyRDoNqpblDq9f1H6QEYxWa/ZSSjaPCPmgGVIkPAmqcPI6eeLshW7nj6e9X3omMb0jJPSpc5yZf4zxwmhE7H1oPupmFY2QXN7ZMi+jNbbY9BusCuKL+voclELUhKK01Es2qNb53FZZ7npvUDdg87ZxEhlVmwy0Vm3eRN8EHVU3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 for-4.21 1/1] tools/libs/light: fix BAR memory address truncation
Date: Thu, 23 Oct 2025 10:31:28 +0800
Message-ID: <20251023023128.11589-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: 5beb4429-57ad-4644-175c-08de11dc527d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vpwAcexLl07bun7UmxADnjXv0+vtDGIBycEB1WiQvngUnwACZ8dgaBcBNw7L?=
 =?us-ascii?Q?fMp0n1g0oyy3KU8uPae3aLqnIVs54nkrbfdqzzyX7Uw5KCEzJdgWMi0IFCgy?=
 =?us-ascii?Q?br+FpOBqu+mMT+x1TsYoxAiUpHa59McLL8qbfGPv3Fc74VYY6/uJxmV5ocyk?=
 =?us-ascii?Q?mybeOk+uzXGwRkAE80ie3TpSB4YyoeWMvJYl/yGGOMGwKgf/cu4jD1G5V3qj?=
 =?us-ascii?Q?lkmk9iSXNYlY7uUmHPcDIgRfyiRcCqKK1W/iosPpm0Jw5CdztzIrnGLssiYh?=
 =?us-ascii?Q?8Vr+MWTlYNx6uxIS3q97MeLdkEp+8aGpuuEsYSVeBj7bOlRd4LOdmpFe2cwe?=
 =?us-ascii?Q?u+FutFm2yZkepXio5pgr2a7RBuaLo4jRC2xryOWJvXTPgXlTT82d1HUxviLg?=
 =?us-ascii?Q?EdBuMGP/O+fXN98zpFugO7E/Rg47nNhkRBOZGKEtZ3LuS+DKdHJw3M7KcpC6?=
 =?us-ascii?Q?J1pxl16G+3DbxxUGsFXT3biq57JNXp1+8cGWB8gVQdr8R68RqZ3eaGXFmkwr?=
 =?us-ascii?Q?fcCuhTc1gSBkhtayQZ1qBpqvBDESHBFsTIhdKxFtBD3V/pIxTK8QFcuT6d1/?=
 =?us-ascii?Q?rtQYJCIXQzOgUmFQLRJGZGo4XU8M6H8IsoJveYOIYAnRabxoveW0vRT3Joni?=
 =?us-ascii?Q?+2AtwsQyZpoKTXXzCg2bwwZKQ73cbKK/+HAxsmvZ5D1z1ZBAxZNbZF1gSclw?=
 =?us-ascii?Q?zYlGk97mwu/1EAtDnr1DHMSLTX8QyKfYwsngklBhMndE1+2qniIo/u25ha5M?=
 =?us-ascii?Q?dZidWz8oBEORiUpidRJVIRK67e/Qj14okGxI2ooFO5Y+clmbaglqQE6tN9WZ?=
 =?us-ascii?Q?PRCcr6dw1tZS3t+mAc6yF8ICz1yBE/lpnYO96FE+ntt1ynmISJyJvoO0Jf+G?=
 =?us-ascii?Q?VtVe0g8w1kSb4MoxJbx6Kvhb0S1Wj3EFS1KZfMhXJXB/85Y0kUEifvq/CeYH?=
 =?us-ascii?Q?w4UKavo7YHo+iXSFW4XJAAm50NT99/vSXuIKvjicn+Ak3FDYlP5sTRttdinQ?=
 =?us-ascii?Q?tPRwXNFg1AwNlmRUBdgKZOJLOyzGDEmYkaP24mwwdCARJJjg33RS1dUNKrO0?=
 =?us-ascii?Q?rAjXeM0A6A7r7v9J1PfmAMEemR1inCvTq2iRAXZIX+Sq0B1OhF2zeopqIUcS?=
 =?us-ascii?Q?NzrxG/2HMcPtuRIhx8cnHmYaCW1uyBVj1t98LQrmj7g6KOA55chuCCkvj+24?=
 =?us-ascii?Q?LWwhXd7YtA/TVINnHriqn1pCzNvakO8qcgSDVIzboRHscmj9q3K8zrlEAaCI?=
 =?us-ascii?Q?lty5ts0p91lhn71YseRn4H0c4KnlY4bxMkOyAtNg6hEWVmBN7yh2nUV+o1ss?=
 =?us-ascii?Q?RVw6xojg8ZtLtb7iEmr+PEaAn1F0aR8nEZm8UbWgl8rJKTNBEkR6XCyhqtiZ?=
 =?us-ascii?Q?Az1xvB70B/YYzll+RLsFd+nw475uQaWSDq7II8j8w4vIp/JP9b4sL+cJn+1R?=
 =?us-ascii?Q?uFFX4TN3VqgycAH5Hxe2m7t9QDXvooT3nr3bIlVHdCjNJK3HQZleM8nbsQKz?=
 =?us-ascii?Q?cinDWa9nVO87Sp8Mjgo5wskWPUnsyzdd2LYzkeq5QnyYqOI7jENmOCl3qRBR?=
 =?us-ascii?Q?8xZ2TEXidRslnRMrSYs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:31:50.6284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beb4429-57ad-4644-175c-08de11dc527d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346

64-bit BAR memory address is truncated when removing a passthrough
pci device from guest since it uses "unsigned int".

So, change to use 64-bit type to fix this problem.

Fixes: b0a1af61678b ("libxenlight: implement pci passthrough")
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Juergen Gross <jgross@suse.com>
---
v2->v3 changes:
* Split a line that is too long.
* No functional chianges.
* Add Juergen's Reviewed-by.

v1->v2 changes:
* Change to use uint64_t instead of unsigned long long and change
  corresponding fscanf and LOGED parameters.
---
 tools/libs/light/libxl_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2ea2caeb6624..49d272d0de65 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -2001,7 +2001,8 @@ static void pci_remove_detached(libxl__egc *egc,
 {
     STATE_AO_GC(prs->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned int start = 0, end = 0, flags = 0, size = 0, irq = 0;
+    uint64_t start = 0, end = 0, flags = 0, size = 0;
+    unsigned int irq = 0;
     int i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
@@ -2031,7 +2032,8 @@ static void pci_remove_detached(libxl__egc *egc,
     }
 
     for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
+        if (fscanf(f, "0x%"SCNx64" 0x%"SCNx64" 0x%"SCNx64"\n",
+                   &start, &end, &flags) != 3)
             continue;
         size = end - start + 1;
         if (start) {
@@ -2040,7 +2042,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                  size, 0);
                 if (rc < 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_ioport_permission error 0x%x/0x%x",
+                          "xc_domain_ioport_permission error %#"PRIx64"/%#"PRIx64,
                           start,
                           size);
             } else {
@@ -2050,7 +2052,7 @@ static void pci_remove_detached(libxl__egc *egc,
                                                 0);
                 if (rc < 0)
                     LOGED(ERROR, domid,
-                          "xc_domain_iomem_permission error 0x%x/0x%x",
+                          "xc_domain_iomem_permission error %#"PRIx64"/%#"PRIx64,
                           start,
                           size);
             }
-- 
2.34.1


