Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC1FA9D67F
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 02:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968872.1358310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Sy8-0008Ps-EG; Sat, 26 Apr 2025 00:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968872.1358310; Sat, 26 Apr 2025 00:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Sy8-0008NG-B5; Sat, 26 Apr 2025 00:00:32 +0000
Received: by outflank-mailman (input) for mailman id 968872;
 Sat, 26 Apr 2025 00:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P9o3=XM=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u8Sy6-0008N4-67
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 00:00:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7654b494-2231-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 02:00:28 +0200 (CEST)
Received: from BY5PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:180::48)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sat, 26 Apr
 2025 00:00:22 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::b2) by BY5PR13CA0035.outlook.office365.com
 (2603:10b6:a03:180::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Sat,
 26 Apr 2025 00:00:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 00:00:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 19:00:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 19:00:20 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 19:00:19 -0500
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
X-Inumbo-ID: 7654b494-2231-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9Vjj4pRLr4AbkZ+vBgXHVROVamfD6C9k14D+PStgPPuVU5aYY7OnIs+n7zuFqchv2hg6rtJPagaEeoeTzhBwnGui609xiVOXvwYGMUGuGAN8yNwVXNcpzGyU7V4SKv93Z4ONdg/qUmDpJmytpB9cn8hcSesSny/u4Yw8CAmYFPMvZnN/0m+MJbAME3T13TMykVntMGicLlKva/ymfn4evJ7GYpRY830LhguBrkswoTs5USzqu1bN9qpalq672XQBAp5iodIkUDPI+xSiau4k66m9hKh2Ffa328kG2KV/CL46MTY1T+5+j8D93zpSc6JpkOazBQKWWvq3Bp9Ka/ZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TndO7wIwFF/vKgNqTIQTB7DHEhbWcGym70m5yHQmNg=;
 b=nH8brZMWPKvBj37cgii4wR6VjBPvt0AQRggvj+ZqjEEnXeu6SIRQ063qOwRjeM9eCxBhdflotF3Oh4rYxm4M16WjPu5Pr0CMAjeK9GoPCYrZiM6XYAUn8NwDVFQ5bAu7DgxtQ90yD5GyAXw+lp4NamntplWACQtoDQD9PVY9uYjQKorhstXs6yS9ii3pkE/YqbIlFrVXFMEiW2A8I93gXGi6sOeDHZn7OElsHl8I+BJ5fgv0CXwg3tX/Mke3hZiXqWlTs0KZ+7+qLUoaRKnddj5JrQLzdr30B2dm2xbi3bZYJ+yHt6Iy0qoSdff8pGO0R/zVKvJP4rpN2AyLvry/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TndO7wIwFF/vKgNqTIQTB7DHEhbWcGym70m5yHQmNg=;
 b=OPHxowU81KrpAWjaC0xepzREbL79qAfrs3PZKisE9W6tILoG4R3iu7Nvc6mSs6vvj5JoIAZ3voRGqR1of9WfpixiSG1p42VKRoMMwZLfRV0JUp4isX3NDCFPymV3fnbad7UBzBZmacHADakSkRm0rfFiDt8hKZCkXiPUHYEWCaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v1 1/2] xen/page_alloc: address violation of Rule 14.3
Date: Fri, 25 Apr 2025 17:00:09 -0700
Message-ID: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2a541b-41f6-4eba-0c94-08dd8455567a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHNISyt1VU1kOVJPVUtqaEY5cGVDVTVZZ0Vwb2thaTdtRmV2ekpZcGRqMEh5?=
 =?utf-8?B?SEFWRkVHaUNJdU8xTmNVVkpOR2w3Y0pNMTZYSVZOYldGL3RYeWRQSzVPZi9H?=
 =?utf-8?B?M2MvTm00QXlwVktDSjZnTnpuZXRZamdBVHV1UTVmZUNDN0hqTG9qRndvY0E5?=
 =?utf-8?B?QVFEanJab1V5aWlSM1ZOME95NkJCRXdEbSt6Q2hpS04vYlZXMGpTWmhtckFX?=
 =?utf-8?B?Q0FydWhVMjd2c0ZxOENJUC95dDA3a2ZKbytCQjJNbkN4bVpLTFI3RWhIejFX?=
 =?utf-8?B?QnREK3F6MGlVQUFSUTM1dXArK1V6WUQ2QnVKRkF4S3FBdm9Yem9GWkMzSW1i?=
 =?utf-8?B?SlhRRkdWd2YvbStwQnoxQ0JRS1Z2VGE1dlRnK0hYYlRiRnJNNVJBdU9iTm9W?=
 =?utf-8?B?WWYzS2did203QjZzaU9mTWt4c3JkdmF6U3NmNGZ3L0hOZjdRVjQ4dlRsQ3Fl?=
 =?utf-8?B?UExTWGpZVU4rR3MwS2pLMlJDcjdRZWxFOWVuZGplejBPWGVMWTBsMDFKS01p?=
 =?utf-8?B?YmwzZjhMSkEweFV5V1VPQzFxTFd2VjZiWTdGVXl6NWNWRFRNQ2wva00wT2hD?=
 =?utf-8?B?aUlWMmZta1dBTGNkbjJhMWxQVjhNeTNWUGRlN2ZjaEh3TjhIRlllRkRMOWpw?=
 =?utf-8?B?UjdnSGk2T0psREMzUUpEc2hjOUJGa0pISzZFQWx6UjJHMEdMMEduajNaOTVm?=
 =?utf-8?B?S21IUktFODF5c2d1RkNkSGUyakQxRHdwc3dwSmRaMFJlaWxJL3pNcDZYbDl3?=
 =?utf-8?B?TGlzRGZjdURuRE0zRE45UWNMYTZpd1A5NDRjSVp3VjIrWjA4QTFzcGFiTzRn?=
 =?utf-8?B?TGJpaHhWNzJvR2pINE8weVVBcHlaT1F3T1NvenZXT21WOG9qNGo0VmcvZVNx?=
 =?utf-8?B?aDM3OTk5L2orN0xWTjFvelV0VEM3V1JyaDZIbXpaNEFSOUZmekdZNm9PeXRI?=
 =?utf-8?B?eE1BdzZnSDIzTjFhNG9meGRsc3BsazhlMXo2WUUySjd0L2pKM2NlNEhKQWkv?=
 =?utf-8?B?d3dOaGtuOVFhQXhiYTNLdVZkdm1TanpuSGV0V0lyRWU0aTZwazFvbXYvNEdQ?=
 =?utf-8?B?NTF1bmx0MGhjNHk2ek5PeUhpeWxLNHNDTWlrUy9ETGRiNGtJWENVaHFjZk5D?=
 =?utf-8?B?K3dXcTJhQVArY3BNMFN6bzRKczM0NDZoWnl6cEZ1SUJnSnRUdWJscEJ3cEdH?=
 =?utf-8?B?cjd2bVN6bUZhWXljaTIxRjdveGNaOG5IOW1RQUZrdUJkem1UeG1EMGxYWEhh?=
 =?utf-8?B?dExHNFJERGlzem8yNFRNUjRxUWc2ZjhlM2FtWm9LamtWb0pQeXpTY2VpOHV6?=
 =?utf-8?B?N1VicmUxRWNRWEx0cmZvUFdPSjdvUWRKWkgxSE5EeU1XZDBKOHRJalRPTVpj?=
 =?utf-8?B?SENsQjVUUi9weW1KQkVGK1BEK0NhRG5HL0toQ2dtZHBudzBhTjl4UlpXdGh2?=
 =?utf-8?B?c1dHL083MldYbFRuZmVTQjVVQmswVzkrYTRhV29KY3FLOVdyUlpTTGp3UFpC?=
 =?utf-8?B?MEJCbHFocVA3M1BheW5yZXpmR0M0MXlNOHB1WExIakRYV09HcFovODVJNGdK?=
 =?utf-8?B?TjZDYTN5ZW4rMVZkTFBHaVhwK1hTSnQ0dFJHZGR1dXh4dHZOaVZyYVJ2RXlX?=
 =?utf-8?B?dFBxY05PWGt6VmcvMWtFUUdLRXZQL2FtV0pQejU1NThiT2VxOStNTHU4eWNG?=
 =?utf-8?B?WFppbWY3OHYrZkF1S1dsZ29xeDlPSHpzelVkeU81bmRVL0ZvRkppRWxvbklz?=
 =?utf-8?B?bGhaRGN2bm5OQWtVSXpwVjQ0WkdmZEhBM29TWWhNeXc0MVQ5VWVONnVycmho?=
 =?utf-8?B?ZjNaS25pRmphR01qVFNmKzhKWVNBWmIvL0JGRE1IU0k2cVpnVFltbmRmcjlD?=
 =?utf-8?B?MHRnMWpPejZsc2IxKzhnYURpUlZqY3pYa20wd2RpSmRXQjVNVlpzU3FwR3R6?=
 =?utf-8?B?b2x2eFFnWkg3UzNLNVdidEc4Z1kvZjdpZVJ1b2dob0lsdEg4bTZwRlJFVlcv?=
 =?utf-8?B?VXlQbXFKcDh4L0xuV3RTRVIrL3ZrUXpjUmVKTU1TMG9zWGpoVm5aeUt4aWhW?=
 =?utf-8?Q?kX5Ee1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 00:00:21.2916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2a541b-41f6-4eba-0c94-08dd8455567a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Rule 14.3 states that "Controlling expressions shall not be
invariant".

Add a SAF comment to deviate the rule for build configurations without
CONFIG_LLC_COLORING enabled.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---

 docs/misra/safe.json    | 8 ++++++++
 xen/common/page_alloc.c | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e3489dba8e..9438815d19 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -116,6 +116,14 @@
         },
         {
             "id": "SAF-14-safe",
+            "analyser": {
+                  "eclair": "MC3A2.R14.3"
+            },
+            "name": "Rule 14.3: loop controlling expression is invariant due to the build configuration",
+            "text": "The controlling expression of a loop can be invariant in a specific build configuration."
+        },
+        {
+            "id": "SAF-15-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bd4538c28d..6d6ca7ca50 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2038,6 +2038,7 @@ static struct page_info *alloc_color_heap_page(unsigned int memflags,

     spin_lock(&heap_lock);

+    /* SAF-14-safe MISRA C R14.3 condition always false without LLC_COLORING */
     for ( i = 0; i < domain_num_llc_colors(d); i++ )
     {
         unsigned long free = free_colored_pages[domain_llc_color(d, i)];
--
2.47.0

